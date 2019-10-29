//
//  GameSession.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 25.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

final class GameSession: Codable {
    
    var questionsCount: Int?
    var correctAnswersCount: Int?
    
//    let vc: GameViewController
    
//    override init() {
//        vc = GameViewController()
//        super.init()
//        vc.gameDelegate = self
//    }
}

//extension GameSession: GameViewControllerDelegate {
//    
//    func didEndGame(withResult result: Int, allQuestionsCount allCount: Int, moneyWinned money: String) {
//        
//        let session = Game.shared.session
//        session?.questionsCount = allCount
//        session?.correctAnswersCount = result
//        session?.prizeMoney = money
//    }
//}
