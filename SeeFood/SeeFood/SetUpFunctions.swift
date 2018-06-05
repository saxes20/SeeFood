//
//  SetUpFunctions.swift
//  SeeFood
//
//  Created by James on 4/6/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

extension ViewController {
    /// encapsulating set up for custom camera view
    func setupCustomCameraView() {
        // initialising
        customCameraView = UIImageView()
        customCameraView.translatesAutoresizingMaskIntoConstraints = false
        customCameraView.backgroundColor = .black
        view.addSubview(customCameraView)
        // programmatical constraints
        let top = NSLayoutConstraint(item: customCameraView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: customCameraView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: customCameraView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: customCameraView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        view.addConstraints([top, bottom, left, right])
    }
    
    /// encapsulating set up for bookmarks button
    func setupBookmarksButton() {
        // initialising
        bookmarksButton = UIButton()
        bookmarksButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarksButton.backgroundColor = .white
        view.addSubview(bookmarksButton)
        // programmatical constraints
        let top = NSLayoutConstraint(item: bookmarksButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20)
        let right = NSLayoutConstraint(item: bookmarksButton, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -20)
        let width = NSLayoutConstraint(item: bookmarksButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        let height = NSLayoutConstraint(item: bookmarksButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        view.addConstraints([top, right, width, height])
    }
}
