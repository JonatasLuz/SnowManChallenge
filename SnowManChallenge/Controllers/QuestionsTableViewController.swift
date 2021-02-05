//
//  QuestionsTableViewController.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 26/01/21.
//

import UIKit
import CoreData

class QuestionsTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var addQuestionButton: UIButton!
    @IBOutlet weak var questionsTableView: UITableView!
    
    private var successView: UIView!
    private var tap: UITapGestureRecognizer!
    var didtap: Bool = false
    var currentRow = -1
    var lastTapped = -1
    var colapse = false
    var count = 0
    var searchBar: UISearchBar!
    var isFiltering: Bool {
        return !isSearchBarEmpty
    }
    var isSearchBarEmpty: Bool {
        return searchBar.text?.isEmpty ?? true
    }
    var searchButton: UIBarButtonItem!
    var cancelSearchButton: UIBarButtonItem!
    var questions: [Question] = []
    var filteredQuestions: [Question] = []
        
    override func viewDidLoad() {
        searchBar = UISearchBar()
        searchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action:#selector(self.setSearchBar))
        cancelSearchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action:#selector(self.cancelSearchBar))
        
        initiateSearchBar()
        navigationItem.rightBarButtonItem = searchButton
        navigationController?.navigationBar.barTintColor = UIColor.darkBlue()
        navigationController?.navigationBar.tintColor = UIColor.white
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        super.viewDidLoad()
        addQuestionButton.backgroundColor = .goldenYellow()
        addQuestionButton.tintColor = .darkBlue()
        addQuestionButton.layer.cornerRadius = 10
        questionsTableView.register(UINib(nibName: "QuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        NotificationCenter.default.addObserver(self, selector: #selector(addSuccesView), name: Notification.Name("addedQuestion"), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Question> = Question.fetchRequest()
        do {
            questions = try  context.fetch(fetchRequest)
        } catch {
            return
        }
        questionsTableView.reloadData()
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering {
            return filteredQuestions.count
        } else {
            return questions.count
        }
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! QuestionTableViewCell
        cell.questionLabel.text = questions[indexPath.row].question
        cell.answerLabel.text = questions[indexPath.row].answer
        var question: Question!
        if isFiltering {
            question = filteredQuestions[indexPath.row]
        } else {
            question = questions[indexPath.row]
        }
        cell.questionLabel.text = question.question
        cell.answerLabel.text = question.answer
        guard let colorName =  question.colorName else {
            return cell
        }
        let cellColor =  UIColor.resolveColorName(colorName: colorName)
        cell.containerView.backgroundColor = cellColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didtap = true
        count = 0
        colapse = false
        currentRow = indexPath.row
        if lastTapped == indexPath.row {
            colapse = true
        }
        lastTapped = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if colapse == true && indexPath.row == currentRow {
            count = count + 1
            if count == 2 {
                colapse = false
                lastTapped = -1
                return 85
            }
        }
        if indexPath.row == currentRow {
            return UITableView.automaticDimension
        }
        return 85
    }
    
    @objc func addSuccesView() {
        configureSuccessView()
        tap = UITapGestureRecognizer(target: self, action: #selector(dismissSuccessView))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissSuccessView(view: UIView) {
        successView.removeFromSuperview()
        self.view.removeGestureRecognizer(tap)
    }
    
    @objc func setSearchBar() {
        navigationItem.rightBarButtonItem = cancelSearchButton
        navigationItem.titleView = searchBar
    }
    
    @objc func cancelSearchBar() {
        searchBar.endEditing(true)
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.titleView = nil
        searchBar.text = nil
    }
    
    func configureSuccessView() {
        successView = UIView(frame: CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50))
        successView.backgroundColor = .lightGreen()
        self.view.addSubview(successView)
        let successLabel = UILabel()
        successView.addSubview(successLabel)
        successLabel.text = "Pergunta adicionada com sucesso"
        successLabel.font = UIFont(name: "Helvetica-Bold", size: 14)
        successLabel.frame.size.height = 50
        successLabel.textColor = .systemGray6
        successLabel.frame.size.width = 250
        successLabel.center = CGPoint(x: successView.frame.width/2, y: successView.frame.height/2)
        successLabel.textAlignment = .center
        let checkMarkSuccess = UIImageView(frame: CGRect(x: 20, y: 10, width: 30, height: 30))
        checkMarkSuccess.image = UIImage(systemName: "checkmark.circle.fill")
        checkMarkSuccess.tintColor = .systemGray6
        successView.addSubview(checkMarkSuccess)
    }
    
    
    func initiateSearchBar() {
        self.searchBar.showsCancelButton = false
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.searchTextField.leftView?.tintColor = .white
        searchBar.barTintColor = .white
        searchBar.searchTextField.textColor = .white
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredQuestions = searchText.isEmpty ? questions : questions.filter { (item: Question) -> Bool in
            return item.question!.lowercased().contains(searchText.lowercased())
        }
            questionsTableView.reloadData()
    }
    
}

extension Notification.Name {
    static let addedQuestion = Notification.Name("addedQuestion")
}
