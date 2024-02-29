//
//  TabBarViewController.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

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

    // MARK: Methods
    func setUpTabBar() {
        let viewControllers = coordinator.tabBarViewControllers()

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
