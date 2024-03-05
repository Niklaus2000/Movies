//
//  MainCoordinator.swift
//  Movies
//
//  Created by MacBoobPro on 27.02.24.
//


import UIKit

class MainCoordinator {
    private let navigationViewController: UINavigationController
    var tabBarCases: [TabBarEnum] { return [.home(self), .favorites(self)] }
    
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
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
    
    func fromHomeViewControllerToMovieDetailViewController() {
        let vc = MovieDetailsViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationViewController.pushViewController(vc, animated: true)
    }
    
    func fromFavoriteControllerToMovieDetailViewController() {
        let vc = MovieDetailsViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationViewController.pushViewController(vc, animated: true)
    }
}

