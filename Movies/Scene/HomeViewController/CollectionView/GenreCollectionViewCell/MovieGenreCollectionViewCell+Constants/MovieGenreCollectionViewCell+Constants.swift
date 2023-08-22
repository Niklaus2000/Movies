//
//  MovieGenreCollectionViewCell+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

extension MovieGenreCollectionViewCell {
    enum Constants {
        enum GenreLabel {
            static let cornerRadius: CGFloat = 12
            static let borderWidth: CGFloat = 1
            static let top: CGFloat = 4
            static let leading: CGFloat = 12
            static let trailing: CGFloat = -12
            static let bottom: CGFloat = -4
            static let cellWidth: CGFloat = 24
            static let cellHeight: CGFloat = 26
        }
        
        enum CellBackGroundColor {
            static let backGroundColor = UIColor(
                red: 0.9608,
                green: 0.7725,
                blue: 0.0941,
                alpha: 1.0)
        }
    }
}
