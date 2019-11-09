//
//  GetQuestionStrategy.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 29.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

protocol GetQuestionStrategy {
//    var questions: [Question] {get set}
    
    func getQuestions() -> [Question?]
}
