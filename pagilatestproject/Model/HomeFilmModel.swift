//
//  HomeFilmModel.swift
//  pagilatestproject
//
//  Created by Jonathan Punongbayan on 10/26/26.
//

import Foundation

struct HomeFilmModel: Codable, Identifiable {
    let filmId: Int
    let title: String
    let rentalRate: Float
    let categoryName: [String]
    
    var id: Int {
        filmId
    }
    
    enum CodingKeys: String, CodingKey {
        case filmId = "film_id"
        case title
        case rentalRate = "rental_rate"
        case categoryName = "category_name"
    }
}
