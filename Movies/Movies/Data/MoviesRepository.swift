//
//  MovieRepository.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import Foundation

import Foundation
// 'https://api.themoviedb.org/3/discover/movie?include_video=false&sort_by=popularity.desc
struct API {
    //static let base = "https://api.themoviedb.org/3/discover/movie?include_video=false&sort_by=popularity.desc"
    static let base = "https://api.themoviedb.org/3"

    
}

protocol MoviesProtocol {
    func getMovies() async ->[Movie]?
//    func getUser(idUser: Int) async -> User?
}

class MoviesRepository: MoviesProtocol {
    let nservice: MoviesAPINetwork
    
    init(nservice: MoviesAPINetwork = MoviesAPINetwork.shared) {
        self.nservice = nservice
    }
    
    func getMovies() async -> [Movie]? {
        return await nservice.getMovies()
    }
}


//    func getUser(idUser: Int) async -> User? {
//        print("\(API.base)/\(idUser)")
//        return await nservice.getUser(url: URL(string: "\(API.base)/\(idUser)")!)
//    }
