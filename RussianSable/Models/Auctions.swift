//
//  Auctions.swift
//  RussianSable
//
//  Created by Кирилл Корнаков on 14.03.2021.
//

import Foundation

struct Auctions: Decodable {
    
    let skinCode: String
    let skinSort: String
    let skinType: String
    let skinSize: String
    let skinPrice: String
    
    enum CodingKeys: String, CodingKey {
        case skinCode = "birka"
        case skinSort = "sort"
        case skinType = "type"
        case skinSize = "size"
        case skinPrice = "price"
    }
}

struct AuctionResponse: Decodable {
    let data: [Auctions]
}
