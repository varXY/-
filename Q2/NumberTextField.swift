//
//  NumberTextField.swift
//  Q2
//
//  Created by 文川术 on 15/9/18.
//  Copyright © 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class NumberTextfield: UITextField {

	override func editingRectForBounds(bounds: CGRect) -> CGRect {
		return CGRect(x: 5, y: 0, width: bounds.width - 10, height: bounds.height)
	}

	override func textRectForBounds(bounds: CGRect) -> CGRect {
		return CGRect(x: 5, y: 0, width: bounds.width - 10, height: bounds.height)
	}

	override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
		return CGRect(x: 5, y: 0, width: bounds.width - 10, height: bounds.height)
	}

	func getTextFields(frame: CGRect) -> NumberTextfield {
		let textField = NumberTextfield()
		textField.frame = frame
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 1.0
		textField.tintColor = UIColor.themeRed()
		textField.layer.borderColor = UIColor.themeRed().CGColor
//		textField.placeholder = "请输入"
		textField.keyboardType = .DecimalPad
		textField.textAlignment = .Right
		return textField
	}
}