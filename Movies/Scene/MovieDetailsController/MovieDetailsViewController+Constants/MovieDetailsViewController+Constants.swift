//
//  MovieDetailsViewController+Constants.swift
//  MovieAPP
//
//  Created by MacBoobPro on 02.08.23.
//

import UIKit

extension MovieDetailsViewController {
    enum Constants {
        
        enum MoviePoster {
            static let image = UIImage(named: "movie_image1")
            static let height: CGFloat = 380
        }
        
        enum TrailerButton {
            static let image = UIImage(named: "trailer_button")
            static let trailing: CGFloat = -16
            static let bottom: CGFloat = -20
        }
        
        enum FavoriteButton {
            static let image = UIImage(named: "favorite_image")
            static let selectedImage = UIImage(named: "selected_favorite_image")
            static let height: CGFloat = 50
            static let width: CGFloat = 50
            static let trailing: CGFloat = -16
        }
        
        enum MovieTitle {
            static let text = "The Atonement"
            static let textFont: UIFont = .boldSystemFont(ofSize: 20)
            static let top: CGFloat = 26
            static let leading: CGFloat = 16
            static let cornerRadius: CGFloat = 0
            static let numberOfLines = 0
        }
        
        enum RatingLabel {
            static let text = "⭐ 7.9"
            static let textFont: UIFont = .systemFont(ofSize: 14)
            static let cornerRadius: CGFloat = 15
            static let numberOfLines = 0
            static let backGroundColor = UIColor(
                red: 0.1098,
                green: 0.1098,
                blue: 0.1098,
                alpha: 1.0)
        }
        
        enum MovieDurationLabel {
            static let text = "⏱️ 1,50"
            static let textFont: UIFont = .systemFont(ofSize: 14)
            static let cornerRadius: CGFloat = 15
            static let numberOfLines = 0
            static let backGroundColor = UIColor(
                red: 0.1098,
                green: 0.1098,
                blue: 0.1098,
                alpha: 1.0)
        }
        
        enum GenreLabel {
            static let text = "Drama"
            static let textFont: UIFont = .systemFont(ofSize: 14)
            static let cornerRadius: CGFloat = 15
            static let numberOfLines: Int = 0
            static let backGroundColor = UIColor(
                red: 0.1098,
                green: 0.1098,
                blue: 0.1098,
                alpha: 1.0)
        }
        
        enum MovieYearLabel {
            static let text = "2007"
            static let textFont: UIFont = .systemFont(ofSize: 14)
            static let cornerRadius: CGFloat = 15
            static let numberOfLines = 0
            static let backGroundColor = UIColor(
                red: 0.1098,
                green: 0.1098,
                blue: 0.1098,
                alpha: 1.0)
        }
        
        enum AboutMovieLabel {
            static let text = "About movie"
            static let textFont: UIFont = .systemFont(ofSize: 16)
            static let cornerRadius: CGFloat = 0
            static let numberOfLines = 0
            static let backGroundColor = UIColor(
                red: 0.1098,
                green: 0.1098,
                blue: 0.1098,
                alpha: 1.0)
            static let top: CGFloat = 26
            static let leading: CGFloat = 16
        }
        
        enum DescriptionLabel {
            static let text = "Thirteen-year-old fledgling writer Briony Tallis irrevocably changes the course of several lives when she accuses her older sister's lover of a crime he did not commit."
            static let textFont: UIFont = .boldSystemFont(ofSize: 16)
            static let cornerRadius: CGFloat = 0
            static let backGroundColor: UIColor = .clear
            static let numberOfLines = 0
            static let top: CGFloat = 8
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
        }
        
        enum StackView {
            static let top: CGFloat = 12
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
            static let height: CGFloat = 26
            static let spacing: CGFloat = 8
        }
        
    }
}

