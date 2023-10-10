//
//  ContentViewModel.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var moviesArray = [Movie]()
    
    private let fetchAllMoviesUseCase: FetchAllMoviesUseCase

    init(fetchAllMoviesUseCase: FetchAllMoviesUseCase = DefaultFetchAllMoviesUseCase()) {
        self.fetchAllMoviesUseCase = fetchAllMoviesUseCase
    }

    func fetch() async {
        moviesArray = await fetchAllMoviesUseCase.execute()
    }
}
