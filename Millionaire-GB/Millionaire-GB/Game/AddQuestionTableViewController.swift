//
//  AddQuestionTableViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 30.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

class AddQuestionTableViewController: UITableViewController {
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answer1Text: UITextField!
    @IBOutlet weak var answer2Text: UITextField!
    @IBOutlet weak var answer3Text: UITextField!
    @IBOutlet weak var answer4Text: UITextField!
    
    @IBOutlet weak var saveQuestionButton: UIBarButtonItem!
    @IBOutlet weak var addQuestionButton: UIBarButtonItem!
    
    var addedQuestionsCaretaker = AddedQuestonsCaretaker()
    
    var addedQuestions = [Question]() {
        didSet {
            addedQuestionsCaretaker.save(addedQuestions: self.addedQuestions)
        }
    }
    
    var questionsCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveQuestionButton.addTargetForAction(target: self, action: #selector(saveButtonPressed))
        
        addQuestionButton.addTargetForAction(target: self, action: #selector(addButtonPressed))
        
        tableView.rowHeight = 250
    }
    
    @objc func saveButtonPressed (sender: UIButton) {
        
        var questions = [Question]()
        
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
        print(questions)
        self.performSegue(withIdentifier: "MainMenuSegue", sender: self)
    }
    
    @objc func addButtonPressed (sender: UIButton) {
        questionsCount += 1
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.reusindentifier, for: indexPath) as? QuestionTableViewCell else {return UITableViewCell()}
        
        return cell
    }
}

extension UIBarButtonItem {
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}
