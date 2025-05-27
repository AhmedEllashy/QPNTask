//
//  RemoteMoviesRepository.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation

final class RemoteMoviesRepository: MovieRepository{
    
    private let apiClient: APIClient
    private let fileCache: FileCacheService

    init(apiClient: APIClient, fileCache: FileCacheService) {
        self.apiClient = apiClient
        self.fileCache = fileCache
    }
    
    func fetchMovies() async throws -> [Movie] {
        let movies = fileCache.load()
        if !movies.isEmpty{
            return fileCache.load()
        }else{
            let moviesDTO: MoviesResponse = try await apiClient.request(
                url: AppEndpoints.moviesEndpoint,
                responseType: MoviesResponse.self
            )
                let movies = moviesDTO.toDomain()
                fileCache.save(movies) // Save to file
                return movies
            }

    }
}
