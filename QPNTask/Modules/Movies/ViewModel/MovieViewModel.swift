//
//  MovieViewModel.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation

final class MovieViewModel: ObservableObject{
    enum ViewState: Equatable{
        case idle
        case loading
        case success(String)
        case failure(String)
    }
    @Published var movies: [Movie] = []
    @Published var state: ViewState = .idle
    private let movieUseCaseImpl: MovieUseCase
    
    init(movieUseCase: MovieUseCase) {
        self.movieUseCaseImpl = movieUseCase
    }
    
    @MainActor
    func fetchMovies() async{
        state = .loading
        
        do{
           let movies = try await movieUseCaseImpl.execute()
            self.movies = movies
            state = .success("")
        }catch{
            print(error.localizedDescription)
            state = .failure(error.localizedDescription)
        }
    }
}
