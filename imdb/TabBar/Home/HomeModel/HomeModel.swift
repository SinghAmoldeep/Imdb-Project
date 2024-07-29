//
//  HomeModel.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import Foundation

struct DataList: Codable {
    let score: Double?
    let show: Show
}

struct Show: Codable {
    let name: String?
    let type: String?
    let language: String?
    let genres: [String]?
    let image: Img
    let summary: String?
}

struct Img: Codable {
    let original: String?
}
