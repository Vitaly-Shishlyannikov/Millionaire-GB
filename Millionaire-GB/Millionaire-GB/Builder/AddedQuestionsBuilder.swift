//
//  AddedQuestionsBuilder.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 31.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

final class AddedQuestionBuilder {
    
    func build(questionsCount: Int, tableView: UITableView) -> [Question] {
        
        var addedQuestions = [Question]()
        
        for row in 0...questionsCount {
            
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? QuestionTableViewCell
            
            if let questionText = cell?.questionTextfield.text, !questionText.isEmpty,
                let answer1Text = cell?.answer1Textfield.text, !answer1Text.isEmpty,
                let answer2Text = cell?.answer2Textfield.text, !answer2Text.isEmpty,
                let answer3Text = cell?.answer3Textfield.text, !answer3Text.isEmpty,
                let answer4Text = cell?.answer4Textfield.text, !answer4Text.isEmpty,
                let correctAnswerNumber = cell?.correctAnswerNumberSwitch.selectedSegmentIndex {
                
                    var correctAnswer: String {
                        switch correctAnswerNumber {
                        case 0:
                            return answer1Text
                        case 1:
                            return answer2Text
                        case 2:
                            return answer3Text
                        case 3:
                            return answer4Text
                        default:
                            return answer1Text
                        }
                    }
                
                    let question = Question(question: questionText, answer1: answer1Text, answer2: answer2Text, answer3: answer3Text, answer4: answer4Text, correctAnswer: correctAnswer, helpOfFriend: "Я не знаю :(", helpOfAudience: "Все варианты по 25%")
                    addedQuestions.append(question)
                }
        }
        return addedQuestions
    }
}
