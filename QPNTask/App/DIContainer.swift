//
//  DI.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation
import Factory

extension Container {
    var apiClient: Factory<APIClient> {
        Factory(self) { APIClient() }
    }
    //MARK: - Repositries
    var moviesRepository: Factory<RemoteMoviesRepository> {
        Factory(self) { RemoteMoviesRepository(apiClient: self.apiClient(), fileCache: self.fileCacheService()) }
    }
    //MARK: - UseCases
    var movieUseCaseImpl: Factory<MovieUseCaseImpl> {
        Factory(self) { MovieUseCaseImpl(remoteMovieReposoitory: self.moviesRepository()) }
    }
    //MARK: - ViewModels
    var movieViewModel: Factory<MovieViewModel> {
        Factory(self) { MovieViewModel(movieUseCase: self.movieUseCaseImpl()) }
    }

    //MARK: - Local
    var fileCacheService: Factory<FileCacheService> {
        Factory(self) { FileCacheService() }
    }
}
