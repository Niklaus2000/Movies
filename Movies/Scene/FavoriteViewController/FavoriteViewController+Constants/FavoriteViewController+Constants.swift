//
//  FavoriteViewController+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

extension FavoriteViewController {
    enum Constants {
        enum MoviesCollectionView {
            static let cell = "FavoriteCollectionViewCell"
            static let top: CGFloat = 10
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
            static let width: CGFloat = 160
            static let height: CGFloat = 260
            
        }
        
        enum TitleLabel {
            static let text = "Favorite movies"
            static let textFont: UIFont = .boldSystemFont(ofSize: 18)
            static let textColor: UIColor = .white
            static let top: CGFloat = 5
            static let leading: CGFloat = 122
            
        }
        
        enum LoadingImage {
            static let image = UIImage(named: "spiner_image")
            static let height: CGFloat = 128
            static let width: CGFloat = 128
        }
        
        
    }
}

