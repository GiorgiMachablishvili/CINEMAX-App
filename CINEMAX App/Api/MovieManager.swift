//
//  MovieManager.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import Foundation

protocol MovieManagerProtocol: AnyObject {
  func fetchMovies(completion: @escaping ([MovieData]) -> Void)
}

class MovieManager: MovieManagerProtocol {
  func fetchMovies(completion: @escaping ([MovieData]) -> Void) {
      
    let apiKey = "778eb3349e13f63150533983bc20b715"
    let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=en-US&page=1"
    NetworkManager.shared.get(url: url) { (result: Result<[MovieData], Error>) in
      switch result {
      case .success(let countries):
        completion(countries)
      case .failure(let failure):
        print(failure)
      }
    }
  }
}
