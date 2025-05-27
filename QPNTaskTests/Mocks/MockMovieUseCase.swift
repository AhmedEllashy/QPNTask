//
//  MockMovieUseCase.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//


import Foundation
@testable import QPNTask

final class MockMovieUseCase: MovieUseCase {

    var fetchMoviesCallCount = 0
    var shouldThrowError = false
    var stubbedMovies: [Movie] = []

    func execute() async throws -> [Movie] {
        fetchMoviesCallCount += 1
        if shouldThrowError {
            throw URLError(.notConnectedToInternet)
        }
        return stubbedMovies
    }
    

}
