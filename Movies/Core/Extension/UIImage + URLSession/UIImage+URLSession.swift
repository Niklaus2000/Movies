//
//  UIImage+URLSession.swift
//  Movies
//
//  Created by MacBoobPro on 02.05.24.
//

import UIKit

extension UIImageView {
    func loadImageFromURL(urlPath: String) {
        let urlString = "https://image.tmdb.org/t/p/w500" + urlPath
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
