//
//  MainMenuViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 25.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

final class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    var selectedOrderOfQuestions: OrderOfQuestions? 
    
    @IBAction func startGameButton(_ sender: Any) {
    }
    
    @IBAction func unwindToMainMenu(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "StartGameSegue"){
            guard let vc = segue.destination as? GameViewController else {return}
            vc.gameDelegate =  self
        }
    }
}

extension MainMenuViewController: GameViewControllerDelegate {
    
    func infoAboutGame(currentIndex: Int, correctAnswersCount: Int, allQuestionsCount: Int){
        
        let session = Game.shared.session
        session?.questionsCount = allQuestionsCount
        session?.correctAnswersCount = correctAnswersCount
        session?.numberOfQuestion.value = currentIndex + 1
    
        let percent = Int(Double(correctAnswersCount) / Double(allQuestionsCount) * 100)
        session?.percentOfCorrectAnswers.value = percent
    }
}
