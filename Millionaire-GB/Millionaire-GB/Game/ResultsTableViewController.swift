//
//  ResultsTableViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 26.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    private var results = [Result]()
    private let resultsCaretaker = ResultsCaretaker()
    private var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        results = resultsCaretaker.retrieveResults()
        
        for i in 1...results.count {
            numbers.append(i)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let number = numbers[indexPath.row]
        let result = results[indexPath.row]
        let resultValue = result.resultValue
      
        let date = result.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy  HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)

        cell.textLabel?.text = "\(number)      \(formattedDate)               \(resultValue)"

        return cell
    }
}
