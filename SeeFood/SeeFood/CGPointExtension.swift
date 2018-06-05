//
//  CGPointExtension.swift
//  SeeFood
//
//  Created by James on 4/6/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

extension CGPoint {
    func isIn(_ frame: CGRect) -> Bool {
        return x >= frame.origin.x && x <= frame.origin.x + frame.width && y >= frame.origin.y && y <= frame.origin.y + frame.height
    }
}
