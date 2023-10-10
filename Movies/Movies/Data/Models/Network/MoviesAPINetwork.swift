//
//  MovieAPINetwork.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import Foundation
import Alamofire


class MoviesAPINetwork {
    static let shared = MoviesAPINetwork()

    private let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjhkZDc1NmUzMmI4YWNlZjYyZmQ2YzMwZmQwY2NmOSIsInN1YiI6IjY0ZWI5MzhiZTg5NGE2MDEzYmIxNjNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6cGDTI8wql15qnVZErrd_6QRNaiRAi74pRD0LfOzVZM"

    func getMovies() async -> [Movie]? {
      
      
        let url = "\(API.base)/discover/movie?include_video=false&sort_by=popularity.desc"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)",
            "Accept": "application/json"
        ]

        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        let response = await taskRequest.serializingData().response
        
      switch response.result {
      case .success(let data):
          // Imprime la respuesta en formato String.
          if let jsonString = String(data: data, encoding: .utf8) {
              print(jsonString)
          }
          
          do {
              let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
              return moviesResponse.results
          } catch {
              debugPrint("Decoding error: \(error)")
              return nil
          }
      case let .failure(error):
          debugPrint(error.localizedDescription)
          return nil
      }
    }
}
    
