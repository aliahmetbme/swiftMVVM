//
//  HomeViewModel.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import Foundation
protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? {get set}
    func load()
}

enum MovieListViewModelOutPut {
    case popular([MovieResult])
    case upcoming([MovieResult])
    case topRated([MovieResult])
    case error(Error)
}

protocol MovieListViewModelDelegate {
    func handleOutPut(_ output: MovieListViewModelOutPut)
}
