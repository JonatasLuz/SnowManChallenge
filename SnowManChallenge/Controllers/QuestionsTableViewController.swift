//
//  QuestionsTableViewController.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 26/01/21.
//

import UIKit
import CoreData

class QuestionsTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var addQuestionButton: UIButton!
    @IBOutlet weak var questionsTableView: UITableView!
    var didtap: Bool = false
    var currentRow = -1
    var lastTapped = -1
    var colapse = false
    var count = 0
    
    var questions: [Question] = []
    override func viewDidLoad() {
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        super.viewDidLoad()
        addQuestionButton.backgroundColor = .goldenYellow()
        addQuestionButton.tintColor = .darkBlue()
        addQuestionButton.layer.cornerRadius = 10
        
        questionsTableView.register(UINib(nibName: "QuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
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
        return questions.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! QuestionTableViewCell
        cell.questionLabel.text = questions[indexPath.row].question
        cell.answerLabel.text = questions[indexPath.row].answer
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
            }
            return 90
        }
        if indexPath.row == currentRow {
            return UITableView.automaticDimension
        }
        return 90
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
