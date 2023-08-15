//
//  ErrorStateView+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

extension ErrorStateView {
    enum Constants {
        enum RefreshButton {
            static let radius: CGFloat = 16
            static let top: CGFloat = 70
            static let trailing: CGFloat = -120
            static let leading: CGFloat = 120
            static let image = UIImage(named: "error_state_button")
        }
        
        enum Icon {
            static let top: CGFloat = 100
            static let trailing: CGFloat = -150
            static let leading: CGFloat = 160
            static let image = UIImage(named: "empty_state_image")
        }
        
        enum ErrorDetailLabel {
            static let text = "internet connection or some other server error"
            static let textCollor: UIColor = UIColor(
                red: 0.8706,
                green: 0.8706,
                blue: 0.8706,
                alpha: 1.0)
            static let textFont: UIFont = .systemFont(ofSize: 16)
            static let top: CGFloat = 23
            static let trailing: CGFloat = -64
            static let leading: CGFloat = 64
            static let numberOfLines = 2
        }
        
        enum ErrorLabel {
            static let text = "Data can’t be loaded"
            static let textCollor: UIColor = UIColor(
                red: 0.8706,
                green: 0.8706,
                blue: 0.8706,
                alpha: 1.0)
            static let textFont: UIFont = .boldSystemFont(ofSize: 18)
            static let top: CGFloat = 28
            static let width: CGFloat = 196
            static let height: CGFloat = 18
        }
        
    }
}
