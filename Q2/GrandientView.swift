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
		self.backgroundColor = UIColor.clear
		autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		backgroundColor = UIColor.clear
		autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}

	override func draw(_ rect: CGRect) {
		let components: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0.3]
		let locations: [CGFloat] = [0, 1]

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: 2)

		let x = bounds.midX
		let y: CGFloat = 10
		let point = CGPoint(x: x, y: y)
		let radius = bounds.height

		let context = UIGraphicsGetCurrentContext()
		context?.drawRadialGradient(gradient!, startCenter: point, startRadius: 0, endCenter: point, endRadius: radius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
	}
}
