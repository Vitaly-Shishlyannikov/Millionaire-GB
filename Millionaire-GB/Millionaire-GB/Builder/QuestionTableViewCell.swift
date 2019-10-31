//
//  QuestionTableViewCell.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 30.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    static let reusindentifier = "questionCell"
    
    @IBOutlet weak var questionTextfield: UITextField!
    @IBOutlet weak var answer1Textfield: UITextField!
    @IBOutlet weak var answer2Textfield: UITextField!
    @IBOutlet weak var answer3Textfield: UITextField!
    @IBOutlet weak var answer4Textfield: UITextField!
    @IBOutlet weak var correctAnswerNumberSwitch: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
