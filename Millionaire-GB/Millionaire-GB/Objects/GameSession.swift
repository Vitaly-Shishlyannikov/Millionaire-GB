//
//  GameSession.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 25.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

final class GameSession {
    
    var questionsCount: Int = 0
    var numberOfQuestion = Observable<Int>(0)
    var correctAnswersCount: Int = 0
    var orderOfQuestions: OrderOfQuestions = .direct
    var percentOfCorrectAnswers = Observable<Int>(0)
}
