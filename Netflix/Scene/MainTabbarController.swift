//
//  ViewController.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabbar()
        view.backgroundColor = .systemBackground
    }
    
    private func createTabbar() {
        let vcFirst = UINavigationController(rootViewController: MovieListBuilder.make())
        let vcSecond = UINavigationController(rootViewController: UpcomingViewController())
        let vcThird = UINavigationController(rootViewController: SearchViewController())
        let vcFourth = UINavigationController(rootViewController: DowloadViewController())
        
        vcFirst.tabBarItem.image = UIImage(systemName: "homekit")
        vcSecond.tabBarItem.image = UIImage(systemName: "play.circle")
        vcThird.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vcFourth.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        vcFirst.tabBarItem.title = "Home"
        vcSecond.tabBarItem.title = "Coming Soon"
        vcThird.tabBarItem.title = "Top Search"
        vcFourth.tabBarItem.title = "Downloads"
        
        tabBar.tintColor = .label

        
        setViewControllers([vcFirst,vcSecond,vcThird,vcFourth], animated: true)
    }


}

