//
//  HomeViewModel.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import Foundation

final class HomeViewModel: MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate?
    var service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
       
    func load() {
    
        
        service.fetchData(.popular) { [weak self] (result: Result<Movie,Error>) in
            switch result{
            case .success(let movie):
                self?.delegate?.handleOutPut(.popular(movie.results))
            case .failure(let error):
                self?.delegate?.handleOutPut(.error(error))
            }
        }
        
        service.fetchData(.popular) { [weak self] (result: Result<Movie,Error>) in
            switch result{
            case .success(let movie):
                self?.delegate?.handleOutPut(.topRated(movie.results))
            case .failure(let error):
                self?.delegate?.handleOutPut(.error(error))
            }
        }
        
        service.fetchData(.popular) { [weak self] (result: Result<Movie,Error>) in
            switch result{
            case .success(let movie):
                self?.delegate?.handleOutPut(.upcoming(movie.results))
            case .failure(let error):
                self?.delegate?.handleOutPut(.error(error))
            }
        }

    }

    
}
