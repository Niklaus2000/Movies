//
//  FilterImageView+Constants.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

extension FilterButtonView {
    struct LocalConstants {
        static let unFilter = UIImage(named: "unFilter_image_view")
        static let filter = UIImage(named: "filter_image_view")
    }
}

enum ButtonState {
    case filtred
    case unFiltred
}
