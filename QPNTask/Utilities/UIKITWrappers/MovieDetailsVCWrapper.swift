//
//  MovieDetailsViewControllerWrapper.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//
import SwiftUI

struct MovieDetailsVCWrapper: UIViewControllerRepresentable {
    let movie: Movie

    func makeUIViewController(context: Context) -> MovieDetailsVC {
        MovieDetailsVC(movie: movie)
    }

    func updateUIViewController(_ uiViewController: MovieDetailsVC, context: Context) {
        
    }
}
