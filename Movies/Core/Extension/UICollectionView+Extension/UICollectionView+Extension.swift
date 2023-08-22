//
//  UICollectionView+Extension.swift
//  Movies
//
//  Created by MacBoobPro on 19.08.23.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
         String(describing: self)
    }
}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let reuseIdentifier = String(describing: T.self)
        self.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
