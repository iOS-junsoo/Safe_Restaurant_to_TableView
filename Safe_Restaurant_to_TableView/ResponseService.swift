//
//  ResponseService.swift
//  Safe_Restaurant_to_TableView
//
//  Created by 준수김 on 2021/10/14.
//

import Foundation

struct ResponseService: Decodable {
    var Grid_20200713000000000605_1: Grid_20200713000000000605_1
}

struct Grid_20200713000000000605_1: Decodable {
    var totalCnt: Int
    var startRow: Int
    var endRow: Int
    var result: Result
    var row: [Row]
}

struct Result: Decodable {
    var code: String
    var message: String
}

