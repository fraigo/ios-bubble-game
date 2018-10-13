//
//  Sound.swift
//  ios-bubble-app
//
//  Created by Francisco on 2018-10-12.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

import UIKit

import AVFoundation

class Sound: NSObject {
    
    static var mAudioPlayer : AVAudioPlayer?
    
    class func loadSound(){
        let soundFile = Bundle.main.path(forResource: "pop.mp3", ofType: nil)
        let url = URL(fileURLWithPath: soundFile!)
        self.mAudioPlayer = try! AVAudioPlayer(contentsOf: url as URL)
    }

    class func playSound(){
        if ( mAudioPlayer == nil){
            loadSound()
        }
        self.mAudioPlayer?.play()
    }

}
