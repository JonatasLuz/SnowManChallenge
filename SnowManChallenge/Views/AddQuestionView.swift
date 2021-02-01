//
//  AddQuestionView.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 01/02/21.
//

import UIKit

class AddQuestionView: UIView {
    
    @IBOutlet weak var addQuestionView: UIView!
    @IBOutlet weak var addAnwerView: UIView!
    @IBOutlet weak var yellowPickerVIew: UIView!
    @IBOutlet weak var pinkPickerView: UIView!
    @IBOutlet weak var greenPickerView: UIView!
    @IBOutlet weak var bluePickerView: UIView!
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        configureViewBorderAppearance(view: addQuestionView)
        configureViewBorderAppearance(view: addAnwerView)
        configureColorViewAppearance(view: yellowPickerVIew, color: .goldenYellow())
        configureColorViewAppearance(view: greenPickerView, color: .lightGreen())
        configureColorViewAppearance(view: pinkPickerView, color: .lightPink())
        configureColorViewAppearance(view: bluePickerView, color: .darkBlue())
    }
    
    private func configureColorViewAppearance(view: UIView, color: UIColor){
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
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
