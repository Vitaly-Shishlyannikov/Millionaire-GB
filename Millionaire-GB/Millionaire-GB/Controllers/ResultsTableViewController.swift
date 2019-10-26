//
//  ResultsTableViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 26.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var results = [Result]()
    let resultsCaretaker = ResultsCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        results = resultsCaretaker.retrieveResults()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let result = results[indexPath.row]

        cell.textLabel?.text = "\(result.date)         \(result.resultValue)"

        return cell
    }
}
