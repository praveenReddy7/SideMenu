//
//  HomeController.swift
//  SideMenu
//
//  Created by praveen reddy on 1/26/19.
//  Copyright © 2019 praveen reddy. All rights reserved.
//

import UIKit


class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        title = "Home"
        self.revealViewController()?.rearViewRevealWidth = 60
        self.revealViewController()?.revealToggle(self)
        
//        let barBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)))
        let barBtn = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tapped))
        self.navigationItem.leftBarButtonItem = barBtn
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        view.addSubview(label)
        
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    @objc func tapped() {
        let menu = self.revealViewController()?.rearViewRevealWidth ?? 0
        if menu == 60 {
            self.revealViewController()?.rearViewRevealWidth = 300
            self.revealViewController()?.revealToggle(animated: true)
        } else {
            self.revealViewController()?.rearViewRevealWidth = 60
            self.revealViewController()?.revealToggle(animated: true)
        }
        self.revealViewController()?.frontViewController
    }
    

    

}
