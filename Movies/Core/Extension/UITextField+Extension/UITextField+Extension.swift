//
//  UITextField+exte.swift
//  Movies
//
//  Created by MacBoobPro on 18.08.23.
//

import UIKit

extension UITextField {
    func setPlaceholder(with text: String, color: UIColor, font: UIFont) {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font
        ]
        let placeholder = NSAttributedString(string: text, attributes: placeholderAttributes)
        attributedPlaceholder = placeholder
    }
}
