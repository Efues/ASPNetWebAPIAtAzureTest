//
//  Router.swift
//  iOS
//
//  Created by Toshiyasu Shimizu on 2019/03/20.
//  Copyright © 2019 Efues. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    // エンドポイントごとの定数
    case getAllList
    
    static let baseURLString = "https://aspnetwebapiatazuretest.azurewebsites.net/api"

    // エンドポイントごとのリクエストメソッド
    var method: HTTPMethod {
        switch self {
        case .getAllList:
            return .get
        }
    }
    
    // TODO: エンドポイントごとのパス
    var path: String {
        switch self {
        case .getAllList:
            return "/contacts"
        }
    }
    
    // MARK: - URLRequestConvertible
    // URLRequestの生成
    func asURLRequest() throws -> URLRequest {
        // リクエストパラメータの取得
        let parameters: Parameters? = {
            switch self {
            case .getAllList:
                return nil
            }
        }()
        
        // URLRequestを作成
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        // リクエストパラメータのエンコーダ
        let encoding: ParameterEncoding = {
            switch self {
            case .getAllList:
                return URLEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }

}
