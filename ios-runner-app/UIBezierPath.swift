//
//  UIBezier.swift
//  ios-runner-app
//
//  Created by Francisco on 2018-10-11.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

import UIKit


extension UIBezierPath {
    
    
    func moveTo(_ x : CGFloat, _ y: CGFloat){
        self.move(to: CGPoint(
            x: x,
            y: y))
    }
    
    func lineTo(_ x : CGFloat, _ y: CGFloat){
        self.addLine(to: CGPoint(
            x: x,
            y: y))
    }
    
}


