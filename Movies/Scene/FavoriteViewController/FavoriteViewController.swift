//
//  FavoriteViewController.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    private var coordinator: MainCoordinator?
    
    // MARK: Components
    private lazy var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.register(FavoriteCollectionViewCell.self)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TitleLabel.text
        label.font = Constants.TitleLabel.textFont
        label.textColor =  Constants.TitleLabel.textColor
        return label
        
    }()
    
    private let errorStateView: ErrorStateView = {
        let view = ErrorStateView()
        return view
    }()
    
    private let emptyStateView: EmptyStateView = {
        let view = EmptyStateView()
        return view
    }()
    
    private let loadingImage: UIImageView = {
        let image = UIImageView()
        image.image = Constants.LoadingImage.image
        return image
    }()
    
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setupMoviesCollectionViewConstraints()
        setUpTitleLabelConstraints()
        
    }
    
    // MARK: Init
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setUp() {
        [titleLabel, moviesCollectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func startSpinning() {
        loadingImage.startRotating()
    }
    
    private func stopSpinning() {
        loadingImage.stopRotating()
    }
    
    // MARK: Connstraints
    private func setUpTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.TitleLabel.leading)
        ])
    }
    
    private func setupMoviesCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.MoviesCollectionView.top),
            moviesCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.MoviesCollectionView.leading),
            moviesCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.MoviesCollectionView.trailing),
            moviesCollectionView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpErrorViewConstraints() {
        NSLayoutConstraint.activate([
            errorStateView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorStateView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            errorStateView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            errorStateView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpEmptyViewConstraints() {
        NSLayoutConstraint.activate([
            emptyStateView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyStateView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emptyStateView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            emptyStateView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpLoadingImageConstraints() {
        NSLayoutConstraint.activate([
            loadingImage.widthAnchor.constraint(
                equalToConstant: Constants.LoadingImage.width),
            loadingImage.heightAnchor.constraint(
                equalToConstant: Constants.LoadingImage.height),
            loadingImage.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loadingImage.centerYAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavoriteViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: Constants.MoviesCollectionView.width,
            height: Constants.MoviesCollectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView.cellForItem(at: indexPath) is FavoriteCollectionViewCell else {
            return
        }
        
        let vc = MovieDetailsViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
