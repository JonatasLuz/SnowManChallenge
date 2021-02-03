//
//  AddQuestionViewController.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 01/02/21.
//

import UIKit
import CoreData

class AddQuestionViewController: UIViewController {

    
    @IBOutlet var addQuestionView: AddQuestionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextView: UITextView!
    private var lastTappedButton: UIButton!
    private var newQuestion: NSManagedObject!
    private var pickedColor: String!
    private var context: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        subcribeKeyboardNotification()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        context = appDelegate.persistentContainer.viewContext
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeKeyboardNotification()
    }
    
    
    // MARK: Private Functions
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @IBAction private func greenButtonAction(_ sender: UIButton) {
        if lastTappedButton != sender {
            pickedColor = "lightGreen"
            changeCheckmark(button: sender)
        }
    }
    
    @IBAction private func pinkButtonAction(_ sender: UIButton) {
        if lastTappedButton != sender {
            pickedColor = "lightPink"
            changeCheckmark(button: sender)
        }
    }
    @IBAction private func bluebuttonAction(_ sender: UIButton) {
        if lastTappedButton != sender {
            pickedColor = "dakrBlue"
            changeCheckmark(button: sender)
        }
    }
    
    @IBAction private func yellowButtonAction(_ sender: UIButton) {
        if lastTappedButton != sender {
            pickedColor = "goldenYellow"
            changeCheckmark(button: sender)
        }
    }
    @IBAction private func addQuestionAction(_ sender: UIButton) {
        guard let questionText = questionTextField.text else {
            return
        }
        if questionText.isEmpty || answerTextView.text.isEmpty || pickedColor == nil {
            //TODO: Add an alert when the user hasnt picked a color or wrote the question/answer
        } else {
            guard let entity = NSEntityDescription.entity(forEntityName: "Question", in: context) else {
                return
            }
            newQuestion = NSManagedObject(entity: entity, insertInto: context)
            newQuestion.setValue(questionTextField.text, forKeyPath: "question")
            newQuestion.setValue(answerTextView.text, forKeyPath: "answer")
            newQuestion.setValue(pickedColor, forKey: "colorName")
            do {
                try context.save()
            } catch {
                print("Could not save. \(error))")
            }
            NotificationCenter.default.post(name: .addedQuestion, object: nil)
            animatePopVC()
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    private func animatePopVC() {
        let popAnimation = CATransition()
        popAnimation.duration = 1
        popAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        popAnimation.type = CATransitionType.moveIn
        popAnimation.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(popAnimation, forKey: nil)
    }
    
    private func changeCheckmark(button: UIButton) {
        addQuestionView.setCheckmark(button: button)
        if lastTappedButton != nil {
            lastTappedButton.setImage(nil, for: .normal)
        }
        lastTappedButton = button
    }
    
    private func subcribeKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unsubscribeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
