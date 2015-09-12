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
		recordLabel.text = "xiaoyao"
		self.contentView.addSubview(recordLabel)

		let date = NSDate()
		dateLabel.frame = CGRect(x: 5, y: 5, width: 150, height: 44)
		dateLabel.text = "\(date)"
		self.contentView.addSubview(dateLabel)
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	override func awakeFromNib() {
		super.awakeFromNib()


	}
}
