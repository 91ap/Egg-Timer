//
//  ViewController.swift
//  Egg-Timer
//
//  Created by apat on 1/28/25.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    //    var secondsRemaining = 60
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 700]
    var timer = Timer()
    var totalTime = 1
    var secondsPassed = 0
    var audioPlayer: AVAudioPlayer!
    var alarmTimer = Timer()
    
    let alarmDuration: TimeInterval = 5.0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        alarmTimer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressView.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            print(progressView.progress)
            
        } else {
            // Invalidate the timer when done
            timer.invalidate()
            titleLabel.text = "Done!"
            progressView.progress = 1
            // Play sound when the timer is done
            playSound()
            // Start the alarm timer to stop the sound after a certain duration
            alarmTimer = Timer.scheduledTimer(timeInterval: alarmDuration, target: self, selector: #selector(stopAlarm), userInfo: nil, repeats: false)
            
        }
    }
    func playSound() {
        // Ensure the sound file exists in your project
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
        
    }
    
    @objc func stopAlarm() {
          // Stop the audio player if it's playing
          if audioPlayer.isPlaying {
              audioPlayer.stop()
          }
          
          // Update the UI
          titleLabel.text = "How would you like your egg?"
      }
}
        


