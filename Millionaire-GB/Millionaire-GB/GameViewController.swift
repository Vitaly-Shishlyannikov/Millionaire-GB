//
//  ViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 23.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var LabelNumberOfQuestion: UILabel!
    @IBOutlet weak var LabelQuestionText: UILabel!
    @IBOutlet weak var ButtonAnswer1: UIButton!
    @IBOutlet weak var ButtonAnswer2: UIButton!
    @IBOutlet weak var ButtonAnswer3: UIButton!
    @IBOutlet weak var ButtonAnswer4: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let question1 = DataManager.shared.getQuestion(number: 1)
        
        LabelNumberOfQuestion.text = "Вопрос № , на кону  рублей"
        LabelQuestionText.text = question1.question
        ButtonAnswer1.setTitle(question1.answer1, for: .normal)
        ButtonAnswer2.setTitle(question1.answer2, for: .normal)
        ButtonAnswer3.setTitle(question1.answer3, for: .normal)
        ButtonAnswer4.setTitle(question1.answer4, for: .normal)
    }
}

