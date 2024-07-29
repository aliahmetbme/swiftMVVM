//
//  HomeViewModelBuilder.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import Foundation
class MovieListBuilder {
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let viewModel = HomeViewModel(service: NetworkCaller())
        vc.viewModel = viewModel
        return vc
    }

}
