//
//  MovieRepository.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation

protocol MovieRepository{
    func fetchMovies() async throws -> [Movie]
}
