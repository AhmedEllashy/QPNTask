//
//  MovieViewModelTests.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import XCTest
@testable import QPNTask

final class MovieViewModelTests: XCTestCase {

    func test_fetchMovies_successfullyUpdatesMovies() async {
        let mockUseCase = MockMovieUseCase()
        mockUseCase.stubbedMovies = [
            Movie(id: 1, title: "Batman Justice", posterURL: URL(string: "https://example.com/1.jpg"), overview: "Gotham savior"),
            Movie(id: 2, title: "Superman The Big", posterURL: URL(string: "https://example.com/2.jpg"), overview: "Krypton legend")
        ]
        let viewModel = MovieViewModel(movieUseCase: mockUseCase)

        await viewModel.fetchMovies()

        XCTAssertEqual(viewModel.movies.count, 2)
        XCTAssertEqual(viewModel.movies[0].title, "Batman Justice")
        XCTAssertEqual(mockUseCase.fetchMoviesCallCount, 1)
    }

    func test_fetchMovies_handlesError() async {
        let mockUseCase = MockMovieUseCase()
        mockUseCase.shouldThrowError = true
        let viewModel = MovieViewModel(movieUseCase: mockUseCase)

        await viewModel.fetchMovies()

        XCTAssertEqual(viewModel.movies.count, 0)
        XCTAssertEqual(mockUseCase.fetchMoviesCallCount, 1)
    }
}
