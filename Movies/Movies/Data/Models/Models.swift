//
//  Models.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import Foundation

//{"adult":false,"backdrop_path":"/mRGmNnh6pBAGGp6fMBMwI8iTBUO.jpg","genre_ids":[27,9648,53],"id":968051,"original_language":"en","original_title":"The Nun II","overview":"In 1956 France, a priest is violently murdered, and Sister Irene begins to investigate. She once again comes face-to-face with a powerful evil.","popularity":4160.929,"poster_path":"/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg","release_date":"2023-09-06","title":"The Nun II","video":false,"vote_average":7,"vote_count":776}

struct Movie: Codable {
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]  
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Float
    var vote_count: Int
}
  
struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}


