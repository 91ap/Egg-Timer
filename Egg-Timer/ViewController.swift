//
//  ViewController.swift
//  Egg-Timer
//
//  Created by apat on 1/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
//    var secondsRemaining = 60
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
  
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
    
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
            let percentageProgress = secondsPassed / totalTime
            progressView.progress = Float(percentageProgress)
            secondsPassed  += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
        
    }


