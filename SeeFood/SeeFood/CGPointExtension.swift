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
    
    func distance(from point: CGPoint) -> CGFloat {
        return sq(self.x - point.x) + sq(self.y - point.y)
    }
    
    private func sq(_ x: CGFloat) -> CGFloat {
        return x * x
    }
}
