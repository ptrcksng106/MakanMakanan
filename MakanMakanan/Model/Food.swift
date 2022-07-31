//
//  Food.swift
//  MakanMakanan
//
//  Created by Patrick Sinaga on 29/07/22.
//

import Foundation

struct Food: Codable {
    let categories: [DataFood]
}

struct DataFood: Codable {
    let strCategory: String
    let strCategoryThumb: URL
    let strCategoryDescription: String
}
