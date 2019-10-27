//
//  ViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 23.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(withResult result: Int, allQuestionsCount allCount: Int, moneyWinned money: String)
}

class GameViewController: UIViewController {
    
    let indexRestorationKey = "currentQuestionIndex"
    
    @IBOutlet weak var LabelNumberOfQuestion: UILabel!
    @IBOutlet weak var LabelQuestionText: UILabel!
    @IBOutlet weak var ButtonAnswer1: UIButton!
    @IBOutlet weak var ButtonAnswer2: UIButton!
    @IBOutlet weak var ButtonAnswer3: UIButton!
    @IBOutlet weak var ButtonAnswer4: UIButton!
    
    @IBAction func ButtonAnswer1(_ sender: Any) {
        if ButtonAnswer1.titleLabel?.text == self.currentQuestion?.correctAnswer {
            showWinMessage()
        } else {
            showLoseMessage()
        }
    }
    
    @IBAction func ButtonAnswer2(_ sender: Any) {
        if ButtonAnswer2.titleLabel?.text == self.currentQuestion?.correctAnswer {
            showWinMessage()
        } else {
            showLoseMessage()
        }
    }
    @IBAction func ButtonAnswer3(_ sender: Any) {
        if ButtonAnswer3.titleLabel?.text == self.currentQuestion?.correctAnswer {
            showWinMessage()
        } else {
            showLoseMessage()
        }
    }
    @IBAction func ButtonAnswer4(_ sender: Any) {
        if ButtonAnswer4.titleLabel?.text == self.currentQuestion?.correctAnswer {
            showWinMessage()
        } else {
            showLoseMessage()
        }
    }
    
    weak var gameDelegate: GameViewControllerDelegate?
    
    var indexOfQuestion = 0
    private var currentQuestion: Question?
    private var allQuestions = [Question?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelQuestionText.numberOfLines = 0
        
        allQuestions = DataManager.shared.getAllQuestions()
        
        setQuestion()

        showQuestion(question: currentQuestion)
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        coder.encode(indexOfQuestion, forKey: indexRestorationKey)
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        indexOfQuestion = coder.decodeInteger(forKey: indexRestorationKey)
        setQuestion()
        showQuestion(question: currentQuestion)
    }

    private func incrementIndex() { 
        indexOfQuestion += 1
    }
    
    private func setQuestion() {
        currentQuestion = allQuestions[indexOfQuestion]
    }
    
    private func showQuestion(question: Question?) {
        
        guard let question = question else {return}
        
        LabelNumberOfQuestion.text = "Вопрос № \(question.numberOfQuestion), на кону \(question.prizeMoney) рублей"
        LabelQuestionText.text = question.question
        ButtonAnswer1.setTitle(question.answer1, for: .normal)
        ButtonAnswer2.setTitle(question.answer2, for: .normal)
        ButtonAnswer3.setTitle(question.answer3, for: .normal)
        ButtonAnswer4.setTitle(question.answer4, for: .normal)
    }
    
    func showWinMessage() {
        
        guard let question = currentQuestion else {return}
        
        let alertWIndow = UIAlertController(title: "Верно!", message: "Вы выиграли \(question.prizeMoney) рублей!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
            self.showNextQuestion()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    func showNextQuestion() {
        guard (indexOfQuestion < allQuestions.count - 1) else {return}
        incrementIndex()
        setQuestion()
        showQuestion(question: currentQuestion)
    }
    
    func showLoseMessage() {
        
        guard let question = currentQuestion else {return}
        
        self.gameDelegate?.didEndGame(withResult: indexOfQuestion, allQuestionsCount: allQuestions.count, moneyWinned: question.prizeMoney)
        
        let alertWIndow = UIAlertController(title: "Неправильно!", message: "Ваш выигрыш составил \(question.prizeMoney) рублей!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
            self.backToMainMenu()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
        
        Game.shared.addResult()
    }
    
    func backToMainMenu() {
        self.performSegue(withIdentifier: "MainMenuSegue", sender: self)
    }
}

