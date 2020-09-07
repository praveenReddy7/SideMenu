//
//  ContainerController.swift
//  SideMenu
//
//  Created by praveen reddy on 1/26/19.
//  Copyright © 2019 praveen reddy. All rights reserved.
//

import UIKit


class ContainerController: SWRevealViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.rearViewController = MenuController()
        self.frontViewController = UINavigationController.init(rootViewController: HomeController()) 
        
    }
    
    

}


