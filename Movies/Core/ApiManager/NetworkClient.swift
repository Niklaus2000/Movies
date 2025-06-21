//
//  NetworkClient.swift
//  Movies
//
//  Created by MacBoobPro on 17.03.24.
//

import Foundation


private struct URLConstants {
    static let api_key = "a6ea6249484a13e9812c3f315028feb0"
    static let baseURL = "https://api.themoviedb.org"
    static let youtube_api_key = "AIzaSyBtK7Bc5zIPsiuUcgwNgbe5d0U_8XrKWNM"
    static let youtube_baseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

//class APIService {
//    func getMoviesData(completion: @escaping (MoviesResponse?, Error?) -> Void) {
//        guard let movieUrl = URL(string:"\(URLConstants.baseURL)/3/trending/movie/day?api_key=\(URLConstants.api_key)") else {
//            completion(nil, NSError(domain: "InvalidURL", code: -1, userInfo: nil))
//            return
//        }
//        URLSession.shared.dataTask(with: movieUrl) { (data, response, error) in
//            guard let jsonData = data else {
////                print("success service")
//                completion(nil, error)
//                print("success service")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let movieResponse = try decoder.decode(MoviesResponse.self, from: jsonData)
//                print("success")
//                completion(movieResponse.results, nil)
//            } catch {
//                print("json decoding error: \(error)")
////                if let jsonString = String(data: jsonData, encoding: .utf8) {
////                    print("JSON Data: \(jsonString)")
////                }
//                completion(nil, error)
//            }
//        }.resume()
//    }
//}

final class ApiService {
    
    
    //    func fetchData<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T {
    //        guard let url = URL(string: urlString) else {
    //            throw APIError.invalidURL
    //        }
    //
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //            let decoder = JSONDecoder()
    //            let result = try decoder.decode(T.self, from: data)
    //            return result
    //        } catch {
    //            throw APIError.requestFailed
    //        }
    //    }
    
    
    func fetchData(success: @escaping ([Movie]) -> Void) {
        let url = "\(URLConstants.baseURL)/3/trending/movie/day?api_key=\(URLConstants.api_key)"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(MovieResponse.self, from: data)
                        success(result.results)
                        //   print(result)
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                }
            }.resume()
        }
    }
    
//    func  fetchGenres(success: @escaping ([Genre]) -> Void) {
//        let url = "\(URLConstants.baseURL)/3/genre/movie/list?api_key=\(URLConstants.api_key)"
//
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url) { (data, _, error) in
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let result = try decoder.decode(GenresResponse.self, from: data)
//                        success(result.)
//                        print(result)
//                    } catch {
//                        print("Error decoding JSON: \(error)")
//                    }
//                } else if let error = error {
//                    print("Error fetching data: \(error)")
//                }
//
//            }.resume()
//        }
//    }
    

    
    
    
        func fetchDetails(id: Int, success: @escaping (MovieDetail) -> Void) {
            let url = "https://api.themoviedb.org/3/movie\(id)?api_key=?api_key=a6ea6249484a13e9812c3f315028feb0&language=en-US"
    
    
            if let url = URL(string: url) {
                    URLSession.shared.dataTask(with: url) { (data, _, error) in
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(MovieDetail.self, from: data)
                                success(result)
                                print(result)
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        } else if let error = error {
                            print("Error fetching data: \(error)")
                        }
                    }.resume()
                }
            }
    
    //    func fetchSearch(query: String, success: @escaping ([Search]) -> Void) {
    //
    //        let url = "https://api.themoviedb.org/3/search/movie?query=\(query)=a6ea6249484a13e9812c3f315028feb0"
    //
    //
    //        if let url = URL(string: url) {
    //            URLSession.shared.dataTask(with: url) { (data, _, error) in
    //                if let data = data {
    //                    do {
    //                        let decoder = JSONDecoder()
    //                        let result = try decoder.decode(SearchResponse.self, from: data)
    //                        success(result.results)
    //                        //print(result)
    //                    } catch {
    //                        print("Error decoding JSON: \(error)")
    //                    }
    //                } else if let error = error {
    //                    print("Error fetching data: \(error)")
    //                }
    //            }.resume()
    //        }
    //    }
}

//final class ApiService {
//
//    func fetchData(success: @escaping ([Movie]) -> Void) {
//        let url = "\(URLConstants.baseURL)/3/trending/movie/day?api_key=\(URLConstants.api_key)"
//
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url) { (data, _, error) in
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let result = try decoder.decode(Movies.self, from: data)
//                        success(result.results)
//                        print(result.results)
//
//                    } catch {
//                        print("Error decoding JSON: \(error)")
//                    }
//                } else if let error = error {
//                    print("Error fetching data: \(error)")
//                }
//            }.resume()
//        }
//    }
//}

//class ApiService {
//    static let shared = ApiService()
//
//    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
//        guard let url = URL(string:"\(URLConstants.baseURL)/3/trending/movie/day?api_key=\(URLConstants.api_key)") else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                //converts json data so we can use it
////                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
////                print(results)
//
//                let results = try JSONDecoder().decode(Movies.self, from: data)
//                completion(.success(results.results))
//
//            } catch {
//                //print(error.localizedDescription)
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }




//    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string:"\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.api_key)") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
////                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
////                print(results)
//            }
//            catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }
//
//    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.api_key)&language=en-US&page=1") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
//            }
//            catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }
//
//    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.api_key)&language=en-US&page=1") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
//            }
//            catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }
//
//    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.api_key)&language=en-US&page=1") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
//            }
//            catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }
//
//    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.api_key)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
//            }
//            catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }
//
//    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
//            return
//        }
//
//        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.api_key)&query=\(query)") else {
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
//            }
//            catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
//    }
//
//    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
//        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
//
//        guard let url = URL(string: "\(Constants.youtube_baseURL)q=\(query)&key=\(Constants.youtube_api_key)") else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
//                completion(.success(results.items[0]))
//            }
//            catch {
//                completion(.failure(error))
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }

