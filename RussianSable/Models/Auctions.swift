//
//  Auctions.swift
//  RussianSable
//
//  Created by Кирилл Корнаков on 14.03.2021.
//

import Foundation

struct Auctions: Decodable {
    
    let auctionNumber: String
    let auctionCode: String
    let auctionStatus: Bool
    let auctionDate: String
    
    
    enum CodingKeys: String, CodingKey {
        case auctionNumber = "number"
        case auctionCode = "code"
        case auctionStatus = "status"
        case auctionDate = "date"
        
    }
}

struct AuctionResponse: Decodable {
    let data: [Auctions]
}
