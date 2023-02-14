//
//  SendEmailResponse.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 14/2/23.
//

import Foundation

struct SendEmailResponseModel: Decodable{
    let status: Int?
    let message: String?
    let data: DataSendEmailResponseModel?
}
struct DataSendEmailResponseModel: Decodable{
    let code: String?
}
