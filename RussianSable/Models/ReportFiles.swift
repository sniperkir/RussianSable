//
//  ReportFiles.swift
//  RussianSable
//
//  Created by Кирилл Корнаков on 20.02.2021.
//

import Foundation

struct ReportFiles: Decodable {
    
    let fdate: String
    let fname: String
    let ftype: String
    
    enum CodingKeys: String, CodingKey {
        case fdate = "fdate"
        case fname = "fname"
        case ftype = "ftype"
    }
}

struct FilesResponse: Decodable {
    let data: [ReportFiles]
}
