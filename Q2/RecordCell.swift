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

	var recordLabel = UILabel()
	var dateLabel = UILabel()
	var colorView = UIView()
	var global = Global()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		colorView.frame = CGRect.zeroRect
		colorView.backgroundColor = UIColor.redColor()
		self.contentView.addSubview(colorView)

		recordLabel.frame = CGRect(x: 250, y: 5, width: 50, height: 44)
		self.contentView.addSubview(recordLabel)

		dateLabel.frame = CGRect(x: 5, y: 5, width: 180, height: 44)
		self.contentView.addSubview(dateLabel)
	}

	func configureForRecordCell(record: Record) {
		self.colorView.frame = CGRect(x: 0, y: 0, width: self.global.size.width / 10 * CGFloat(record.record), height: 60)
		self.recordLabel.text = "\(record.record)/10"
		self.dateLabel.text = "\(dateFormatter.stringFromDate(record.date))"
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}


}
