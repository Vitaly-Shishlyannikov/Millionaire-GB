//
//  SettingsViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 29.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionsOrderSwitch: UISegmentedControl!
    
    @IBAction func switchOrder(_ sender: Any) {
        Game.shared.session?.orderOfQuestions = selectedOrderOfQuestions
    }
    @IBOutlet weak var addQuestionsButton: UIButton!
    
    @IBAction func addQuestionButtonPressed(_ sender: Any) {
    }
    
    var selectedOrderOfQuestions: OrderOfQuestions {
        switch self.questionsOrderSwitch.selectedSegmentIndex {
        case 0:
            return .direct
        case 1:
            return .random
        default:
            return .direct
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addQuestionsButton.layer.cornerRadius = 5
        addQuestionsButton.layer.borderWidth = 3.0
//        addQuestionsButton.layer.borderColor = UI
        addQuestionsButton.clipsToBounds = true
        
    }
}
