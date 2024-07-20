//
//  Movie.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import Foundation
struct Movie: Codable {
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
