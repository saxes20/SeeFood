//
//  ViewController.swift
//  SeeFood
//
//  Created by James on 4/6/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customCameraView: UIImageView!
    var bookmarksButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomCameraView()
        setupBookmarksButton()
    }

}

