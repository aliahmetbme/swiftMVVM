//
//  HomeViewController.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var tableView = UITableView()
    private var popularArr = [MovieResult]()
    private var upcomingArr = [MovieResult]()
    private var topRatedArr = [MovieResult]()
    let sectionMovies: [String] = ["Popular","Upcoming Movies", "Top Rated Movies"]
    
    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.delegate = self
        viewModel?.load()
        view.backgroundColor = .systemBackground
    }
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        view.addSubview(tableView)

        let headerView = MainHeroHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeigth * 0.35))
        
        tableView.tableHeaderView = headerView
        
        tableView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }

}

extension HomeViewController: MovieListViewModelDelegate {
    func handleOutPut(_ output: MovieListViewModelOutPut) {
        switch output {
        case .popular(let popular):
            self.popularArr = popular
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        case .upcoming(let upcoming):
            self.upcomingArr = upcoming
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        case .topRated(let topRated):
            self.topRatedArr = topRated
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        case .error(let error):
            print("\(error) error HomeVC")
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionMovies.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        
        switch indexPath.section {
        case SectionsTableView.popular.rawValue:
            cell.configure(movies: popularArr)
        case SectionsTableView.topRated.rawValue:
            cell.configure(movies: topRatedArr)
        case SectionsTableView.upcoming.rawValue:
            cell.configure(movies: upcomingArr)
        default:
            break
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
