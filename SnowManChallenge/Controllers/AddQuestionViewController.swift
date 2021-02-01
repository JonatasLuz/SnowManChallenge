//
//  AddQuestionViewController.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 01/02/21.
//

import UIKit

class AddQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        subcribeKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeKeyboardNotification()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
