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
    override func awakeFromNib() {
        addQuestionView.layer.borderWidth = 1
        addQuestionView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        addQuestionView.layer.cornerRadius = 10
        addAnwerView.layer.borderWidth = 1
        addAnwerView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        addAnwerView.layer.cornerRadius = 10
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
