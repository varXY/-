//
//  RoundButton.swift
//  Q2
//
//  Created by 文川术 on 15/9/20.
//  Copyright © 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class RoundButton: UIButton {

	override func awakeFromNib() {
		super.awakeFromNib()
		print("hello")
		self.backgroundColor = UIColor.purpleColor()
		self.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
	}

	class func roundButton_1() -> RoundButton {
		let roundButton = RoundButton(type: .System)


		return roundButton
	}
}
