//
//  MovieGenreCollectionViewCell.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class MovieGenreCollectionViewCell: UICollectionViewCell {
    
    // MARK: Components
    let genreLabelView: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCellLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = Constants.GenreLabelView.cornerRadius
        layer.borderWidth = Constants.GenreLabelView.borderWidth
        layer.borderColor = UIColor.white.cgColor
    }
    
    var isCellSelected: Bool = false {
          didSet {
              backgroundColor = isCellSelected ?
              Constants.CellBackGroundColor.backGroundColor : .clear
              genreLabelView.textColor = isCellSelected ? .black : .white
          }
      }
    
    // MARK: Methods
    func configure(with genre: String) {
        genreLabelView.text = genre
    }
    
    func setupCellLabelConstraints() {
        contentView.addSubview(genreLabelView)
        NSLayoutConstraint.activate([
            genreLabelView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.GenreLabelView.top),
            genreLabelView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.GenreLabelView.leading)
        ])
    }
}
