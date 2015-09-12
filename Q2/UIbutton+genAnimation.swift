//
//  UIbutton+genAnimation.swift
//  Questions
//
//  Created by 文川术 on 15/9/4.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

extension UIButton {
	func genAnimation(catalog: Animation, delay: Double) {

		switch catalog {

		case .appear:
			self.alpha = 0.0
			self.frame.origin.y += 20
			UIView.animateWithDuration(0.6, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
				self.alpha = 1.0
				self.frame.origin.y -= 20
			}, completion: nil)

		case .disappear:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(0.5, 0.5)
				self.alpha = 0.1
				}, completion: { (_) -> Void in
					self.hidden = true
					self.transform = CGAffineTransformMakeScale(1.0, 1.0)
					self.alpha = 1.0
			})
		case .touched:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.5, 1.5)
				self.alpha = 0.1
				}, completion: { (what) -> Void in
					self.hidden = true
					self.transform = CGAffineTransformMakeScale(1.0, 1.0)
					self.alpha = 1.0
			})

		case .movingAround:

			UIView.animateKeyframesWithDuration(9.0, delay: delay, options: .Repeat, animations: { () -> Void in

				UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.3, animations: { () -> Void in
					self.transform = CGAffineTransformMakeTranslation(0.0, 100.0)
					self.alpha = 0.0
				})

				UIView.addKeyframeWithRelativeStartTime(0.3, relativeDuration: 0.3, animations: { () -> Void in
					self.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
				})

				UIView.addKeyframeWithRelativeStartTime(0.6, relativeDuration: 0.3, animations: { () -> Void in
					// self.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
					self.alpha = 1.0
				})

			}, completion: nil)

			// CGAffineTransformMakeTranslation()永远是相对于最初的点。


		default:
			println("hey")
		}
	}
}