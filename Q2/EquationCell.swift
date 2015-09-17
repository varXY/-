//
//  EquationCell.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class EquationCell: UITableViewCell {

	var titleLabel = UILabel()
	var unitLabel = UILabel()
	var global = Global()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		titleLabel.frame = CGRect(x: 5, y: 5, width: 40, height: 40)
		self.contentView.addSubview(titleLabel)

		unitLabel.frame = CGRect(x: global.size.width - 35, y: 5, width: 40, height: 40)
		self.contentView.addSubview(unitLabel)
	}

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configureForEquationCell(first: String, last: String) {
		self.titleLabel.text = first
		self.unitLabel.text = last
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}