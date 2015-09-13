//
//  AnsweredQACell.swift
//  Q2
//
//  Created by 文川术 on 15/9/13.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class AnsweredQACell: UITableViewCell {

	var QLabel = UILabel()
	var ALabel = UILabel()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		QLabel.frame = CGRect(x: 5, y: 5, width: 300, height: 44)
		QLabel.numberOfLines = 0
		self.contentView.addSubview(QLabel)

		let date = NSDate()
		ALabel.frame = CGRect(x: 5, y: 52, width: 300, height: 44)
		self.contentView.addSubview(ALabel)
	}

	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configrueForAnsweredQACell(question: Question) {
		QLabel.text = question.question
		ALabel.text = question.rightAnswer
	}

}

