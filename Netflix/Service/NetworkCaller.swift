//
//  NetworkCaller.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(_ endPoint: EndPoint, comletion: @escaping (Result<T,Error>) -> Void)
}


final class NetworkCaller: NetworkServiceProtocol {
    
    func fetchData<T: Decodable>(_ endPoint: EndPoint, comletion: @escaping (Result<T,Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: endPoint.request()) { data, response, error in
            if let error = error {
                comletion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 , response.statusCode <= 299 else {return}
            
            guard let data = data else {
                comletion(.failure(URLError(.badURL)))
                return
            }
            
            do {
                let decoderData =  try JSONDecoder().decode(T.self, from: data)
                comletion(.success(decoderData))
            } catch let error {
                print("\(error) nETWORK CALLER")
            }
        }
        task.resume()
    }
}
