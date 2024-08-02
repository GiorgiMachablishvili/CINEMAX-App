//
//  Movie.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import Foundation
import CoreData

struct MovieData: Codable {
    let title: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

extension MovieData {
  func toMovieEntity(context: NSManagedObjectContext) -> MovieEntity {
    let entity = MovieEntity(context: context)
    entity.title = title
    entity.overview = overview
    entity.popularity = popularity
    entity.posterPath = posterPath
    entity.releaseDate = releaseDate
    entity.voteAverage = voteAverage
    return entity
  }
}
