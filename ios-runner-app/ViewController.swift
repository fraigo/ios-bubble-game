//
//  ViewController.swift
//  ios-runner-app
//
//  Created by Francisco on 2018-10-11.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bubble = Bubble()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        bubble.frame = CGRect(x: 100, y: UIScreen.main.bounds.height, width: 100, height: 100)
        bubble.content = "🍎"
        bubble.imageName = "bubble128.png"
        view.addSubview(bubble)
        updateBubble()
    }
    
    func updateBubble(){
        let rnd = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        bubble.frame.origin.x += rnd * 7.0  - 3.0
        bubble.frame.origin.y -= 4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { // change 2 to desired number of seconds
            self.updateBubble()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

