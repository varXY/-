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

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		recordLabel.frame = CGRect(x: 250, y: 5, width: 50, height: 44)
		self.contentView.addSubview(recordLabel)

		dateLabel.frame = CGRect(x: 5, y: 5, width: 180, height: 44)
		self.contentView.addSubview(dateLabel)
	}

	func configrueForRecordCell(record: Record) {
		self.recordLabel.text = "\(record.record)"
		self.dateLabel.text = "\(record.date)"
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}


}
