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
    
    
    var direction  : CGFloat = 1.0
    var label = UILabel()
    var defaultWait = 0
    var sound : String = ""
    var wait = 0 {
        didSet {
            defaultWait = wait
        }
    }
    var respawn = true
    var alive = true
    
    @IBInspectable // To show on InterfaceBuilder
    var imageName: String = "" {
        didSet {
            self.image = UIImage(named: imageName)
            
            setNeedsDisplay() // To redraw when changes
            setNeedsLayout()  // For subviews
        }
    }

    
    @IBInspectable // To show on InterfaceBuilder
    var content : String = "" {
        didSet {
            setNeedsDisplay() // To redraw when changes
            setNeedsLayout()  // For subviews
            label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            label.text = content
            label.isUserInteractionEnabled = false
            label.textAlignment = .center
            label.bounds.size = self.bounds.size
            label.center = self.center
            label.font = UIFont.systemFont(ofSize: min(self.frame.width * 0.8, self.frame.height * 0.8))
            addSubview(label)
        }
    }
    
    
    var tapped = false
    
    
    
    
    
    func reset(){
        self.frame.origin.y = UIScreen.main.bounds.height + 50
        let rnd = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        self.frame.origin.x = rnd * ( UIScreen.main.bounds.width + 20 )
        let rnd1 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        self.direction = round(rnd1 * 2) - 1
        
        self.frame.size = CGSize(width: label.frame.width , height: label.frame.width)
        self.label.frame.origin.x = 0
        self.label.frame.origin.y = 0
        self.label.alpha = 1.0
        self.wait = defaultWait
        
        print("Direction \(direction)")
    }
    
    func move(){
        if (!alive){
            return
        }
        if (wait>0){
            wait -= 1
            return
        }
        if (tapped){
            return
        }
        if (self.frame.origin.y < -self.frame.height){
            if (self.respawn){
                self.reset()
            }else{
                self.alive = false
            }
        }
        let rnd1 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        self.frame.origin.x += ( rnd1 * 9.0  - 4.0 ) + direction
        if (self.frame.origin.x > UIScreen.main.bounds.width - 100){
            self.frame.origin.x = UIScreen.main.bounds.width - 100
            self.direction = -1
        }
        if (self.frame.origin.x < 100){
            self.frame.origin.x = 100
            self.direction = 1
        }
        self.frame.origin.y -= 3
    }
    
    
    @objc func tap(){
        print("Tap")
        tapped = true
        Sound.playSound(name: self.sound)
        UIView.animate(withDuration: 0.1, animations: {
            self.frame.size = CGSize(width: self.frame.width * 1.2, height: self.frame.width * 1.2)
            self.frame.origin.x -= self.frame.width * 0.1
            self.frame.origin.y -= self.frame.width * 0.1
            self.label.frame.origin.x += self.frame.width * 0.1
            self.label.frame.origin.y += self.frame.width * 0.1
            self.label.alpha = 0.1
            
        }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // change 2 to desired number of seconds
            self.tapped = false
            if (self.respawn){
                self.reset()
            }else{
                self.alive = false
            }
            
            
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
