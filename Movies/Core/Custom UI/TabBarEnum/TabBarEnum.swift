//
//  TabBarEnum.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

enum TabBarEnum {
    case home
    case favorites
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .favorites:
            return FavoriteViewController()
        }
    }
    
    var image: UIImage? {
        switch self {
        case .home:
            return Constants.TabBarItems.homeUnselected?.withRenderingMode(.alwaysOriginal)
        case .favorites:
            return Constants.TabBarItems.favoritesUnselected?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return Constants.TabBarItems.homeSelected?.withRenderingMode(.alwaysOriginal)
        case .favorites:
            return Constants.TabBarItems.favoritesSelected?.withRenderingMode(.alwaysOriginal)
        }
    }
}

struct Constants {
    struct TabBarItems {
        static let homeUnselected = UIImage(named: "tab_bar_home_UNSelected")
        static let homeSelected =  UIImage(named: "tab_bar_home_Selected")
        static let favoritesUnselected = UIImage(named: "tab_bar_favorites_UNSelected")
        static let favoritesSelected = UIImage(named: "tab_bar_favorites_Selected")
    }
}
