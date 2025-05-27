//
//  Movie.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation

struct Movie: Hashable, Codable{
    var id: Int
    var title: String
    var posterURL: URL?
    var overview: String
}
