//
//  APIModel.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 16.07.2022.
//

import Foundation
import Alamofire

struct APIModel: Codable {
        let email, token: String
        let userID: Int

}
enum CodingKeys: String, CodingKey, Decodable {
    case email = "email"
    case token = "token"
    case userID = "userID"
}



