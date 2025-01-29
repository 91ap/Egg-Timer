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
    var totalTime = 1
    var secondsPassed = 0
  
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressView.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
    
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
            secondsPassed  += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            print(progressView.progress)
          
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            progressView.progress = 1
        }
    }
        
    }


