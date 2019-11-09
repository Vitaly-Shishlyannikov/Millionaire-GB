//
//  AddedQuestionsCaretaker.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 31.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

final class AddedQuestonsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "addedQuestions"
    
    func save(addedQuestions: [Question]) {
        do {
            let data = try self.encoder.encode(addedQuestions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveAddedQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {return[]}
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
