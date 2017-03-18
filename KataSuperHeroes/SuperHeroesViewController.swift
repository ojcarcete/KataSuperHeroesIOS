//
//  SuperHeroesViewController.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
import BothamUI
import MarvelAPIClient

class SuperHeroesViewController: KataSuperHeroesViewController, BothamTableViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCaseView: UILabel!

    var dataSource: BothamTableViewDataSource<SuperHero, SuperHeroTableViewCell>!
    var delegate: UITableViewDelegate!

    override func viewDidLoad() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.tableFooterView = UIView()
        tableView.accessibilityLabel = "SuperHeroesTableView"
        tableView.accessibilityIdentifier = "SuperHeroesTableView"
        configureNavigationBarBackButton()
        super.viewDidLoad()
    }

    fileprivate func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}

extension SuperHeroesViewController: SuperHeroesView {
    
    func showEmptyCase() {
        
        self.emptyCaseView.isHidden = false
    }
    
    func showSuperHeroes(superHeroes: [SuperHero]) {
        
        self.dataSource.items = superHeroes
        self.tableView.reloadData()
    }
    
    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController) {
        
        self.navigationController?.push(viewController: superHeroDetailViewController)
    }
    
}
