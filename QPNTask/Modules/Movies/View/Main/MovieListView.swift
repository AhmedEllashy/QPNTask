//
//  MoviesView.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import SwiftUI
import Factory

struct MovieListView: View {
    @StateObject var viewModel: MovieViewModel
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle(AppStrings.movies.rawValue.capitalized)
                .navigationBarTitleDisplayMode(.large)
                .task {
                    await viewModel.fetchMovies()
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Loading...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        case .failure(let errorMessage):
            VStack {
                Text("Failed to load movies.")
                    .font(.headline)
                    .foregroundColor(.red)
                Text(errorMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Button("Retry") {
                    Task {
                        await viewModel.fetchMovies()
                    }
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success:
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        NavigationLink(destination: MovieDetailsVCWrapper(movie: movie)) {
                            MovieCardView(
                                moviePosterURL: movie.posterURL,
                                movieName: movie.title
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    MovieListView(viewModel: Container.shared.movieViewModel())
}
