//
//  FetchAllMoviesUseCase.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import Foundation

import Foundation

protocol FetchAllMoviesUseCase {
    func execute() async -> [Movie]
}

struct DefaultFetchAllMoviesUseCase: FetchAllMoviesUseCase {
    let repository: MoviesProtocol

    init(repository: MoviesProtocol = MoviesRepository()) {
        self.repository = repository
    }

  func execute() async -> [Movie] {
      return await repository.getMovies() ?? []
  }
}
