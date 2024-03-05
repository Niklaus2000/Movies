//
//  HomeViewController+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

extension HomeViewController {
    enum Constants {
        
        enum SearchView {
            static let top: CGFloat = 19
            static let leading: CGFloat = 16
            static let width: CGFloat = 300
            static let height: CGFloat = 36
            static let cornerRadius: CGFloat = 16
            static let trailing: CGFloat = -8
//            static let backGroundColor = UIColor(
//                red: 0.1098,
//                green: 0.1098,
//                blue: 0.1098,
//                alpha: 1.0)
            static let backGroundColor = UIColor(
                red: 28/255,
                green: 28/255,
                blue: 28/255,
                alpha: 1)
        }
        
        enum ButtonView {
            static let text = "cancel"
            static let trailingAnchor: CGFloat = -16
            static let unSelectedFilterTop: CGFloat = 22
            static let selectedFilterTop: CGFloat = 52
            static let textFont: UIFont = UIFont.boldSystemFont(ofSize: 10)
        }
        
        enum CellBackGroundColor {
            static let backGroundColor = UIColor(
                red: 0.9608,
                green: 0.7725,
                blue: 0.0941,
                alpha: 1.0)
        }
        
        enum MoviesLabel {
            static let text  = "Movies"
            static let textColor = UIColor(
                red: 0.9608,
                green: 0.7725,
                blue: 0.0941,
                alpha: 1.0)
            static let textSize = UIFont.systemFont(ofSize: 18)
            static let leading: CGFloat = 16
            static let textSizeCollectionView: CGFloat = 16
            static let height: CGFloat = 26
        }
        
        enum MovieCollectionView {
            static let cellMovie = "MoviesCollectionViewCell"
            static let width: CGFloat = 160
            static let height: CGFloat = 260
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
            static let top: CGFloat = 16
        }
        
        enum MovieGenreCollectionView {
            static let cellGenre = "MovieGenreCollectionViewCell"
            static let top: CGFloat = 8
            static let height: CGFloat = 30
            static let leading: CGFloat = 12
            static let trailing: CGFloat = 24

        }
        
        enum CancelButton {
            static let text = "cancel"
            static let textFont: UIFont = UIFont.boldSystemFont(ofSize: 10)
            static let top: CGFloat = 4
            static let leading: CGFloat = 8
            static let trailing: CGFloat = -13
            static let width: CGFloat = 36
        }
    }
}
