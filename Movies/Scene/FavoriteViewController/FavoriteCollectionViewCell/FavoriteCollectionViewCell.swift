//
//  FavoriteCollectionViewCell.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    private let moviePoster: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let favouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.FavouriteButton.image, for: .normal)
        return button
    }()
    
    private lazy var movieNameLabel: UILabel = {
        makeLabel(
            textFont: Constants.MovieNameLabel.textSize,
            textColor: .white,
            backGroundColor: .clear)
    }()
    
    private lazy var movieYearLabel: UILabel = {
        makeLabel(
            textFont: Constants.MovieYearLabel.textSize,
            textColor: .lightGray,
            backGroundColor: .clear)
    }()
    
    private lazy var movieGenreLabel: UILabel = {
        makeLabel(
            textFont: Constants.MovieGenreLabel.textSize,
            textColor: .black,
            backGroundColor: .clear)
    }()
    
    private let genreLabelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.GenreLabelContainerView.backgroundColorUIColor
        view.layer.cornerRadius = Constants.GenreLabelContainerView.cornnerRadius
        return view
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
        setupMoviePosterConstraints()
        setupGenreLabelContainerViewConstraints()
        setupMovieNameLabelConstraints()
        setupMovieYearLabelConstraints()
        setupFavouriteButtonConstraints()
        setupMovieGenreLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func makeLabel(
        textFont: UIFont,
        textColor: UIColor,
        backGroundColor: UIColor

    )
    -> UILabel {
        let label = UILabel()
        label.font = textFont
        label.textColor = textColor
        label.backgroundColor = backGroundColor
        return label
    }
    
    private func setUp() {
        [
            moviePoster,
            movieNameLabel,
            movieYearLabel,
            favouriteButton]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview($0)
        }
        
        genreLabelContainerView.addSubview(movieGenreLabel)
        moviePoster.addSubview(genreLabelContainerView)
        genreLabelContainerView.translatesAutoresizingMaskIntoConstraints = false
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configure(with movie: Movie) {
        moviePoster.image = UIImage(named: movie.poster)
        movieNameLabel.text = movie.name
        movieGenreLabel.text = movie.genre
        movieYearLabel.text = String(movie.year)
    }
    
    // MARK: Constraint
    private func setupMoviePosterConstraints() {
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            moviePoster.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.MoviePoster.bottom),
            moviePoster.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            moviePoster.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupMovieGenreLabelConstraints() {
        NSLayoutConstraint.activate([
            movieGenreLabel.topAnchor.constraint(
                equalTo: genreLabelContainerView.topAnchor,
                constant: Constants.MovieGenreLabel.top),
            movieGenreLabel.leadingAnchor.constraint(
                equalTo: genreLabelContainerView.leadingAnchor,
                constant: Constants.MovieGenreLabel.leading),
            movieGenreLabel.trailingAnchor.constraint(
                equalTo: genreLabelContainerView.trailingAnchor,
                constant: Constants.MovieGenreLabel.trailing),
            movieGenreLabel.bottomAnchor.constraint(
                equalTo: genreLabelContainerView.bottomAnchor,
                constant: Constants.MovieGenreLabel.bottom)
        ])
    }
    
    private func setupMovieNameLabelConstraints() {
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(
                equalTo: moviePoster.bottomAnchor,
                constant: Constants.MovieNameLabel.top),
            movieNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.MovieNameLabel.leading)
        ])
    }
    
    private func setupMovieYearLabelConstraints() {
        NSLayoutConstraint.activate([
            movieYearLabel.topAnchor.constraint(
                equalTo: movieNameLabel.bottomAnchor),
            movieYearLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.MovieYearLabel.leading),
            movieYearLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupFavouriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favouriteButton.topAnchor.constraint(
                equalTo: moviePoster.bottomAnchor,
                constant: Constants.FavouriteButton.top),
            favouriteButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.FavouriteButton.trailing)
        ])
    }
    
    private func setupGenreLabelContainerViewConstraints() {
        NSLayoutConstraint.activate([
            genreLabelContainerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.GenreLabelContainerView.top),
            genreLabelContainerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.GenreLabelContainerView.trailing),
            genreLabelContainerView.heightAnchor.constraint(
                greaterThanOrEqualToConstant: 0),
            genreLabelContainerView.widthAnchor.constraint(
                lessThanOrEqualTo: contentView.widthAnchor,
                constant: Constants.GenreLabelContainerView.width)
        ])
    }
}
