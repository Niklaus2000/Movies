//
//  MovieCollectionViewCell+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

extension MoviesCollectionViewCell {
    enum Constants {
        
        enum MoviePoster {
            static let bottom: CGFloat = -44
        }
        
        enum FavouriteButton {
            static let selectedImage =  UIImage(named: "selected_favorite_image")
            static let unSelectedImage = UIImage(named: "unSelected_favorite_image")
            static let top: CGFloat = 4
            static let trailing: CGFloat = -4
        }
        
        enum MovieNameLabel {
            static let textSize = UIFont.systemFont(ofSize: 14)
            static let top: CGFloat = 4
            static let leading: CGFloat = 6
        }
        
        enum MovieYearLabel {
            static let textSize = UIFont.systemFont(ofSize: 12)
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
            static let cornnerRadius: CGFloat = 10
            static let top: CGFloat = 10
            static let trailing: CGFloat = -10
            static let height: CGFloat = 21
        }
    }
}

