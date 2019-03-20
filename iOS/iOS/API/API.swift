//
//  API.swift
//  iOS
//
//  Created by Toshiyasu Shimizu on 2019/03/20.
//  Copyright © 2019 Efues. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    // 一覧を取得するリクエスト
    static func getAllList(handler: (([ContactEntity]) -> Void)?) {
        let request =  Alamofire.request(Router.getAllList)
        debugPrint(request)
        
        request.responseData { response in
            if let error = response.error {
                print("\(#function) error: \(error)")
                return
            }
            
            guard let data = response.data else {
                print("\(#function) error: empty response")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            guard let result = try? decoder.decode([ContactEntity].self, from: data) else {
                print("\(#function) error: invalid json")
                return
            }
            
            // 結果のデータを渡してコールバックを実行
            handler?(result)
        }
    }
}
