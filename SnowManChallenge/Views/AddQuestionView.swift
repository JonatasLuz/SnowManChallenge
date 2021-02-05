//
//  AddQuestionView.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 01/02/21.
//

import UIKit

class AddQuestionView: UIView {
    
    // MARK: Variables
    @IBOutlet weak var addQuestionView: UIView!
    @IBOutlet weak var addAnwerView: UIView!
    @IBOutlet weak var yellowPickerVIew: UIView!
    @IBOutlet weak var pinkPickerView: UIView!
    @IBOutlet weak var greenPickerView: UIView!
    @IBOutlet weak var bluePickerView: UIView!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: Private Variables
    
    private var newQuestion: Question!
    
    // MARK: Overrides
    
    override func awakeFromNib() {
        configureViewBorderAppearance(view: addQuestionView)
        configureViewBorderAppearance(view: addAnwerView)
        configureColorViewAppearance(view: yellowPickerVIew, color: .goldenYellow())
        configureColorViewAppearance(view: greenPickerView, color: .lightGreen())
        configureColorViewAppearance(view: pinkPickerView, color: .lightPink())
        configureColorViewAppearance(view: bluePickerView, color: .darkBlue())
        configureButtonAppearance(button: addButton)
    }
    
    // MARK: Private Functions
    
    private func configureColorViewAppearance(view: UIView, color: UIColor) {
        view.layer.borderWidth = 1
        view.backgroundColor = color
        view.backgroundColor = color
        view.layer.borderColor = UIColor.systemGray3.cgColor
        let sublayer = CALayer()
        sublayer.borderColor = UIColor.white.cgColor
        sublayer.borderWidth = 5
        sublayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        sublayer.cornerRadius =  view.frame.size.width/2
        view.layer.cornerRadius = view.frame.size.width/2
        view.layer.addSublayer(sublayer)
    }
    
    private func configureViewBorderAppearance(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        view.layer.cornerRadius = 10
    }
    
    private func removeCheckMark(button: UIButton) {
        button.setImage(nil, for: .normal)
    }
    
    private func configureButtonAppearance(button: UIButton) {
        button.backgroundColor = .goldenYellow()
        button.tintColor = .darkBlue()
        button.layer.cornerRadius = 10
        
    }
    
    // MARK: Public Functions
    
    func setCheckmark(button: UIButton) {
        let checkMarkImage = UIImage(systemName: "checkmark")
        button.tintColor = .white
        button.setImage(checkMarkImage, for: .normal)
        button.contentMode = .center
    }
    
}
