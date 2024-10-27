//
//  Question.swift
//  MultiplicationQuiz
//
//  Created by Hubert Kuczyński on 24/06/2024.
//

import Foundation

protocol Question {
    var firstNumber: Int { get }
    var secondNumber: Int { get }
    var answer: Int { get }
}

struct MultiplicationQuestion: Question {
    let firstNumber: Int
    let secondNumber: Int
    
    var answer: Int {
        firstNumber * secondNumber
    }
}
