//
//  HTTPConstant.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import Foundation

protocol EndPointprotocol {
    var baseURL: String {get}
    var genreURL: String {get}
    var apiKey: String {get}
    var method:HTTPMethod {get}
    
    func movieApiUrl() -> String
    func request() -> URLRequest
}

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}

enum EndPoint {
    case popular
    case topRated
    case upcoming
}

extension EndPoint: EndPointprotocol {
    var apiKey: String {
        return Config.apiKey
    }
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreURL: String {
        switch self {
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        case .popular:
            return "popular"
        }
    }
    

    var method: HTTPMethod {
        switch self {
        case .popular:
            return .get
        case .topRated:
            return .get
        case .upcoming:
            return .get
        }
    }
    
    func movieApiUrl() -> String {
        return "\(baseURL)\(genreURL)\(apiKey)"
    }
    
    func request() -> URLRequest {
        guard let apiURL = URLComponents(string: movieApiUrl()) else {
            fatalError("URL Components are missing")
        }
        
        guard let url = apiURL.url else {
            fatalError("URL cannot be occured")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
       
        return request
        
    }
}
