//
//  MovieDetailsViewController.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import UIKit
import SDWebImage

final class MovieDetailsVC: UIViewController {
    // MARK: - Properties
    private let movie: Movie

    // MARK: - UIViews
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let movieOverviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        config()
    }
}

//MARK: - Helpers
extension MovieDetailsVC{
    private func setupUI() {
        [moviePosterImageView, movieNameLabel, movieOverviewLabel].forEach({view.addSubview($0)})
        view.addSubview(moviePosterImageView)
        view.addSubview(movieNameLabel)
        view.addSubview(movieOverviewLabel)

        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            moviePosterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            moviePosterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 300),

            movieNameLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 16),
            movieNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            movieOverviewLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 12),
            movieOverviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieOverviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func config() {
        movieNameLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        moviePosterImageView.sd_setImage(with: movie.posterURL)
    }
}

//
//#Preview{
//    MovieDetailsVC(movie: Movie(id: 1, title: "Name", posterURL: URL(string: "\(Configs.imageBaseURL)/yFHHfHcUgGAxziP1C3lLt0q2T4s.jpg"), overview: "This My Movie Man"))
//}
