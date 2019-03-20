//
//  ContactEntity.swift
//  iOS
//
//  Created by Toshiyasu Shimizu on 2019/03/20.
//  Copyright © 2019 Efues. All rights reserved.
//

import Foundation

struct ContactEntity: Codable  {
    var name: String
    var address: String
    var phone: String
    
    init(name: String, address: String, phone: String)
    {
        self.name = name
        self.address = address
        self.phone = phone
    }
}
