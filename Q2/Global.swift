//
//  SizeClass.swift
//  Q2
//
//  Created by 文川术 on 15/9/13.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

let dateFormatter: NSDateFormatter = {
	let formatter = NSDateFormatter()
	formatter.dateStyle = .ShortStyle
	formatter.timeStyle = .ShortStyle
	return formatter
	}()

func delay(seconds seconds: Double, completion:()->()) {
	let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))

	dispatch_after(popTime, dispatch_get_main_queue()) {
		completion()
	}
}

class Global {
	
	var size = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
	var center = CGPoint(x: UIScreen.mainScreen().bounds.width / 2, y: UIScreen.mainScreen().bounds.height / 2)
	var rowHeight = UIScreen.mainScreen().bounds.height / 12

	let CGRedColor = Global.redColor().CGColor
	let CGGreenColor = UIColor.greenColor().CGColor
	let CGlightGrayColor = UIColor.lightGrayColor().CGColor
	let CGGrayColor = Global.grayColor().CGColor

	class func redColor() -> UIColor {
		return UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 1.0)
	}

	class func grayColor() -> UIColor {
		return UIColor(red: 66/255, green: 70/255, blue: 77/225, alpha: 1.0)
	}

	class func lightGrayColor() -> UIColor {
		return UIColor(red: 150/255, green: 154/255, blue: 152/255, alpha: 1.0)
	}

	func buttonSize() -> CGSize {
		var size = CGSize()

		switch self.size.height {
		case 480:
			size = CGSize(width: 100, height: 100)
		case 568:
			size = CGSize(width: 100, height: 100)
		case 667:
			size = CGSize(width: 140, height: 140)
		case 736:
			size = CGSize(width: 160, height: 160)
		default:
			size = CGSize(width: 100, height: 100)
		}

		return size
	}

	func margin() -> CGFloat {
		var marginY: CGFloat = 16

		switch self.size.height {
		case 480:
			marginY = 16
		case 568:
			marginY = 38
		case 667:
			marginY = 33.5
		case 736:
			marginY = 35.7
		default:
			marginY = 12
		}

		return marginY
	}

	func testBigButtonSize() -> CGSize {
		var buttonSize = CGSize()

		switch size.height {
		case 480:
			buttonSize = CGSize(width: 150, height: 150)
		case 568:
			buttonSize = CGSize(width: 150, height: 150)
		case 667:
			buttonSize = CGSize(width: 170, height: 170)
		case 736:
			buttonSize = CGSize(width: 180, height: 180)
		default:
			break
		}

		return buttonSize
	}

	func testSmallButtonSize() -> CGSize {
		var buttonSize = CGSize()

		switch size.height {
		case 480:
			buttonSize = CGSize(width: 85, height: 85)
		case 568:
			buttonSize = CGSize(width: 85, height: 85)
		case 667:
			buttonSize = CGSize(width: 100, height: 100)
		case 736:
			buttonSize = CGSize(width: 110, height: 110)
		default:
			break
		}

		return buttonSize
	}

}