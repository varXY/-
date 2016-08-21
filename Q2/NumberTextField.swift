//
//  NumberTextField.swift
//  Q2
//
//  Created by 文川术 on 15/9/18.
//  Copyright © 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class NumberTextField: UITextField {

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: 5, y: 0, width: bounds.width - 10, height: bounds.height)
	}

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: 5, y: 0, width: bounds.width - 10, height: bounds.height)
	}

	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: 5, y: 0, width: bounds.width - 10, height: bounds.height)
	}

	class func getTextFields(_ frame: CGRect) -> NumberTextField {
		let textField = NumberTextField()
		textField.frame = frame
		textField.layer.cornerRadius = globalRadius
		textField.layer.borderWidth = 1.0
		textField.tintColor = UIColor.themeRed()
		textField.layer.borderColor = UIColor.themeRed().cgColor
		textField.keyboardType = .decimalPad
		textField.textAlignment = .right
		return textField
	}
    
}
