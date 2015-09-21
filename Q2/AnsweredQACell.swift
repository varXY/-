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
	var QLabelHeight = CGFloat()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		rowLabel.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
		rowLabel.font = UIFont.boldSystemFontOfSize(20)
		rowLabel.textAlignment = .Center

		ALabel.textColor = Global.grayColor()

		self.addSubview(QLabel)
		self.contentView.addSubview(rowLabel)
		self.contentView.addSubview(ALabel)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configureForAnsweredQACell(QLabel: UILabel, rightOrWrong: Int, row: Int, rightAnswer: String) {
		copyLabel(QLabel)
		QLabelHeight = QLabel.frame.height
		ALabel.frame = CGRect(x: 35, y: QLabelHeight + 15, width: global.size.width - 45, height: 30)
		ALabel.text = rightAnswer
		rowLabel.text = "\(row)"

		if rightOrWrong == 1 {
			self.rowLabel.textColor = UIColor.greenColor()
		} else {
			self.rowLabel.textColor = Global.redColor()
		}
	}

	func copyLabel(label: UILabel) {
		QLabel.frame = label.frame
		QLabel.numberOfLines = 0
		QLabel.text = label.text
	}

}

