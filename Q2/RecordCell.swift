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

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.backgroundColor = UIColor.backgroundColor()

		colorView.frame = CGRect.zero
		colorView.backgroundColor = UIColor.lightRedColor()
		colorView.alpha = 0.3
		contentView.addSubview(colorView)

		recordLabel.frame = CGRect(x: ScreenWidth - 60, y: 10, width: 50, height: 44)
		recordLabel.textColor = UIColor.lightGray
		contentView.addSubview(recordLabel)

		dateLabel.frame = CGRect(x: 20, y: 10, width: ScreenWidth - 80, height: 44)
		dateLabel.textColor = UIColor.black
		dateLabel.font = UIFont.boldSystemFont(ofSize: 18)
		contentView.addSubview(dateLabel)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	func configureForRecordCell(_ record: Record) {
		colorView.frame = CGRect(x: 0, y: 5, width: ScreenWidth / 10 * CGFloat(record.record), height: 55)
		recordLabel.text = "\(record.record)/10"
		dateLabel.text = "\(dateFormatter.string(from: record.date))"
	}

	func showNoRecord() {
		dateLabel.textColor = UIColor.gray
		dateLabel.text = "你还没有答题记录。"
	}

}
