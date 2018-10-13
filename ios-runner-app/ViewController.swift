//
//  ViewController.swift
//  ios-runner-app
//
//  Created by Francisco on 2018-10-11.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var bubbles = [Bubble]()
    
    func createBubble(content: String, wait : Int)  {
        let bubble = Bubble()
        bubble.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        bubble.content = content
        bubble.imageName = "bubble128.png"
        bubble.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        bubble.addGestureRecognizer(tap)
        bubble.reset()
        bubble.wait = wait
        view.addSubview(bubble)
        bubbles.append(bubble)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Sound.playSound()
        
        createBubble(content: "🍎", wait: 10)
        createBubble(content: "🍏", wait: 40)
        
        updateBubbles()
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        
        
        let bubble = (sender.view as! Bubble)
        bubble.tap()
    }
    
    func updateBubbles(){
        for bubble in bubbles {
            bubble.move()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) { // change 2 to desired number of seconds
            self.updateBubbles()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



