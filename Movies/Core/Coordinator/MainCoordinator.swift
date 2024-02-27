//
//  MainCoordinator.swift
//  Movies
//
//  Created by MacBoobPro on 27.02.24.
//


import UIKit

//class MainCoordinator {
//    private var navigationController: UINavigationController
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//        let tabBarViewController = TabBarViewController(coordinator: self)
//        navigationController.pushViewController(tabBarViewController, animated: true)
//    }
//
//}

class MainCoordinator {

    let tabBarCases: [TabBarEnum]

    init(tabBarCases: [TabBarEnum]) {
        self.tabBarCases = tabBarCases
    }

    var viewControllers: [UIViewController] {
        return tabBarCases.map { controller in
            let viewController = controller.viewController
            let navController = UINavigationController(rootViewController: viewController)
            navController.overrideUserInterfaceStyle = .light
            navController.navigationBar.barStyle = .black
            return navController
        }
    }
}

