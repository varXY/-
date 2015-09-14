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
	var global = Global()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		// QLabel.frame = CGRect(x: 10, y: 5, width: global.size.width - 20, height: 44)
		self.contentView.addSubview(QLabel)

		// ALabel.frame = CGRect(x: 10, y: 52, width: global.size.width - 20, height: 44)
		self.contentView.addSubview(ALabel)
	}

	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configrueForAnsweredQACell(question: Question, rightOrWrong: Int) {

		var count = 0

		for i in question.question {
			count += 1
		}

		let room = global.size.width / CGFloat(count)
		println(room)

		if room > 18.0 {
			QLabel.numberOfLines = 1
			QLabel.frame = CGRect(x: 10, y: 5, width: global.size.width - 20, height: 22)
			ALabel.frame = CGRect(x: 10, y: 30, width: global.size.width - 20, height: 22)
		}

		if room < 18 && room > 9 {
			QLabel.numberOfLines = 2
			QLabel.frame = CGRect(x: 10, y: 5, width: global.size.width - 20, height: 44)
			ALabel.frame = CGRect(x: 10, y: 52, width: global.size.width - 20, height: 22)
		}

		if room < 9 {
			QLabel.numberOfLines = 3
			QLabel.frame = CGRect(x: 10, y: 5, width: global.size.width - 20, height: 66)
			ALabel.frame = CGRect(x: 10, y: 74, width: global.size.width - 20, height: 22)
		}

		QLabel.text = question.question
		println(QLabel.numberOfLines)
		ALabel.text = question.rightAnswer

		if rightOrWrong == 1 {
			self.contentView.backgroundColor = UIColor.greenColor()
		} else {
			self.contentView.backgroundColor = UIColor.redColor()
		}
	}

}

