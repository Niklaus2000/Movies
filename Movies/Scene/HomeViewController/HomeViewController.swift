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
    private var titleLabelTopConstraint: NSLayoutConstraint?
    var coordinator: MainCoordinator?
    let viewModel: HomeViewModel
    
    
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
        view.register(MovieGenreCollectionViewCell.self)
        //view.delegate = self
        //view.dataSource = self
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
        view.register(MoviesCollectionViewCell.self)
//        view.dataSource = self
//        view.delegate = self
        return view
    }()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpFunc()
        setUpDevaultValues()
        hideKeyboard()
        bindViewModelMovies()
        bindViewModelGenres()
    }
    
    
    // MARK: Init
    init(coordinator: MainCoordinator, viewModel: HomeViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        titleLabelTopConstraint?.constant = Constants.ButtonView.unSelectedFilterTop
    }
    
    @objc private func cancelButtonTapped() {
        buttonView.isHidden = false
        cancelButton.isHidden = true
        searchView.clearSearchText()
    }
    
    
    private func bindViewModelMovies() {
        viewModel.fetchData {
            DispatchQueue.main.async { [weak self] in
                self?.moviesCollectionView.reloadData()
            }
        }
//        viewModel.fetchMovies { _ in
//            DispatchQueue.main.async {
//                self.moviesCollectionView.reloadData()
//            }
//        }
    }
    
    private func bindViewModelGenres() {
        viewModel.fetchGenres {
            DispatchQueue.main.async { [weak self] in
                self?.movieGenreCollectioView.reloadData()
            }
        }
//        viewModel.fetchMovies { _ in
//            DispatchQueue.main.async {
//                self.moviesCollectionView.reloadData()
//            }
//        }
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
                equalTo: moviesLabelView.bottomAnchor,
                constant: Constants.MovieCollectionView.top),
            moviesCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.MovieCollectionView.leading),
            moviesCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.MovieCollectionView.trailing),
            moviesCollectionView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        
        var constraints: [NSLayoutConstraint] = []
        
        if let titleLabelTopConstraint = titleLabelTopConstraint {
            constraints.append(titleLabelTopConstraint)
        }
        
        constraints.append(contentsOf: [
            moviesLabelView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.MoviesLabel.leading),
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, Reusable {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case movieGenreCollectioView:
            return viewModel.arrayOfGenres.count
        case moviesCollectionView:
            return viewModel.numberOfitemsMovies()
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case movieGenreCollectioView:
            let movieGenreCollectionViewCell: MovieGenreCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            let genre = viewModel.arrayOfGenres[indexPath.row]
            movieGenreCollectionViewCell.configure(with: genre)
            movieGenreCollectionViewCell.isCellSelected = genre.name == selectedGenre
            return movieGenreCollectionViewCell
            
        case moviesCollectionView:
            let moviesCollectionViewCell: MoviesCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            let movie = viewModel.arrayOfList[indexPath.row]
            moviesCollectionViewCell.configure(with: movie)
            return moviesCollectionViewCell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == movieGenreCollectioView {
            let selectedGenre = viewModel.arrayOfGenres[indexPath.row]

            if let cell = collectionView.cellForItem(at: indexPath) as? MovieGenreCollectionViewCell {
                cell.isCellSelected.toggle()
            }

            if self.lastSelectedGenre != selectedGenre.name {
                self.lastSelectedGenre = selectedGenre.name
                self.selectedGenre = selectedGenre.name
            } else {
                self.lastSelectedGenre = nil
                self.selectedGenre = nil
            }

            //filterMoviesByGenre()
            collectionView.reloadData()
        }
        
        if collectionView == moviesCollectionView {
            let movies = viewModel.arrayOfList[indexPath.row]
            coordinator?.fromHomeViewControllerToMovieDetailViewController(with: movies, id: movies.id)
        }
    }
    
//        private func filterMoviesByGenre() {
//            if let selectedGenre = selectedGenre {
//                self.filteredMovies = viewModel.arrayOfList.filter { $0.genres?.name  == selectedGenre.lowercased() }
//            } else {
//                self.filteredMovies = viewModel.arrayOfList
//            }
//            moviesCollectionView.reloadData()
//        }
    
//    private func filterMoviesByGenre() {
//        if let selectedGenre = selectedGenre {
//            self.filteredMovies = movies.filter { $0.genre.lowercased() == selectedGenre.lowercased() }
//        } else {
//            self.filteredMovies = movies
//        }
//    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case movieGenreCollectioView:
            let genre = viewModel.arrayOfGenres[indexPath.row]
            let cell = MovieGenreCollectionViewCell()
            cell.configure(with: genre)
            return cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        case moviesCollectionView:
            return CGSize(
                width: Constants.MovieCollectionView.width,
                height: Constants.MovieCollectionView.height)
        default:
            return CGSize.zero
        }
    }
}

// MARK: - FilterdViewDelegate
extension HomeViewController: FilterdViewDelegate {
    func filtredView(_ buttonModeView: FilterButtonView, didButtonStateTo state: ButtonState) {
        switch state {
        case .filtred:
            movieGenreCollectioView.isHidden = true
            titleLabelTopConstraint?.constant = Constants.ButtonView.unSelectedFilterTop
        case .unFiltred:
            movieGenreCollectioView.isHidden = false
            titleLabelTopConstraint?.constant = Constants.ButtonView.selectedFilterTop
        }
    }
}

// MARK: - FilterdViewDelegate
extension HomeViewController: SearchViewDelegate {
    func textFieldDidBeginEditing() {
        buttonView.isHidden = true
        cancelButton.isHidden = false
        
        if buttonView.isSelected {
            buttonView.isSelected = false
            movieGenreCollectioView.isHidden = true
            setupTitleLabelConstraints()
        }
    }
    
    func textFieldDidEndEditing() {
        buttonView.isHidden = false
        cancelButton.isHidden = true
    }
}
