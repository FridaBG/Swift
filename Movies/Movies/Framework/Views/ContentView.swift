//
//  ContentView.swift
//  Movies
//
//  Created by Frida Bailleres González on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
          List(viewModel.moviesArray, id: \.id) { movie in
              HStack {
                if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path )"),
                     let data = try? Data(contentsOf: url),
                     let uiImage = UIImage(data: data) {
                      Image(uiImage: uiImage)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .padding(.top, 8)
                          .frame(width: 100, height: 150)
                          .cornerRadius(5)
                  }
                  
                  VStack(alignment: .leading, spacing: 10) {
                    
                      Text(movie.title)
                          .foregroundColor(.red)
                          .font(.system(size: 20))
                    
                    Text("Release Date: \(movie.release_date)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    Text("Popularity: \(movie.popularity)")
                        .font(.subheadline)
                        .foregroundColor(.blue)

                      
                      Text("Rating: \(movie.vote_average)")
                          .font(.subheadline)
                          .foregroundColor(.blue)
                      
//                      Text(movie.overview)
//                          .font(.body)
//                          .foregroundColor(.gray)
                    
              
                  }
                  .padding(.leading, 10)
                  
                  Spacer()
              }
              .padding(.vertical, 8)
          }
            .onAppear {
                Task {
                    await viewModel.fetch()
                }
            }
            .navigationTitle("Popular Movies")
        }
    }
}


#Preview {
    ContentView()
}
