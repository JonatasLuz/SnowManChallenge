//
//  AddQuestionViewController.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 01/02/21.
//

import UIKit

class AddQuestionViewController: UIViewController {

    
    @IBOutlet var addQuestionView: AddQuestionView!
    @IBOutlet weak var scrollView: UIScrollView!
    private var lastTappedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        subcribeKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeKeyboardNotification()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: Private Functions
    
    private func subcribeKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unsubscribeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func greenButtonAction(_ sender: UIButton) {
        if lastTappedButton != sender{
            changeCheckmark(button: sender)
        }
    }
    
    @IBAction func pinkButtonAction(_ sender: UIButton) {
        if lastTappedButton != sender{
            changeCheckmark(button: sender)
        }
    }
    @IBAction func bluebuttonAction(_ sender: UIButton) {
        if lastTappedButton != sender{
            changeCheckmark(button: sender)
        }
    }
    
    @IBAction func yellowButtonAction(_ sender: UIButton) {
        if lastTappedButton != sender{
            changeCheckmark(button: sender)
        }
    }
    
    func changeCheckmark(button: UIButton){
        addQuestionView.setCheckmark(button: button)
        if lastTappedButton != nil {
            lastTappedButton.setImage(nil, for: .normal)
        }
        lastTappedButton = button
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
