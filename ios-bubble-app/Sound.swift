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
    
    static var mAudioPlayer = Dictionary<String,AVAudioPlayer>()
    
    class func loadSound(name: String){
        let soundFile = Bundle.main.path(forResource: name, ofType: nil)
        let url = URL(fileURLWithPath: soundFile!)
        self.mAudioPlayer[name] = try! AVAudioPlayer(contentsOf: url as URL)
    }

    class func playSound(name: String){
        if ( mAudioPlayer[name] == nil){
            loadSound(name: name)
        }
        self.mAudioPlayer[name]?.play()
    }

}
