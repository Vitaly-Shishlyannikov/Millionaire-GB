//
//  ResultsCaretaker.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 26.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

final class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "results"
    
    func save(results: [Result]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else {return[]}
        do {
            return try self.decoder.decode([Result].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
