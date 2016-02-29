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

	var global = Global()

	var titleLabel = UILabel()
	var unitLabel = UILabel()
	var equalLabel =  UILabel()

	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.frame = CGRect(x: 0, y: 0, width: global.size.width, height: global.rowHeight)

		titleLabel.frame = CGRect(x: 15, y: 0, width: 40, height: self.frame.height)
		titleLabel.font = UIFont.boldSystemFontOfSize(20)
		titleLabel.textAlignment = .Center
		titleLabel.textColor = UIColor.themeRed()
		self.contentView.addSubview(titleLabel)

		equalLabel.frame = CGRect(x: 55, y: 0, width: 20, height: self.frame.height)
		equalLabel.textAlignment = .Right
		equalLabel.textColor = UIColor.lightGrayColor()
		self.contentView.addSubview(equalLabel)

		unitLabel.frame = CGRect(x: global.size.width - 55, y: 0, width: 40, height: self.frame.height)
		unitLabel.textColor = UIColor.lightGrayColor()
		unitLabel.textAlignment = .Left
		self.contentView.addSubview(unitLabel)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	func configureForEquationCell(first: String, last: String) {
		self.titleLabel.text = first
		self.equalLabel.text = ""
		self.unitLabel.text = last
	}


	
	
}