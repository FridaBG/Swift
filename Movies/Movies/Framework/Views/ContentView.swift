//
//  ContentView.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
  
//  init() {
//      viewModel.moviesArray = [
//          Movie(
//              adult: false,
//              backdrop_path: "/path_to_backdrop.jpg",
//              genre_ids: "12,14,16",
//              id: 1,
//              original_language: "en",
//              original_title: "Original Test Movie 1",
//              overview: "This is a test movie.",
//              popularity: 5.5,
//              poster_path: "/path_to_poster.jpg",
//              release_dat: "2022-10-10",
//              title: "Test Movie 1",
//              video: false,
//              vote_average: 5,
//              vote_count: 1000
//          ),
//          Movie(
//              adult: false,
//              backdrop_path: "/path_to_backdrop2.jpg",
//              genre_ids: "12,14,16",
//              id: 2,
//              original_language: "en",
//              original_title: "Original Test Movie 2",
//              overview: "This is another test movie.",
//              popularity: 6.0,
//              poster_path: "/path_to_poster2.jpg",
//              release_dat: "2022-11-11",
//              title: "Test Movie 2",
//              video: false,
//              vote_average: 6,
//              vote_count: 1500
//          )
//      ]
//  }


  
    var body: some View {
        NavigationView {
            List(viewModel.moviesArray, id: \.id) { movie in
                HStack {
                    Text(movie.title)
                        .bold()
                    VStack {
                        Text(movie.overview)
                            .foregroundColor(.black)
                            .padding(.bottom)
                    } .padding()
                }
                .foregroundColor(.gray)
            }
            .onAppear {
                Task {
                    await viewModel.fetch()
                }
            }
            .navigationTitle("Movie List")
        }
    }
}


#Preview {
    ContentView()
}
