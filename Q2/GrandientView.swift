//
//  GrandientView.swift
//  StoreSearch
//
//  Created by 文川术 on 15/8/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

class GradientView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clearColor()
		autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		backgroundColor = UIColor.clearColor()
		autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
	}

	override func drawRect(rect: CGRect) {
		let components: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0.3]
		let locations: [CGFloat] = [0, 1]

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2)

		let x = CGRectGetMidX(bounds)
		let y: CGFloat = 10
		let point = CGPoint(x: x, y: y)
		let radius = bounds.height

		let context = UIGraphicsGetCurrentContext()
		CGContextDrawRadialGradient(context, gradient, point, 0, point, radius, CGGradientDrawingOptions.DrawsAfterEndLocation)
	}
}
