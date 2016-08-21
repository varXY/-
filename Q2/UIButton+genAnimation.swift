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

	func genAnimation(_ animationType: AnimationType, delayTime: Double, distance: CGFloat) {

		switch animationType {
		case .appear:
			alpha = 0.0
			frame.origin.y += distance

			UIView.animate(withDuration: 0.5, delay: delayTime, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.frame.origin.y -= distance
				}, completion: nil)

		case .biggerAndAppear:
			alpha = 0.0
			frame.origin.y += distance
			transform = self.transform.scaledBy(x: 0.8, y: 0.8)

			UIView.perform(.delete, on: [], options: [], animations: {
				self.alpha = 1.0
				self.frame.origin.y -= distance
				self.transform = self.transform.scaledBy(x: 1.0 / 0.8, y: 1.0 / 0.8)
				}, completion: nil)


		case .disappear:
			UIView.animate(withDuration: 0.4, animations: { () -> Void in
				self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
				self.alpha = 0.0
				}, completion: { (_) -> Void in
					self.isHidden = true
					self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
					self.alpha = 1.0
			})

		case .touched:
			UIView.animate(withDuration: 0.4, animations: {
				self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
				self.alpha = 0.0
				}, completion: { (what) -> Void in
					self.isHidden = true
					self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
					self.alpha = 1.0
			})

		case .isRightAnswer:
			UIView.animate(withDuration: 0.4, delay: delayTime, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
				self.transform = CGAffineTransform(scaleX: 1.06, y: 1.06)
				}, completion: nil)

		case .bigger:
			let oldAlpha = self.alpha
			alpha = 0.0
			transform = self.transform.scaledBy(x: 0.1, y: 0.1)

			UIView.animate(withDuration: 0.5, delay: delayTime, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
				self.alpha = oldAlpha
				self.transform = self.transform.scaledBy(x: 1.0 / 0.1, y: 1.0 / 0.1)
				}, completion: nil)

		default:
			break
		}
	}
	
}
