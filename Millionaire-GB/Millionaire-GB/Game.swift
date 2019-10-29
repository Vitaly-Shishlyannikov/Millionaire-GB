//
//  Game.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 25.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

class Game {
    
    static let shared = Game()
    
    var session: GameSession?
    
    var orderOfQuestions: OrderOfQuestions = .direct
    
    private(set) var results: [Result] {
        didSet {
            resultsCaretaker.save(results: self.results)
        }
    }
    
    private let resultsCaretaker = ResultsCaretaker()
    
    private init() {
        self.results = self.resultsCaretaker.retrieveResults()
    }
    
    func addResult() {
        guard let answersCount = session?.correctAnswersCount,
              let questionsCount = session?.questionsCount else {return}
        let resultInPercents = Double(answersCount) / Double(questionsCount) * 100
        let result = Result(date: Date(), resultValue: Int(resultInPercents))
        self.results.append(result)
        
        self.session = nil
    }
}

struct Result: Codable {
    var date = Date()
    var resultValue = Int()
}


