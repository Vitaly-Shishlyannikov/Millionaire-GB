//
//  RandomGetQuestionStrategy.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 29.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

final class RandomGetQuestionStrategy: GetQuestionStrategy {
    func getQuestions() -> [Question?] {
        let questions = DataManager.getAllQuestions()
        let shuffledQuestions = questions.shuffled()
        return shuffledQuestions
    }
}
