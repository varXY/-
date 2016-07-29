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

	var QLabelHeight = CGFloat()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		rowLabel.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
		rowLabel.font = UIFont.boldSystemFontOfSize(20)
		rowLabel.textAlignment = .Center

		ALabel.textColor = UIColor.grayColor()

		contentView.addSubview(QLabel)
		contentView.addSubview(rowLabel)
		contentView.addSubview(ALabel)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configureForAnsweredQACell(QLabel: UILabel, rightOrWrong: Int, row: Int, rightAnswer: String) {
		func copyLabel(label: UILabel) {
			self.QLabel.frame = label.frame
			self.QLabel.numberOfLines = 0
			self.QLabel.text = label.text
		}

		copyLabel(QLabel)
		QLabelHeight = QLabel.frame.height
		ALabel.frame = CGRect(x: 35, y: QLabelHeight + 15, width: ScreenWidth - 45, height: 30)
		ALabel.text = rightAnswer
		rowLabel.text = String(row)       
		rowLabel.textColor = rightOrWrong == 1 ? UIColor.rightGreen() : UIColor.themeRed()
	}

}

