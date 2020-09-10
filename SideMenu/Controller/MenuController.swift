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
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        
        let settings = UIButton()
        settings.translatesAutoresizingMaskIntoConstraints = false
        settings.setTitle("settings", for: .normal)
        settings.addTarget(self, action: #selector(settingTapped), for: .touchUpInside)
        settings.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(settings)
        
        settings.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        settings.widthAnchor.constraint(equalToConstant: 70).isActive = true
        settings.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        settings.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let logout = UIButton()
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.setTitle("logout", for: .normal)
        logout.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        logout.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(logout)
        
        logout.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        logout.widthAnchor.constraint(equalToConstant: 70).isActive = true
        logout.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        logout.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func settingTapped() {
        let nav = UINavigationController(rootViewController: SettingVC())
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc func logoutTapped() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = LoginVC()
        }
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
