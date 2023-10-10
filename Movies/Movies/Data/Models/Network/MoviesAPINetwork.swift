//
//  MovieAPINetwork.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import Foundation

import Alamofire
import Foundation

class MoviesAPINetwork {
    static let shared = MoviesAPINetwork()
    
  func getMovies(url: URL) async -> [Movie]? {
      let taskRequest = AF.request(url, method: .get).validate()
      let response = await taskRequest.serializingData().response
      
      switch response.result {
      case .success(let data):
          do {
              return try JSONDecoder().decode([Movie].self, from: data)
          } catch {
              debugPrint("Decoding error: \(error)")
              return nil
          }
      case let .failure(error):
          debugPrint(error.localizedDescription)
          return nil
      }
  }
  
    
//    func getUser(url: URL) async -> User? {
//        let taskRequest = AF.request(url, method: .get).validate()
//        let response = await taskRequest.serializingData().response
//
//        switch response.result {
//        case .success(let data):
//            do {
//                return try JSONDecoder().decode(User.self, from: data)
//            } catch {
//                return nil
//            }
//        case let .failure(error):
//            debugPrint(error.localizedDescription)
//            return nil
//        }
//    }
}
