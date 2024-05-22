//
//  MainCoordinator.swift
//  Movies
//
//  Created by MacBoobPro on 27.02.24.
//


import UIKit

class MainCoordinator {
    private let navigationViewController: UINavigationController
    private let viewModel: HomeViewModel
    var tabBarCases: [TabBarEnum] { return [.home(self, viewModel), .favorites(self)] }
    
    init(navigationViewController: UINavigationController, viewModel: HomeViewModel ) {
        self.navigationViewController = navigationViewController
        self.viewModel = viewModel
    }
    
    func start() {
        let tabBarViewController = TabBarViewController(coordinator: self)
        navigationViewController.setViewControllers([tabBarViewController], animated: false)
        tabBarViewController.setUpTabBar()
    }
    
    func tabBarViewControllers() -> [UIViewController] {
        return tabBarCases.map { controller in
            let viewController = controller.viewController
            let navController = UINavigationController(rootViewController: viewController)
            navController.overrideUserInterfaceStyle = .light
            navController.navigationBar.barStyle = .black
            return navController
        }
    }
    
    func fromHomeViewControllerToMovieDetailViewController(with movie: Movie, id: Int) {
        let vc = MovieDetailsViewController()
        vc.configure(with: movie)
        vc.hidesBottomBarWhenPushed = true
        navigationViewController.pushViewController(vc, animated: true)
    }
    
    func fromFavoriteControllerToMovieDetailViewController() {
        let vc = MovieDetailsViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationViewController.pushViewController(vc, animated: true)
    }
}

