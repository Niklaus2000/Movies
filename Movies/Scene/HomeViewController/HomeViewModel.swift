//
//  HomeViewModel.swift
//  Movies
//
//  Created by MacBoobPro on 05.04.24.
//

import Foundation


class HomeViewModel {
    
    var arrayOfList = [Movie]()
    var arrayOfGenres = [Genre]()
    var arrayOfSearch = [Search]()
    private var apiService  = ApiService()
    
    
//        func fetchMovies(completion: @escaping (Error?) -> Void) {
//            apiService.getMoviesData { (movieData, error) in
//                if let error = error {
//                    completion(error)
//                    print("error viewmodel")
//                }
//
//                if let movieData = movieData {
//                    self.arrayOfList = movieData.results
//                    print("\(movieData)")
//                    completion(nil)
//                }
//            }
//        }
    
    
    
    func fetchData(success: @escaping () -> Void) {
        apiService.fetchData { [weak self] movies in
            self?.arrayOfList = movies
            success()
        }
        
    }

    
//    func fetchGenres(success: @escaping () -> Void) {
//        apiService.fetchGenres { [weak self] genres in
//            self?.arrayOfGenres = genres
//            success()
//        }
//    }
    
//    func fetchSearch(with query: String) {
//        apiService.fetchSearch(query: query) { search in
//            self.arrayOfSearch = search
//        }
//    }
    
    func numberOfitemsMovies() -> Int {
        arrayOfList.count
    }
    
    func numberOfItemsGenres() -> Int {
        arrayOfGenres.count
    }
    
    func retriveMovie(with id: Int) -> Movie? {
        guard let movie = arrayOfList.first(where: {$0.id == id}) else { return nil }
        return movie
    }
    
//    func filterMoviesByGenre(genre: String) -> [Movie] {
//        if genre.isEmpty {
//            return arrayOfList
//        } else {
//            return arrayOfList.filter { movie in
//                return movie.genres?.contains(where: { $0.name.lowercased() == genre.lowercased() }) ?? false
//            }
//        }
//    }
//    func filterMoviesByGenre(genre: String) -> [Movie] {
//            if genre.isEmpty {
//                return arrayOfList // Return all movies if genre is empty
//            } else {
//                return arrayOfList.filter { movie in
//                    // Filter movies based on the genre
//                    return movie.genres?.contains(where: { $0.idsz.lowercased() == genre.lowercased() }) ?? false
//                }
//            }
//        }
        
}
