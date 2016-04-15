//
//  HudView.swift
//  MyLocations
//
//  Created by 文川术 on 15/7/24.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

class HudView_1: UIView {
	var text = ""

	class func hudInView(view: UIView, animated: Bool) -> HudView_1 {
		let hudView = HudView_1(frame: view.bounds)
		hudView.opaque = false

		view.addSubview(hudView)
		view.userInteractionEnabled = false
		hudView.showAnimated(animated)

		delay(seconds: 1.0) { 
			hudView.disappear(animated, done: {
				view.userInteractionEnabled = true
			})
		}
		return hudView
	}

	override func drawRect(rect: CGRect) {
		let boxWidth: CGFloat = 100
		let boxHeight: CGFloat = 116

		let boxRect = CGRect(x: round((bounds.size.width - boxWidth) / 2), y: round((bounds.size.height - boxHeight) / 2 - 60), width: boxWidth, height: boxHeight)

		let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
		UIColor(white: 0.3, alpha: 0.8).setFill()
		roundedRect.fill()

		if let image = UIImage(named: "Smile") {
			let imagePoint = CGPoint(x: center.x - round(image.size.width / 2), y: center.y - round(image.size.height / 2) - boxHeight / 8 - 60)
			image.drawAtPoint(imagePoint)
		}

		let attribs = [NSFontAttributeName: UIFont.systemFontOfSize(16.0), NSForegroundColorAttributeName: UIColor.whiteColor()]
		let textSize = text.sizeWithAttributes(attribs)
		let textPoint = CGPoint(x: center.x - round(textSize.width / 2), y: center.y - round(textSize.height / 2) + boxHeight / 4 - 55)
		text.drawAtPoint(textPoint, withAttributes: attribs)
	}

	func showAnimated(animated: Bool) {
		if animated {
			alpha = 0
			transform = CGAffineTransformMakeScale(1.3, 1.3)
			UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
				self.alpha = 1
				self.transform = CGAffineTransformIdentity
			}, completion: nil)
		}
	}

	func disappear(animated: Bool, done: (() -> ())) {
		if animated {
			UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
				self.alpha = 0
				self.transform = CGAffineTransformMakeScale(1.3, 1.3)
				}, completion: { (_) -> Void in
					done()
			})
		}
	}
}
