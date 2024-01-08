//
//  Question.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 01.08.21.
//

import Foundation

class Question {
    
    //MARK: - Variablen
    var questionText: String
    var answer1: String
    var answer2: String
    var answer3: String
    var correctAnswerTag: Int = 0
    var trueAnswerText: String = ""
    var falseAnswerText: String = ""
    
    
    //MARK: - Init
    init(_questionText: String, _answer1: String, _answer2: String, _answer3: String, _correctAnswerTag: Int, _trueAnswerText: String, _falseAnswerText: String) {
        questionText = _questionText
        answer1 = _answer1
        answer2 = _answer2
        answer3 = _answer3
        correctAnswerTag = _correctAnswerTag
        trueAnswerText = _trueAnswerText
        falseAnswerText = _falseAnswerText
    }
}
