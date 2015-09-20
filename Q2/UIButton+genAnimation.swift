//
//  UIButton+genAnimation.swift
//  Q2
//
//  Created by 文川术 on 15/9/19.
//  Copyright © 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

	func genAnimation(animationType: AnimationType, delay: Double, distance: CGFloat) {

		switch animationType {

		case .Appear:
			self.alpha = 0.0
			self.frame.origin.y += distance

			UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.frame.origin.y -= distance
				}, completion: nil)

		case .Disappear:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(0.5, 0.5)
				self.alpha = 0.0
				}, completion: { (_) -> Void in
					self.hidden = true
					self.transform = CGAffineTransformMakeScale(1.0, 1.0)
					self.alpha = 1.0
			})

		case .Touched:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.5, 1.5)
				self.alpha = 0.0
				}, completion: { (what) -> Void in
					self.hidden = true
					self.transform = CGAffineTransformMakeScale(1.0, 1.0)
					self.alpha = 1.0
			})

		case .MovingAround:
			UIView.animateKeyframesWithDuration(12.0, delay: delay, options: .Repeat, animations: { () -> Void in

				UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.3, animations: { () -> Void in
					self.transform = CGAffineTransformMakeTranslation(0.0, 200.0)
					self.alpha = 0.0
					})

				UIView.addKeyframeWithRelativeStartTime(0.3, relativeDuration: 0.3, animations: { () -> Void in
					self.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
					})

				UIView.addKeyframeWithRelativeStartTime(0.6, relativeDuration: 0.3, animations: { () -> Void in
					self.alpha = 1.0
					})

				}, completion: nil)

		case .IsRightAnswer:
			UIView.animateWithDuration(0.4, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.06, 1.06)
				}, completion: nil)

		case .FromZeroToFull:
			self.transform = CGAffineTransformMakeScale(0.0, 0.0)

			UIView.animateWithDuration(0.8, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.0, 1.0)
				}, completion: nil)

		default:
			break
		}
	}
}