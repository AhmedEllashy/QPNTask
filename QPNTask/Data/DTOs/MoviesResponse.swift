//
//  MoviesAPIResponse.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//


import Foundation

// MARK: - MoviesAPIResponse
struct MoviesResponse: Codable {
    let page: Int
    let results: [MovieResponse]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    func toDomain() -> [Movie] {
        return results.map { $0.toDomain() }
    }
}

// MARK: - Result
struct MovieResponse: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    func toDomain() -> Movie {
        let fullURL = URL(string: Configs.imageBaseURL + posterPath)
        return Movie(id: id,title: title, posterURL: fullURL,overview: overview)
    }
}


