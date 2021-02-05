//
//  QuestionTableViewCell.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 30/01/21.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    // MARK: Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        questionLabel.adjustsFontSizeToFitWidth = true
        answerLabel.adjustsFontSizeToFitWidth = true
        containerView.layer.cornerRadius = 10
        borderView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        containerView.layer.borderWidth = 1
        selectionStyle = .none
        answerLabel.textColor = UIColor.systemGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
