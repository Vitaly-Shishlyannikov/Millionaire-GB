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
        
        guard let resultInPercents = session?.percentOfCorrectAnswers.value else {return}
        let result = Result(date: Date(), resultValue: resultInPercents)
        self.results.append(result)
        
        self.session = nil
    }
}

struct Result: Codable {
    var date = Date()
    var resultValue = Int()
}


