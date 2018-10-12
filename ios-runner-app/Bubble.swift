//
//  Runner.swift
//  ios-runner-app
//
//  Created by Francisco on 2018-10-11.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable // To draw on InterfaceBuilder
class Bubble: UIImageView {
    
    
    @IBInspectable // To show on InterfaceBuilder
    var imageName: String = "" {
        didSet {
            self.image = UIImage(named: imageName)
            
            setNeedsDisplay() // To redraw when changes
            setNeedsLayout()  // For subviews
        }
    }
    
    var content : String = "" {
        didSet {
            setNeedsDisplay() // To redraw when changes
            setNeedsLayout()  // For subviews
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            label.text = content
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: min(self.frame.width * 0.8, self.frame.height * 0.8))
            addSubview(label)
        }
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    //override func draw(_ rect: CGRect) {
        
        /*let attributes = [
            NSAttributedStringKey.font : UIFont(name: "Helvetica", size: 32)!,
            NSAttributedStringKey.strokeWidth : 0,
            NSAttributedStringKey.foregroundColor : UIColor.black
            ] as [NSAttributedStringKey : Any]
        self.content.draw(with: self.frame, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        */
        
    //}
}
