//
//  HomeController.swift
//  SideMenu
//
//  Created by praveen reddy on 1/26/19.
//  Copyright © 2019 praveen reddy. All rights reserved.
//

import UIKit


class HomeController: UIViewController {
    
    let data: String
    
    init(data: String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = self.data
        self.revealViewController()?.rearViewRevealWidth = 60
        self.revealViewController()?.revealToggle(self)
        
        let barBtn = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tapped))
        self.navigationItem.leftBarButtonItem = barBtn
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(self.data, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        view.addSubview(btn)
        
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func btnTapped(_ sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        self.navigationController?.pushViewController(vc, animated: true)
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
    }
}
