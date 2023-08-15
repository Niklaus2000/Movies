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
            return UIImage(
                named:"tab_bar_home_UNSelected")?
                .withRenderingMode(.alwaysOriginal)
        case .favorites:
            return UIImage(
                named: "tab_bar_favorites_UNSelected")?
                .withRenderingMode(.alwaysOriginal)
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(
                named: "tab_bar_home_Selected")?
                .withRenderingMode(.alwaysOriginal)
        case .favorites:
            return UIImage(
                named: "tab_bar_favorites_Selected")?
                .withRenderingMode(.alwaysOriginal)
        }
    }
}
