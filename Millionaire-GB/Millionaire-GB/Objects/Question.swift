//
//  Question.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 23.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

struct Question: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correctAnswer: String
    var helpOfFriend: String
    var helpOfAudience: String
}

