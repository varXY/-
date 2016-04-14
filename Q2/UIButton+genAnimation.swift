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

	func genAnimation(animationType: AnimationType, delayTime: Double, distance: CGFloat) {

		switch animationType {
		case .Appear:
			alpha = 0.0
			frame.origin.y += distance

			UIView.animateWithDuration(0.5, delay: delayTime, usingSpringWithDamping: 1.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.frame.origin.y -= distance
				}, completion: nil)

		case .BiggerAndAppear:
			alpha = 0.0
			frame.origin.y += distance
			transform = CGAffineTransformScale(self.transform, 0.8, 0.8)

			UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: {
				self.alpha = 1.0
				self.frame.origin.y -= distance
				self.transform = CGAffineTransformScale(self.transform, 1.0 / 0.8, 1.0 / 0.8)
				}, completion: nil)


		case .Disappear:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(0.7, 0.7)
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

		case .IsRightAnswer:
			UIView.animateWithDuration(0.4, delay: delayTime, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.06, 1.06)
				}, completion: nil)

		case .Bigger:
			alpha = 0.0
			transform = CGAffineTransformScale(self.transform, 0.1, 0.1)

//			UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: { 
//				self.alpha = 1.0
//				self.transform = CGAffineTransformScale(self.transform, 1.0 / 0.1, 1.0 / 0.1)
//				}, completion: nil)

			UIView.animateWithDuration(0.5, delay: delayTime, usingSpringWithDamping: 1.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.transform = CGAffineTransformScale(self.transform, 1.0 / 0.1, 1.0 / 0.1)
				}, completion: nil)

		default:
			break
		}

	}

	
}