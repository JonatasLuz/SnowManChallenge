//
//  AddQuestionViewController.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 01/02/21.
//

import UIKit

class AddQuestionViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        subcribeKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeKeyboardNotification()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
           else {
             // if keyboard size is not available for some reason, dont do anything
             return
           }

           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
           scrollView.contentInset = contentInsets
           scrollView.scrollIndicatorInsets = contentInsets
         
         // move the root view up by the distance of keyboard height
    //     self.view.frame.origin.y = 0 - keyboardSize.height
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
  //      self.view.frame.origin.y = 0
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                
            
            // reset back the content inset to zero after keyboard is gone
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}