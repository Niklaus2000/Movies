//
//  MovieDetailsViewController.swift
//  MovieAPP
//
//  Created by MacBoobPro on 25.07.23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    // MARK: Components
    private let moviePoster: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = Constants.MoviePoster.image
        return image
    }()
    
    private lazy var trailerButton: UIButton = {
        makeButton(
            contentmode: .scaleAspectFill,
            image: Constants.TrailerButton.image,
            state: .normal)
    }()
    
    private lazy var movieTitle: UIView = {
        makeLabel(
            text: Constants.MovieTitle.text,
            textFont: Constants.MovieTitle.textFont,
            textColor: .white,
            backGroundColor: .clear,
            textAlignment: .left,
            cornerRadius: Constants.MovieTitle.cornerRadius,
            numberOfLines: Constants.MovieTitle.numberOfLines,
            maskBounds: true)
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = makeButtonSelected(
            contentmode: .scaleAspectFill,
            image: Constants.FavoriteButton.image,
            state: .normal,
            selectedImage: Constants.FavoriteButton.selectedImage,
            selectedState: .selected)
        
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var ratingLabel: UIView = {
        makeLabel(
            text: Constants.RatingLabel.text,
            textFont: Constants.RatingLabel.textFont,
            textColor: .white,
            backGroundColor: Constants.RatingLabel.backGroundColor,
            textAlignment: .center,
            cornerRadius: Constants.RatingLabel.cornerRadius,
            numberOfLines: Constants.RatingLabel.numberOfLines,
            maskBounds: true,
            padding:  Constants.RatingLabel.padding
        )
    }()
    
    private lazy var genreLabel: UIView = {
        makeLabel(
            text: Constants.GenreLabel.text,
            textFont: Constants.GenreLabel.textFont,
            textColor: .white,
            backGroundColor: Constants.GenreLabel.backGroundColor,
            textAlignment: .center,
            cornerRadius: Constants.GenreLabel.cornerRadius,
            numberOfLines: Constants.GenreLabel.numberOfLines,
            maskBounds: true,
            padding:  Constants.GenreLabel.padding
        )
    }()
    
    private lazy var movieDurationLabel: UIView = {
        makeLabel(
            text: Constants.MovieDurationLabel.text,
            textFont: Constants.MovieDurationLabel.textFont,
            textColor: .white,
            backGroundColor: Constants.MovieDurationLabel.backGroundColor,
            textAlignment: .center,
            cornerRadius: Constants.MovieDurationLabel.cornerRadius,
            numberOfLines: Constants.MovieDurationLabel.numberOfLines,
            maskBounds: true,
            padding:  Constants.MovieDurationLabel.padding
        )
    }()
    
    private lazy var movieYearLabel: UIView = {
        makeLabel(
            text: Constants.MovieYearLabel.text,
            textFont: Constants.MovieYearLabel.textFont,
            textColor: .white,
            backGroundColor: Constants.MovieYearLabel.backGroundColor,
            textAlignment: .center,
            cornerRadius: Constants.MovieYearLabel.cornerRadius,
            numberOfLines: Constants.MovieYearLabel.numberOfLines,
            maskBounds: true,
            padding: Constants.MovieYearLabel.padding
        )
    }()
    
    private lazy var aboutMovieLabel: UIView = {
        makeLabel(
            text: Constants.AboutMovieLabel.text,
            textFont: Constants.AboutMovieLabel.textFont,
            textColor: .white,
            backGroundColor: Constants.AboutMovieLabel.backGroundColor,
            textAlignment: .left,
            cornerRadius: Constants.AboutMovieLabel.cornerRadius,
            numberOfLines: Constants.AboutMovieLabel.numberOfLines, maskBounds: true)
    }()
    
    private lazy var descriptionLabel: UIView = {
        makeLabel(
            text: Constants.DescriptionLabel.text,
            textFont: Constants.DescriptionLabel.textFont,
            textColor: .white,
            backGroundColor: .clear,
            textAlignment: .left,
            cornerRadius: Constants.DescriptionLabel.cornerRadius,
            numberOfLines: Constants.DescriptionLabel.numberOfLines, maskBounds: true)
        
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpFuncOfConstraints()
        setUpNavigationBar()
        
    }
    
    // MARK: Methods
    @objc private func favoriteButtonTapped() {
        favoriteButton.isSelected.toggle()
    }
    
    private func makeLabel(
        text: String,
        textFont: UIFont,
        textColor: UIColor,
        backGroundColor: UIColor,
        textAlignment: NSTextAlignment,
        cornerRadius: CGFloat,
        numberOfLines: Int,
        maskBounds: Bool,
        padding: UIEdgeInsets = .zero
    ) -> UIView {
        let labelContainer = UIView()
        labelContainer.backgroundColor = backGroundColor
        labelContainer.layer.cornerRadius = cornerRadius
        labelContainer.layer.masksToBounds = maskBounds
        
        let label = UILabel()
        label.text = text
        label.font = textFont
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        
        labelContainer.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: labelContainer.topAnchor,
                constant: padding.top),
            label.leadingAnchor.constraint(
                equalTo: labelContainer.leadingAnchor,
                constant: padding.left),
            label.bottomAnchor.constraint(
                equalTo: labelContainer.bottomAnchor,
                constant: -padding.bottom),
            label.trailingAnchor.constraint(
                equalTo: labelContainer.trailingAnchor,
                constant: -padding.right)
        ])
        
        return labelContainer
    }

    
    private func makeButton(
        contentmode: UIView.ContentMode,
        image: UIImage?,
        state: UIControl.State
    )
    -> UIButton {
        let button = UIButton()
        button.contentMode = contentmode
        button.setImage(image, for: state)
        
        return button
    }
    
    private func makeButtonSelected(
        contentmode: UIView.ContentMode,
        image: UIImage?,
        state: UIControl.State,
        selectedImage: UIImage?,
        selectedState: UIControl.State
    )
    -> UIButton {
        let button = UIButton()
        button.contentMode = contentmode
        button.setImage(image, for: state)
        button.setImage(selectedImage, for: selectedState)
        
        return button
    }
    
    private func setUp() {
        [
            moviePoster,
            movieTitle,
            favoriteButton,
            stackView,
            aboutMovieLabel,
            descriptionLabel]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        [
            ratingLabel,
            genreLabel,
            movieDurationLabel,
            movieYearLabel]
            .forEach {
                stackView.addArrangedSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        moviePoster.addSubview(trailerButton)
        trailerButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func setUpFuncOfConstraints() {
        setUpMoviePosterConstraints()
        setupTrailerButtonConstraints()
        setUpFavoriteButtonConstraints()
        setUpMovieTitleConstraints()
        setUpMovieTitleConstraints()
        setUpaboutMovieConstraints()
        setUpDescriptionConstraints()
        setUpStackView()
    }
    
    
    
    private func setUpNavigationBar() {
        self.title = Constants.NavigationBar.text
        
        let titleAttributes = [
            NSAttributedString.Key.font: Constants.NavigationBar.textfont,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        if let navigationBar = self.navigationController?.navigationBar {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: navigationBar.frame.width, height: navigationBar.frame.height))
            titleLabel.text = self.title
            titleLabel.textColor = UIColor.white
            titleLabel.font = Constants.NavigationBar.textfont
            titleLabel.textAlignment = .center
            navigationItem.titleView = titleLabel
        }
    }
    
    // MARK: Constraints
    private func setUpMoviePosterConstraints() {
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviePoster.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            moviePoster.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            moviePoster.heightAnchor.constraint(
                equalToConstant: Constants.MoviePoster.height)
        ])
    }
    
    private func setupTrailerButtonConstraints() {
        NSLayoutConstraint.activate([
            trailerButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.TrailerButton.trailing),
            trailerButton.bottomAnchor.constraint(
                equalTo: moviePoster.bottomAnchor,
                constant: Constants.TrailerButton.bottom)
        ])
    }
    
    
    private func setUpMovieTitleConstraints() {
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(
                equalTo: moviePoster.bottomAnchor,
                constant: Constants.MovieTitle.top),
            movieTitle.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.MovieTitle.leading),
        ])
    }
    
    private func setUpFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(
                equalTo: movieTitle.centerYAnchor),
            favoriteButton.widthAnchor.constraint(
                equalToConstant: Constants.FavoriteButton.width),
            favoriteButton.heightAnchor.constraint(
                equalToConstant: Constants.FavoriteButton.height),
            favoriteButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.FavoriteButton.trailing),
        ])
    }
    
    private func setUpaboutMovieConstraints() {
        NSLayoutConstraint.activate([
            aboutMovieLabel.topAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: Constants.AboutMovieLabel.top),
            aboutMovieLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.AboutMovieLabel.leading)
        ])
    }
    
    private func setUpDescriptionConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: aboutMovieLabel.bottomAnchor,
                constant: Constants.DescriptionLabel.top),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.DescriptionLabel.leading),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.DescriptionLabel.trailing),
        ])
    }
    
    private func setUpStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: movieTitle.bottomAnchor,
                constant: Constants.StackView.top),
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.StackView.leading),
            stackView.trailingAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.StackView.trailing),
            stackView.heightAnchor.constraint(
                equalToConstant: Constants.StackView.height)
        ])
    }
}



