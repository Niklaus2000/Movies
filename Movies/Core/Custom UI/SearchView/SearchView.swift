//
//  SearchView.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func textFieldDidBeginEditing()
    func textFieldDidEndEditing()
}

final class SearchView: UIView {
    
    // MARK: Component
    private let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.ImageView.image
        return imageView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.TextField.text
        textField.textColor = .white
        textField.delegate = self
        return textField
    }()
    
    // MARK: Properties
    weak var delegate: SearchViewDelegate?
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpFunc()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    func clearSearchText() {
        textField.text = ""
        textField.resignFirstResponder()
    }
    
    private func setUp() {
        [searchImage, textField].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpFunc() {
        setImageConstraints()
        setTextFieldConstraints()
    }
    
    // MARK: Constraints
    private func setImageConstraints() {
        NSLayoutConstraint.activate([
            searchImage.topAnchor.constraint(
                equalTo: topAnchor, constant: Constants.ImageView.top),
            searchImage.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.ImageView.leading),
            searchImage.heightAnchor.constraint(
                equalToConstant: Constants.ImageView.height),
            searchImage.widthAnchor.constraint(
                equalToConstant: Constants.ImageView.widthh)
        ])
    }
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: topAnchor, constant: Constants.TextField.top),
            textField.leadingAnchor.constraint(
                equalTo: searchImage.trailingAnchor,
                constant: Constants.TextField.leading),
            textField.trailingAnchor.constraint(
                equalTo: trailingAnchor)
        ])
    }
}

// MARK: - SearchViewDelegate
extension SearchView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
          delegate?.textFieldDidBeginEditing()
        
      }

      func textFieldDidEndEditing(_ textField: UITextField) {
          textField.text = ""
          delegate?.textFieldDidEndEditing()
      }
}

