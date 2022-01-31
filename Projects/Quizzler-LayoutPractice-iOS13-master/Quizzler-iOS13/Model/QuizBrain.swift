//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ry Bristow on 1/30/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
  let quiz = [
    Question(q:"The word Catholic means 'worldly'", a: "False"),
    Question(q:"The Church is Catholic because Christ is present in her", a: "True"),
    Question(q:"The Church is Catholic because it is sent on a mission by Christ to all people in the world to gather all into the People of God.", a: "True"),
    Question(q:"Peter and Paul were martyred in Rome", a: "True"),
    Question(q:"The Eucharist is truly the body and blood of Jesus Christ", a: "True"),
    Question(q:"Muslims accept the divinity of Jesus", a: "False"),
    Question(q:"In the Eastern Catholic Church, married men cannot be ordained", a: "False"),
    Question(q:"Confession is the sacrament that involves admitting your sins so that you can receive grace and forgiveness from God", a: "True"),
    Question(q:"Music during a Catholic Mass must either be played on piano or organ or sung without instrument accompaniment", a: "False"),
    Question(q:"Catholicism has a rich history of tradition and worship that traces back to the first disciples", a: "True")
  ]
  
  var questionNumber = 0
  var score = 0
  
  mutating func checkAnswer(_ userAnswer: String) -> Bool {
    var correctAnswer: Bool
    if userAnswer == quiz[questionNumber].answer {
      score += 1
      correctAnswer = true
    } else {
      correctAnswer =  false
    }
    
    nextQuestion()
    
    return correctAnswer
  }
  
  mutating func resetGame() {
    questionNumber = 0
    score = 0
  }
  
  mutating func nextQuestion() {
    if(questionNumber + 1 < quiz.count) {
      questionNumber += 1
    }
    else {
      questionNumber = 0
    }
  }
  
  // Getters
  
  func getQuestionText() -> String {
    return quiz[questionNumber].text
  }
  
  func getTotalQuestions() -> Int {
    return quiz.count
  }
  
  func getQuestionsAnswered() -> Int {
    return questionNumber
  }
  
  func getProgress() -> Float {
    return Float(questionNumber) / Float(quiz.count)
  }
  
  func getScore() -> Int {
    return score
  }
}


