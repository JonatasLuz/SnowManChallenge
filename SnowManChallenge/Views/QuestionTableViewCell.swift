//
//  QuestionTableViewCell.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 30/01/21.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        questionLabel.adjustsFontSizeToFitWidth = true
        answerLabel.adjustsFontSizeToFitWidth = true
        containerView.layer.borderWidth = 2
        containerView.layer.cornerRadius = 10
        selectionStyle = .none
        answerLabel.textColor = UIColor.systemGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
