//
//  UIbutton+genAnimation.swift
//  Questions
//
//  Created by 文川术 on 15/9/4.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	
	func genAnimationForUIView(animationType: AnimationType, delay: Double) {

		switch animationType {

		case .IsRightAnswer:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.2, 1.2)
				}, completion: nil)
		default:
			break

		}
	}
}