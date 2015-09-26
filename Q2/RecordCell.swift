//
//  RecordCell.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class RecordCell: UITableViewCell {

	var global = Global()

	var recordLabel = UILabel()
	var dateLabel = UILabel()
	var colorView = UIView()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		colorView.frame = CGRect.zero
		colorView.backgroundColor = Global.lightRedColor()
		colorView.alpha = 0.3
		self.contentView.addSubview(colorView)

		recordLabel.frame = CGRect(x: global.size.width - 60, y: 10, width: 50, height: 44)
		recordLabel.textColor = UIColor.lightGrayColor()
		self.contentView.addSubview(recordLabel)

		dateLabel.frame = CGRect(x: 20, y: 10, width: global.size.width - 80, height: 44)
		dateLabel.textColor = UIColor.blackColor()
		dateLabel.font = UIFont.boldSystemFontOfSize(18)
		self.contentView.addSubview(dateLabel)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	func configureForRecordCell(record: Record) {
		self.colorView.frame = CGRect(x: 0, y: 5, width: self.global.size.width / 10 * CGFloat(record.record), height: 56)
		self.recordLabel.text = "\(record.record)/10"
		self.dateLabel.text = "\(dateFormatter.stringFromDate(record.date))"
	}

	func showNoRecord() {
		self.dateLabel.textColor = UIColor.grayColor()
		self.dateLabel.text = "你还没有答题记录。"
	}


}
