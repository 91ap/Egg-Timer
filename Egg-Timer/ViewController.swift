//
//  ViewController.swift
//  Egg-Timer
//
//  Created by apat on 1/28/25.
//

import UIKit

class ViewController: UIViewController {
    
//    var timeRemaining: Int = 60
    
    var secondsRemaining = 60
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
  
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc func updateTimer() {
        
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }
    }
        
    }


