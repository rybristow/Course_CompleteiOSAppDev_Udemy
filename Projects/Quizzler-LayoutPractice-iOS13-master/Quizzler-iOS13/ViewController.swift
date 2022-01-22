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
  @IBOutlet weak var progressBar: UIProgressView!
  
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  struct Question {
    var title: String
    var answer: String
  }
  
  let quiz = [
    Question(title:"4 + 2 = 6", answer: "True"),
    Question(title:"5 - 3 > 1", answer: "True"),
    Question(title:"3 - 1 < 1", answer: "False")
  ]
  var questionNumber = 0
  
  var score = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    questionLabel.text = quiz[questionNumber][0]
  }
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    if(sender.currentTitle == quiz[questionNumber][1]) {
        score += 1
        print("Correct!")
        print("Score: \(score)")
      }
      else {
        print("Incorrect :(")
      }
    
    if(questionNumber + 1 < quiz.count) {
      questionNumber += 1
    }
    else {
      questionNumber = 0
    }
    
    questionLabel.text = quiz[questionNumber][0]
  }
  
}

