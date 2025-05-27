//
//  FileCacheService.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//


import SwiftUI

class FileCacheService{
    private let fileName = "movies.json"
    
    func save(_ movies: [Movie]) {
        guard let data = try? JSONEncoder().encode(movies) else { return }
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        try? data.write(to: url)
    }
    
    func load() -> [Movie] {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        guard let data = try? Data(contentsOf: url),
              let movies = try? JSONDecoder().decode([Movie].self, from: data) else { return [] }
        return movies
    }
    
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
