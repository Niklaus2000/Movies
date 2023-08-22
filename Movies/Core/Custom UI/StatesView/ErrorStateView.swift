//
//  ErrorStateView.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class ErrorStateView: UIView {
    // MARK: Component
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.image = Constants.Icon.image
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private lazy var errorLabel: UILabel = {
        makeLabel(
            text: Constants.ErrorLabel.text,
            textFont: Constants.ErrorLabel.textFont,
            textColor: Constants.ErrorLabel.textCollor,
            textAlignment: .center,
            numberOfLines: .zero)
    }()
    
    private lazy var errorDetailLabel: UILabel = {
        makeLabel(
            text: Constants.ErrorDetailLabel.text,
            textFont: Constants.ErrorDetailLabel.textFont,
            textColor: Constants.ErrorDetailLabel.textCollor,
            textAlignment: .center,
            numberOfLines: Constants.ErrorDetailLabel.numberOfLines)
    }()
    
    private lazy var refreshButton: UIButton = {
        let refreshButton = UIButton()
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = Constants.RefreshButton.radius
        refreshButton.setImage(
            Constants.RefreshButton.image,
            for: .normal)
        
        return refreshButton
    }()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstaint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setUpConstaint() {
        setUpIconConstraints()
        setUpErrorLabelConstraints()
        setUpErrorDetailLabelConstraints()
        setUpRefreshButtonConstraints()
    }
    
    private func setUp() {
        [icon, errorLabel, errorDetailLabel, refreshButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func makeLabel(
        text: String,
        textFont: UIFont,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        numberOfLines: Int
    )
    -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = textFont
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        
        return label
    }
    
    // MARK: Constraint
    private func setUpIconConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Constants.Icon.top),
            icon.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.Icon.leading),
            icon.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.Icon.trailing),
        ])
    }
    
    private func setUpErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(
                equalTo: icon.bottomAnchor,
                constant: Constants.ErrorLabel.top),
            errorLabel.widthAnchor.constraint(
                equalToConstant: Constants.ErrorLabel.width),
            errorLabel.heightAnchor.constraint(
                equalToConstant: Constants.ErrorLabel.height),
            errorLabel.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setUpErrorDetailLabelConstraints() {
        NSLayoutConstraint.activate([
            errorDetailLabel.topAnchor.constraint(
                equalTo: errorLabel.bottomAnchor,
                constant: Constants.ErrorDetailLabel.top),
            errorDetailLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.ErrorDetailLabel.trailing),
            errorDetailLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.ErrorDetailLabel.leading),
            errorDetailLabel.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    private func setUpRefreshButtonConstraints() {
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(
                equalTo: errorDetailLabel.bottomAnchor,
                constant: Constants.RefreshButton.top),
            refreshButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.RefreshButton.trailing),
            refreshButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.RefreshButton.leading)
        ])
    }
}
