//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
  var timer = Timer()
  var countdownTimeRemaining = 0
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    let hardness = sender.currentTitle!
    
    let result = eggTimes[hardness]!
    print(result)
      
    countdownTimeRemaining = result
    
    //in a function or viewDidLoad()
    timer.invalidate()
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
    RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
  }
  
  //new function
  @objc func timerCountDown(){
    print("\(countdownTimeRemaining) seconds.")
    countdownTimeRemaining -= 1
    if(countdownTimeRemaining < 0) {
      timer.invalidate()
      timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRing), userInfo: nil, repeats: false)
    }
  }
  
  @objc func timerRing() {
    print("Time is up!")
  }
  
  
  
}
