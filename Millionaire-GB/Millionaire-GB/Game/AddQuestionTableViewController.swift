//
//  AddQuestionTableViewController.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 30.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import UIKit

final class AddQuestionTableViewController: UITableViewController {
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answer1Text: UITextField!
    @IBOutlet weak var answer2Text: UITextField!
    @IBOutlet weak var answer3Text: UITextField!
    @IBOutlet weak var answer4Text: UITextField!
    
    @IBOutlet weak var saveQuestionButton: UIBarButtonItem!
    @IBOutlet weak var addQuestionButton: UIBarButtonItem!
    
    private var addedQuestionsCaretaker = AddedQuestonsCaretaker()
    
    private var addedQuestions = [Question]() {
        didSet {
            addedQuestionsCaretaker.save(addedQuestions: self.addedQuestions)
        }
    }
    
    private var questionsCount = 1
    
    private let addedQuestionsBuilder = AddedQuestionBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveQuestionButton.addTargetForAction(target: self, action: #selector(saveButtonPressed))
        
        addQuestionButton.addTargetForAction(target: self, action: #selector(addButtonPressed))
        
        tableView.rowHeight = 250
    }
    
    @objc func saveButtonPressed (sender: UIButton) {
        
        self.addedQuestions = addedQuestionsBuilder.build(questionsCount: questionsCount, tableView: self.tableView)
        
        self.performSegue(withIdentifier: "MainMenuSegue", sender: self)
    }
    
    @objc func addButtonPressed (sender: UIButton) {
        questionsCount += 1
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.reusindentifier, for: indexPath) as? QuestionTableViewCell else {return UITableViewCell()}
        
        return cell
    }
}

extension UIBarButtonItem {
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}
