//
//  NavVC.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/20/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import UIKit

class NavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom Navigation Bar with transparent background
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .clear
        
        //setting Navigation Bar title color
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22)]
        
    }
}

