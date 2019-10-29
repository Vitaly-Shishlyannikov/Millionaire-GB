//
//  ViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 23.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(withResult result: Int, allQuestionsCount allCount: Int)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var LabelNumberOfQuestion: UILabel!
    @IBOutlet weak var LabelQuestionText: UILabel!
    @IBOutlet weak var ButtonAnswer1: UIButton!
    @IBOutlet weak var ButtonAnswer2: UIButton!
    @IBOutlet weak var ButtonAnswer3: UIButton!
    @IBOutlet weak var ButtonAnswer4: UIButton!
    
    @IBAction func ButtonAnswer1(_ sender: Any) {
        answerButtonPressed(button: sender as! UIButton )
    }
    
    @IBAction func ButtonAnswer2(_ sender: Any) {
        answerButtonPressed(button: sender as! UIButton )
    }
    @IBAction func ButtonAnswer3(_ sender: Any) {
        answerButtonPressed(button: sender as! UIButton )
    }
    @IBAction func ButtonAnswer4(_ sender: Any) {
        answerButtonPressed(button: sender as! UIButton )
    }
    
    let indexRestorationKey = "currentQuestionIndex"
    
    weak var gameDelegate: GameViewControllerDelegate?
    
    private var currentIndex = 0
    
    private var correctAnsersCount: Int = 0
    
    private var allQuestions = [Question?]()
    
    private var orderOfQuestions = Game.shared.orderOfQuestions
    
    private var getQuestionStrategy: GetQuestionStrategy {
        switch orderOfQuestions {
        case .direct:
            return DirectGetQuestionStrategy()
        case .random:
            return RandomGetQuestionStrategy()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelQuestionText.numberOfLines = 0
        
        allQuestions = getQuestionStrategy.getQuestions()

        showCurrentQuestion()
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        coder.encode(currentIndex, forKey: indexRestorationKey)
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        currentIndex = coder.decodeInteger(forKey: indexRestorationKey)
        showCurrentQuestion()
    }
    
    func answerButtonPressed(button: UIButton) {
        
        if button.titleLabel?.text == allQuestions[currentIndex]?.correctAnswer {
            correctAnswerGiven()
        } else {
            incorrectAnswerGiven()
        }
    }
    
    func correctAnswerGiven() {
        correctAnsersCount += 1
        currentIndex += 1
        showWinMessage()
    }
    
    func incorrectAnswerGiven() {
        Game.shared.addResult()
        showLoseMessage()
    }
    
    func showWinMessage() {
        
        let alertWIndow = UIAlertController(title: "Верно!", message: "Вы ответили на \(correctAnsersCount) из \(allQuestions.count) вопросов!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Дальше!", style: .cancel, handler: {_ in
            self.showCurrentQuestion()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    func showLoseMessage() {
        
        self.gameDelegate?.didEndGame(withResult: correctAnsersCount, allQuestionsCount: allQuestions.count)
        
        let alertWIndow = UIAlertController(title: "Неправильно!", message: "Вы ответили на \(correctAnsersCount) из \(allQuestions.count) вопросов!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Выход", style: .cancel, handler: {_ in
            self.backToMainMenu()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    private func showCurrentQuestion() {
        
        guard let question = allQuestions[currentIndex] else {return}
        
        LabelNumberOfQuestion.text = "Вопрос № \(currentIndex + 1)"
        LabelQuestionText.text = question.question
        ButtonAnswer1.setTitle(question.answer1, for: .normal)
        ButtonAnswer2.setTitle(question.answer2, for: .normal)
        ButtonAnswer3.setTitle(question.answer3, for: .normal)
        ButtonAnswer4.setTitle(question.answer4, for: .normal)
    }
    
    func backToMainMenu() {
        self.performSegue(withIdentifier: "MainMenuSegue", sender: self)
    }
}

