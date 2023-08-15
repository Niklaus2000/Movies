//
//  SearchView+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import Foundation

import UIKit

extension SearchView {
    enum Constants {
        enum MainView {
            static let top: CGFloat = 19
            static let leading: CGFloat = 16
            static let height: CGFloat = 36
        }
        
        enum TextField {
            static let text = "Search"
            static let fontSize: UIFont = UIFont.systemFont(ofSize: 14)
            static let textColor: UIColor = UIColor(red: 0.6471, green: 0.6471, blue: 0.6471, alpha: 1.0)
            static let top: CGFloat = 9
            static let leading: CGFloat = 6
        }
        
        enum ImageView {
            static let image = UIImage(named: "search_image")
            static let top: CGFloat = 11
            static let leading: CGFloat = 24
            static let height: CGFloat = 15
            static let widthh: CGFloat = 15
        }
    }
}
