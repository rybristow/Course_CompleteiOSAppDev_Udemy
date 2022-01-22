//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
  let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720]
  var timer = Timer()
  var secondsPassed = 0
  var totalTime = 0
  @IBOutlet weak var progressBar: UIProgressView!
  var player: AVAudioPlayer!
  
  override func viewDidLoad() {
    progressBar.progress = 0.0
  }
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    let hardness = sender.currentTitle!
    
    totalTime = eggTimes[hardness]!
    
    resetTimer()
  }
  
  func resetTimer() {
    timer.invalidate()
    secondsPassed = 0
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    progressBar.progress = 0.0
  }
  
  //new function
  @objc func updateTimer(){
    secondsPassed += 1
    let percentageProgress = Float(secondsPassed) / Float(totalTime)
    progressBar.progress = percentageProgress
    
    if(secondsPassed > totalTime) {
      timer.invalidate()
      print("Time is up!")
      
      let url = Bundle.main.url(forResource:"alarm_sound", withExtension: "mp3")
      player = try! AVAudioPlayer(contentsOf: url!)
      player.play()
    }
  }
  
  
  
}
