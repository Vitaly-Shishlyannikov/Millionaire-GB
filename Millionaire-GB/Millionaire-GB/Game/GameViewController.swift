//
//  ViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 23.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func infoAboutGame(currentIndex: Int, correctAnswersCount: Int, allQuestionsCount: Int)
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
    
    private let indexRestorationKey = "currentQuestionIndex"
    
    weak var gameDelegate: GameViewControllerDelegate?
    
    private var currentIndex: Int = 0
    
    private var correctAnswersCount: Int = 0
    
    private var allQuestions = [Question?]()
    
    private var orderOfQuestions = Game.shared.session?.orderOfQuestions ?? .direct
    
    private var numberOfQuestion: Int = 0
    
    private var percentOfCorrectAnswers: Int = 0
    
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
        
        let session = GameSession()
        Game.shared.session = session
        
        LabelQuestionText.numberOfLines = 0
        LabelNumberOfQuestion.numberOfLines = 0
        
        allQuestions = getQuestionStrategy.getQuestions()
        
        self.gameDelegate?.infoAboutGame(currentIndex: currentIndex, correctAnswersCount: correctAnswersCount, allQuestionsCount: allQuestions.count)
        
        let observedNumber = Game.shared.session?.numberOfQuestion
        observedNumber?.addObserver(self, options: [.new, .initial], closure: {[weak self] (number,_)  in
            self?.numberOfQuestion = number
        })
        
        let observedPercent = Game.shared.session?.percentOfCorrectAnswers
        observedPercent?.addObserver(self, options: [.new, .initial], closure: {[weak self] (percent,_)  in
            self?.percentOfCorrectAnswers = percent
        })
        
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
    
    private func answerButtonPressed(button: UIButton) {
        
        if button.titleLabel?.text == allQuestions[currentIndex]?.correctAnswer {
            correctAnswerGiven()
        } else {
            showLoseMessageAndExit()
        }
    
        self.gameDelegate?.infoAboutGame(currentIndex: currentIndex, correctAnswersCount: correctAnswersCount, allQuestionsCount: allQuestions.count)
    }
    
    private func correctAnswerGiven() {
        
        correctAnswersCount += 1
        
        if correctAnswersCount == allQuestions.count {
            showFinalWinMessageAndExit()
        } else {
            currentIndex += 1
            showWinMessageAndNext()
        }
    }
    
    private func showWinMessageAndNext() {
        
        let alertWIndow = UIAlertController(title: "Верно!", message: "Вы ответили на \(correctAnswersCount) из \(allQuestions.count) вопросов!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Дальше", style: .cancel, handler: {_ in
            self.showCurrentQuestion()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    private func showFinalWinMessageAndExit() {
        
        let alertWIndow = UIAlertController(title: "Победа!", message: "Вы ответили верно на все вопросы!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Забрать Милион!", style: .cancel, handler: {_ in
            self.backToMainMenu()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    private func showLoseMessageAndExit() {
        
        let alertWIndow = UIAlertController(title: "Неправильно!", message: "Вы ответили на \(correctAnswersCount) из \(allQuestions.count) вопросов!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Выход", style: .cancel, handler: {_ in
            self.backToMainMenu()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    private func showCurrentQuestion() {
        
        LabelNumberOfQuestion.text = "Вопрос № \(numberOfQuestion). Вы уже ответили верно на \(percentOfCorrectAnswers)% вопросов"
        
        guard let question = allQuestions[currentIndex] else {return}
        
        LabelQuestionText.text = question.question
        ButtonAnswer1.setTitle(question.answer1, for: .normal)
        ButtonAnswer2.setTitle(question.answer2, for: .normal)
        ButtonAnswer3.setTitle(question.answer3, for: .normal)
        ButtonAnswer4.setTitle(question.answer4, for: .normal)
    }
    
    private func backToMainMenu() {
        Game.shared.addResult()
        self.performSegue(withIdentifier: "MainMenuSegue", sender: self)
    }
}

extension GameViewController: GameViewControllerDelegate {
    func infoAboutGame(currentIndex: Int, correctAnswersCount correctanswersCount: Int, allQuestionsCount: Int) {
    }
}

