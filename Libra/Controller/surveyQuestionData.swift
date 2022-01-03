//
//  surveyQuestionData.swift
//  LibraFinalVersion
//
//  Created by Hiệp Nguyễn on 23/10/2021.
//

import Foundation
struct surveyQuestionData {
    
    //Vivaan
    var questionNumber = 0

    let quiz = [
        Question(q: "Little or no interest in doing things?"),
        Question(q: "Feeling down, depressed, or hopeless?"),
        Question(q: "Trouble falling or staying asleep, or sleeping too much?"),
        Question(q: "Feeling tired or having little energy?"),
        Question(q: "Feeling bad about yourself, or that you are a failure, or have let yourself or your family down?")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
       
       if questionNumber + 1 < quiz.count {
           questionNumber += 1
       } else {
           questionNumber = 0
       }
   }
    
}
