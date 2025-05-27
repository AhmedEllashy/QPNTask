//
//  MovieUseCase.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation


protocol MovieUseCase{
    func execute() async throws -> [Movie]
}

final class MovieUseCaseImpl: MovieUseCase{
    private let remoteMovieReposoitory: RemoteMoviesRepository
    
    init(remoteMovieReposoitory: RemoteMoviesRepository) {
        self.remoteMovieReposoitory = remoteMovieReposoitory
    }
    
    func execute() async throws -> [Movie] {
        return try await remoteMovieReposoitory.fetchMovies()
        
    }
    
    
}
