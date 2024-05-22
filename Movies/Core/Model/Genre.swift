//
//  Genre.swift
//  Movies
//
//  Created by MacBoobPro on 04.04.24.
//

import Foundation

// MARK: - Welcome
struct GenreResponse: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
