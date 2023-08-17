//
//  MovieGenreCollectionViewCell.swift
//  Movie
//
//  Created by MacBoobPro on 14.08.23.
//

import UIKit

class MovieGenreCollectionViewCell: UICollectionViewCell {
    
    // MARK: Components
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.required, for: .vertical)
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
        layer.cornerRadius = Constants.GenreLabel.cornerRadius
        layer.borderWidth = Constants.GenreLabel.borderWidth
    }
    
    var isCellSelected: Bool = false {
        didSet {
            backgroundColor = isCellSelected ? Constants.CellBackGroundColor.backGroundColor : .clear
            genreLabel.textColor = isCellSelected ? .black : .white
            layer.borderColor = isCellSelected ? UIColor.clear.cgColor : UIColor.white.cgColor
        }
    }
    
    // MARK: Methods
    func configure(with genre: String) {
        genreLabel.text = genre
    }
    
    func setupCellLabelConstraints() {
        contentView.addSubview(genreLabel)
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.GenreLabel.top),
            genreLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.GenreLabel.leading),
            genreLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.GenreLabel.bottom),
        ])
    }
}
