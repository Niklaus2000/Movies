//
//  HomeViewController.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    private var filteredMovies: [Movie] = []
    private var selectedGenre: String?
    private var lastSelectedGenre: String? = nil
    private var titleLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: Components
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.layer.cornerRadius = Constants.SearchView.cornerRadius
        view.backgroundColor = Constants.SearchView.backGroundColor
        view.delegate = self
        return view
    }()
    
    private lazy var buttonView: FilterButtonView = {
        let button = FilterButtonView()
        button.delegate = self
        return button
    }()
    
    private lazy var movieGenreCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.white.cgColor
        view.register(
            MovieGenreCollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.MovieGenreCollectionView.cellGenre)
        return view
    }()
    
    private let moviesLabelView: UILabel = {
        let label = UILabel()
        label.text = Constants.MoviesLabel.text
        label.font = Constants.MoviesLabel.textSize
        label.textColor = Constants.MoviesLabel.textColor
        return label
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.CancelButton.text, for: .normal)
        button.titleLabel?.font = Constants.CancelButton.textFont
        button.addAction(UIAction(handler: {[weak self] _ in
            self?.cancelButtonTapped()
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.register(
            MoviesCollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.MovieCollectionView.cellMovie)
        return view
    }()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpFunc()
        setUpDevaultValues()
    }
    
    // MARK: Methods
    private func setUp() {
        [
            searchView,
            buttonView,
            movieGenreCollectioView,
            moviesLabelView,
            moviesCollectionView,
            cancelButton
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [
            movieGenreCollectioView,
            moviesCollectionView
        ].forEach {
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setUpFunc() {
        setUpSearchViewConstraints()
        setUpFilterImageView()
        setupGenreCollectionViewConstraints()
        setupTitleLabelConstraints()
        setupMoviesCollectionView()
        setupCancelButtonConstraints()
    }
    
    private func setUpDevaultValues() {
        movieGenreCollectioView.isHidden = true
        cancelButton.isHidden = true
        titleLabelTopConstraint.constant = Constants.ButtonView.unSelectedFilterTop
    }
    
    @objc private func cancelButtonTapped() {
        buttonView.isHidden = false
        cancelButton.isHidden = true
    }
    
    // MARK: Contraints
    private func setUpFilterImageView() {
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.ButtonView.trailingAnchor)
        ])
    }
    
    private func setUpSearchViewConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.SearchView.leading),
            searchView.trailingAnchor.constraint(
                equalTo: buttonView.leadingAnchor,
                constant: Constants.SearchView.trailing),
            searchView.heightAnchor.constraint(
                equalToConstant: Constants.SearchView.height),
            searchView.widthAnchor.constraint(
                equalToConstant: Constants.SearchView.width)
        ])
    }
    
    private func setupGenreCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            movieGenreCollectioView.topAnchor.constraint(
                equalTo: searchView.bottomAnchor,
                constant: Constants.MovieGenreCollectionView.top),
            movieGenreCollectioView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.MovieGenreCollectionView.leading),
            movieGenreCollectioView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            movieGenreCollectioView.heightAnchor.constraint(
                equalToConstant: Constants.MovieGenreCollectionView.height)
        ])
    }
    
    private func setupMoviesCollectionView() {
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(
                equalTo: moviesLabelView.bottomAnchor),
            moviesCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.MovieCollectionView.leading),
            moviesCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.MovieCollectionView.trailing),
            moviesCollectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.CancelButton.top),
            cancelButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.CancelButton.trailing),
            cancelButton.widthAnchor.constraint(
                equalToConstant: Constants.CancelButton.width),
            cancelButton.leadingAnchor.constraint(
                equalTo: searchView.trailingAnchor,
                constant: Constants.CancelButton.leading)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        titleLabelTopConstraint = moviesLabelView.topAnchor.constraint(
            equalTo: searchView.bottomAnchor,
            constant: movieGenreCollectioView.isHidden ? Constants.ButtonView.unSelectedFilterTop : Constants.ButtonView.selectedFilterTop)
        
        NSLayoutConstraint.activate([
            titleLabelTopConstraint,
            moviesLabelView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.MoviesLabel.leading),
        ])
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == movieGenreCollectioView {
            return genres.count
        } else if collectionView == moviesCollectionView {
            return selectedGenre != nil ? filteredMovies.count : movies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.movieGenreCollectioView {
            let movieGenreCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constants.MovieGenreCollectionView.cellGenre,
                for: indexPath) as! MovieGenreCollectionViewCell
            let genre = genres[indexPath.row]
            movieGenreCollectionViewCell.configure(with: genre)
            
            
            movieGenreCollectionViewCell.isCellSelected = genre == selectedGenre
            
            return movieGenreCollectionViewCell
        } else if collectionView == self.moviesCollectionView {
            let moviesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.MovieCollectionView.cellMovie, for: indexPath) as! MoviesCollectionViewCell
            
            let movie = selectedGenre != nil ? filteredMovies[indexPath.row] : movies[indexPath.row]
            moviesCollectionViewCell.configure(with: movie)
            
            return moviesCollectionViewCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == movieGenreCollectioView {
            let selectedGenre = genres[indexPath.row]
            if self.lastSelectedGenre != selectedGenre {
                self.lastSelectedGenre = selectedGenre
                self.selectedGenre = selectedGenre
                
                filterMoviesByGenre()
                
                collectionView.reloadData()
            } else {
                self.lastSelectedGenre = nil
                self.selectedGenre = nil
                
                filterMoviesByGenre()
                
                collectionView.reloadData()
            }
        }
        
        if collectionView == moviesCollectionView {
            guard collectionView.cellForItem(at: indexPath) is MoviesCollectionViewCell else {
                return
            }
            let vc = MovieDetailsViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func filterMoviesByGenre() {
        if let selectedGenre = self.selectedGenre {
            self.filteredMovies = movies.filter { $0.genre.lowercased() == selectedGenre.lowercased() }
        } else {
            self.filteredMovies = movies
        }
        moviesCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == movieGenreCollectioView {
            let genre = genres[indexPath.row]
            let labelWidth = genre.size(withAttributes: [
                .font: Constants.MoviesLabel.textSize])
                .width + Constants.MoviesLabel.leading
            return CGSize(
                width: labelWidth,
                height: Constants.MoviesLabel.height)
        } else if collectionView == moviesCollectionView {
            return CGSize(
                width: Constants.MovieCollectionView.width,
                height: Constants.MovieCollectionView.height)
        }
        return CGSize()
    }
}

// MARK: - FilterdViewDelegate
extension HomeViewController: FilterdViewDelegate {
    func filtredView(_ buttonModeView: FilterButtonView, didButtonStateTo state: ButtonState) {
        switch state {
        case .filtred:
            movieGenreCollectioView.isHidden = true
            titleLabelTopConstraint.constant = Constants.ButtonView.unSelectedFilterTop
        case .unFiltred:
            movieGenreCollectioView.isHidden = false
            titleLabelTopConstraint.constant =  Constants.ButtonView.selectedFilterTop
        }
    }
}

// MARK: - FilterdViewDelegate
extension HomeViewController: SearchViewDelegate {
    func searchViewDidCancel() {
        searchView.clearSearchText()
        cancelButtonTapped()
    }
    
    func searchViewTextDidChange(text: String?) {
        if let text = text, !text.isEmpty {
            cancelButton.isHidden = false
            buttonView.isHidden = true
        } else {
            cancelButton.isHidden = true
            buttonView.isHidden = false
        }
    }
}










