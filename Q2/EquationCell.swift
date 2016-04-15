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
	var equalLabel = UILabel()

	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: CellHeight)

		titleLabel.frame = CGRect(x: 15, y: 0, width: 40, height: self.frame.height)
		titleLabel.font = UIFont.boldSystemFontOfSize(20)
		titleLabel.textAlignment = .Center
		titleLabel.textColor = UIColor.themeRed()
		contentView.addSubview(titleLabel)

		equalLabel.frame = CGRect(x: 55, y: 0, width: 20, height: self.frame.height)
		equalLabel.textAlignment = .Right
		equalLabel.textColor = UIColor.lightGrayColor()
		contentView.addSubview(equalLabel)

		unitLabel.frame = CGRect(x: ScreenWidth - 55, y: 0, width: 40, height: self.frame.height)
		unitLabel.textColor = UIColor.lightGrayColor()
		unitLabel.textAlignment = .Left
		contentView.addSubview(unitLabel)
	}

	func configureForEquationCell(first: String, last: String) {
		titleLabel.text = first
		equalLabel.text = ""
		unitLabel.text = last
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}