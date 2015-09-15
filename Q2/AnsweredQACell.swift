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

	var rowLabel = UILabel()
	var QLabel = UILabel()
	var ALabel = UILabel()
	var global = Global()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		rowLabel.frame = CGRect(x: 5, y: 10, width: 25, height: 22)
		rowLabel.font = UIFont.boldSystemFontOfSize(20)

		QLabel.frame = CGRect(x: 30, y: 10, width: global.size.width - 40, height: 150)
		QLabel.numberOfLines = 0
		QLabel.lineBreakMode = .ByClipping

		self.contentView.addSubview(rowLabel)
		self.contentView.addSubview(QLabel)
		self.contentView.addSubview(ALabel)
	}

	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configureForRowLabel(row: Int) {
		rowLabel.text = "\(row)"
	}

	func configureForAnsweredQACell(question: Question, rightOrWrong: Int) {

		QLabel.text = question.question
		QLabel.sizeToFit()
		ALabel.frame = CGRect(x: 30, y: QLabel.frame.height + 15, width: global.size.width - 40, height: 22)
		ALabel.text = question.rightAnswer

		if rightOrWrong == 1 {
			self.contentView.backgroundColor = UIColor.greenColor()
		} else {
			self.contentView.backgroundColor = UIColor.redColor()
		}
	}

}

