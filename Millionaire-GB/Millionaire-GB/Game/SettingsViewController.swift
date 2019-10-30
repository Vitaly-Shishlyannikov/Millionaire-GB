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
}
