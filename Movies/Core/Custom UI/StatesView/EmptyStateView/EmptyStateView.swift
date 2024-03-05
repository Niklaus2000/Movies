//
//  EmptyStateView.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class EmptyStateView: UIView {
    
    // MARK: Component
    private let noMoviesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.image
        return imageView
    }()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(noMoviesImage)
        setUpImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraint
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            noMoviesImage.widthAnchor.constraint(
                equalToConstant: Constants.width),
            noMoviesImage.heightAnchor.constraint(
                equalToConstant: Constants.height),
            noMoviesImage.centerYAnchor.constraint(
                equalTo:safeAreaLayoutGuide.centerYAnchor),
            noMoviesImage.centerXAnchor.constraint(
                equalTo:safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}

