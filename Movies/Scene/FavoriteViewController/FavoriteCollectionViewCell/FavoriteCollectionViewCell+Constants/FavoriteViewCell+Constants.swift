//
//  FavoritesCollectionViewCell+Constants.swift
//  MovieAPP
//
//  Created by MacBoobPro on 03.08.23.
//


import UIKit

extension FavoriteCollectionViewCell {
    enum Constants {
        
        enum MoviePoster {
            static let bottom: CGFloat = -44
        }
        
        enum FavouriteButton {
            static let image =  UIImage(named: "favorite_image")
            static let top: CGFloat = 4
            static let trailing: CGFloat = -4
        }
        
        enum MovieNameLabel {
            static let textSize = UIFont.systemFont(ofSize: 10)
            static let top: CGFloat = 4
            static let leading: CGFloat = 6
        }
        
        enum MovieYearLabel {
            static let textSize = UIFont.systemFont(ofSize: 10)
            static let leading: CGFloat = 6
        }
        
        enum MovieGenreLabel {
            static let textSize = UIFont.systemFont(ofSize: 10)
            static let top: CGFloat = 4
            static let leading: CGFloat = 12
            static let trailing: CGFloat = -12
            static let bottom: CGFloat = -4
        }
        
        enum GenreLabelContainerView {
            static let backgroundColorUIColor = UIColor(
                red: 0.9608,
                green: 0.7725,
                blue: 0.0941,
                alpha: 1.0)
            static let cornnerRadius: CGFloat = 12
            static let top: CGFloat = 10
            static let trailing: CGFloat = -10
            static let width: CGFloat = -20
        }
    }
}

