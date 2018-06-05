//
//  ViewController.swift
//  SeeFood
//
//  Created by James on 4/6/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let customCameraView = UIImageView()
    let bookmarksButton = UIButton()
    
    var detailsViewHeight = NSLayoutConstraint()
    let detailsView = UIView()
    
    var startLocation: CGPoint?
    var startHeight: CGFloat?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomCameraView()
        setupBookmarksButton()
        setupDetailsView()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            detailsViewHeight.constant = Constants.DetailView.startingHeight
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            if location.isIn(detailsView.frame) {
                startLocation = location
                startHeight = detailsViewHeight.constant
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            // checking if the start location is nil
            // if it is not nil, the user's touch started in the details view
            if let startLocation = startLocation, let startHeight = startHeight {
                detailsViewHeight.constant = startHeight + startLocation.y - location.y
                moveDetailView(in: location.y - startLocation.y < 0 ? .up : .down)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         if let location = touches.first?.location(in: view) {
            if let startLocation = startLocation {
                self.startLocation = nil
                if location.distance(from: startLocation) < 10 && detailsViewHeight.constant == Constants.DetailView.startingHeight {
                    detailsViewHeight.constant = view.frame.height * 3/4
                    UIView.animate(withDuration: 0.25) {
                        self.view.layoutIfNeeded()
                    }
                } else {
                    moveDetailView(in: location.y - startLocation.y < 0 ? .up : .down)
                }
            } else {
                detailsViewHeight.constant = 100
                UIView.animate(withDuration: 0.25) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
    
    func moveDetailView(in direction: Direction) {
        switch direction {
        case .up:
            if detailsViewHeight.constant > view.frame.height / 2 {
                detailsViewHeight.constant = view.frame.height * 3/4
            }
        case .down:
            if detailsViewHeight.constant < view.frame.height / 2 {
                detailsViewHeight.constant = Constants.DetailView.startingHeight
            }
        }
        if startLocation == nil {
            if detailsViewHeight.constant > view.frame.height / 2 {
                detailsViewHeight.constant = view.frame.height * 3/4
            } else {
                detailsViewHeight.constant = Constants.DetailView.startingHeight
            }
        }
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
}

