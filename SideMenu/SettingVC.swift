//
//  SettingVC.swift
//  SideMenu
//
//  Created by praveen on 9/10/20.
//  Copyright © 2020 praveen reddy. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // test change 3 should delete before merge
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        self.navigationItem.rightBarButtonItem = cancel
    }
    
    @objc func cancelTapped() {
        self.dismiss(animated: true)
    }
}
