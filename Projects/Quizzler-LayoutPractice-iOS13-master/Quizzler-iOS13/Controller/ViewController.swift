//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  var quizBrain = QuizBrain()
  let scoreString = "Score: "
    
  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
  }
  
  func resetQuiz() {
    quizBrain.resetGame()
    updateUI()
  }
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    let userAnswer = sender.currentTitle!
    let userGotItRight = quizBrain.checkAnswer(userAnswer)
    
    if(userGotItRight) {
      print("Correct!")
      print("Score: \(quizBrain.score)")
      sender.backgroundColor = UIColor.green
    } else {
      print("Incorrect :(")
      sender.backgroundColor = UIColor.red
    }
    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(clearQuestionColor), userInfo: nil, repeats: false)
    
    updateUI()
  }
  
  func updateUI() {
    questionLabel.text = quizBrain.getQuestionText()
    scoreLabel.text = scoreString + String(quizBrain.getScore())
    progressBar.progress = quizBrain.getProgress();
  }
  
  @objc func clearQuestionColor() {
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
  }
  
}

