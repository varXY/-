//
//  EquationCell.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class EquationCell: UITableViewCell, UITextFieldDelegate {

	var titleLabel = UILabel()
	var numberField = UITextField()
	var unitLabel = UILabel()
	var global = Global()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		titleLabel.frame = CGRect(x: 5, y: 5, width: 40, height: 40)
		self.contentView.addSubview(titleLabel)

		numberField.frame = CGRect(x: 45, y: 5, width: global.size.width - 100, height: 40)
		numberField.placeholder = "请输入"
		numberField.delegate = self
		numberField.keyboardType = .NumberPad
		numberField.textAlignment = .Right
		self.contentView.addSubview(numberField)

		unitLabel.frame = CGRect(x: global.size.width - 35, y: 5, width: 40, height: 40)
		self.contentView.addSubview(unitLabel)
	}

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configureForEquationCell() {
		numberField.becomeFirstResponder()
		self.titleLabel.text = "U"
		self.unitLabel.text = "V"
		println(UITextFieldTextDidChangeNotification)
	}

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

		let oldText: NSString = textField.text
		let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
		let number = newText.intValue
		println(newText)
		return true
	}



	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}