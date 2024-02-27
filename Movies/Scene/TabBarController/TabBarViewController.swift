//
//  TabBarViewController.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

//class TabBarViewController: UITabBarController {
//
//    // MARK: Properties
//    private let tabBarCase: [TabBarEnum] = [.home, .favorites]
//
//    // MARK: viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tabBar.backgroundColor = .clear
//        setUpTabBar()
//    }
//
//    // MARK: Init
////    init(coordinator: MainCoordinator) {
////        self.coordinator = coordinator
////        super.init(nibName: nil, bundle: nil)
////    }
////
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//    // MARK: Methods
//    func setUpTabBar() {
//        let viewControllers = tabBarCase.map { controller in
//            let navController = UINavigationController(rootViewController: controller.viewController)
//            navController.overrideUserInterfaceStyle = .light
//            navController.navigationBar.barStyle = .black
//
//            return navController
//        }
//
//        self.setViewControllers(viewControllers, animated: false)
//
//        guard let items = self.tabBar.items else {
//            return
//        }
//
//        for (index, item) in items.enumerated() {
//            let variant = tabBarCase[index]
//            item.image = variant.image
//            item.selectedImage = variant.selectedImage
//        }
//
//        self.tabBar.tintColor = .clear
//    }
//}


class TabBarViewController: UITabBarController {

    // MARK: Properties
    private let coordinator: MainCoordinator

    // MARK: Init
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .clear
        setUpTabBar()
    }

    // MARK: Methods
    private func setUpTabBar() {
        let viewControllers = coordinator.viewControllers

        self.setViewControllers(viewControllers, animated: false)

        guard let items = self.tabBar.items else {
            return
        }

        for (index, item) in items.enumerated() {
            let variant = coordinator.tabBarCases[index]
            item.image = variant.image
            item.selectedImage = variant.selectedImage
        }

        self.tabBar.tintColor = .clear
    }
}
