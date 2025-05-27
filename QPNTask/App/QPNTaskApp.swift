//
//  QPNTaskApp.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import SwiftUI
import Factory
@main
struct QPNTaskApp: App {
    @ObservedObject private var viewModel = Container.shared.movieViewModel()
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: viewModel)
        }
    }
}
