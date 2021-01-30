//
//  QuestionTableViewCell.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 30/01/21.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    var questionLabel: UILabel!
    var iconImageView: UIImageView!
    var answerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        questionLabel = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.width * 0.85, height: self.frame.height))
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        self.addSubview(questionLabel)
        iconImageView = UIImageView(frame: CGRect( x:  self.frame.width * 0.9, y: 20, width: 30, height: 10))
        iconImageView.tintColor = .gray
       // iconImageView.trailingAnchor.anchorWithOffset(to: question)
        iconImageView.image = UIImage(systemName: "chevron.down")
        self.addSubview(iconImageView)
        
        answerLabel = UILabel(frame: CGRect(x: 15, y:  self.frame.height + 10, width: self.frame.width * 0.9, height: 100))
        answerLabel.numberOfLines = 0
        
        answerLabel.isHidden = false
        self.addSubview(answerLabel)
        
        
        
   //     NSLayoutXAxisAnchor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
