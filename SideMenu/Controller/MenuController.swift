//
//  MenuController.swift
//  SideMenu
//
//  Created by praveen reddy on 1/26/19.
//  Copyright © 2019 praveen reddy. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    var tableView: UITableView!
    let menu = ["Home", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    let miniMenu = ["Home", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    let container: ContainerController
    
    init(container: ContainerController) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkGray
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
        print(view.frame.width)
        print("viewdidload")
    }
}


extension MenuController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if view.frame.width == 120 {
            return miniMenu.count
        }
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        if view.frame.width == 120 {
            cell.textLabel?.text = miniMenu[indexPath.row]
        } else {
            cell.textLabel?.text = menu[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeController(data: menu[indexPath.row])
        self.container.setFront(UINavigationController(rootViewController: vc), animated: true)
    }
}
