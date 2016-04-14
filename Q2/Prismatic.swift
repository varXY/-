//
//  Prismatic.swift
//  电工助手
//
//  Created by 文川术 on 4/14/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

struct Primatic {

	var backgroundViews = [UIView]()

	var buttonPoints = [CGPoint]()

	var buttons = [UIButton]()

	init(VC: HomepageViewController) {

		getPrismaticButtons()
		getbackgroundViews()

		backgroundViews.forEach({ VC.view.addSubview($0) })
		buttons.forEach({ VC.view.addSubview($0) })

	}


	// MARK: - Button

	mutating func getPrismaticButtons() {

		// 方块之间之前垂直距离为10，gap_0 = sqrt(50)  gap_1 = sqrt(200)

		let gaps = [
			CGFloat(sqrt(0.5)),
			sqrt(2)
		]

		let allGapLength = gaps[0] * 2 + gaps[1] * 3
		let diagonalLength = (ScreenHeight - 20 - allGapLength - 20) / 4
		let sideLength = diagonalLength / sqrt(2)
		let centerDistance = diagonalLength / 2

		let xPositions = [
			ScreenCenter.x - gaps[0] - centerDistance,
			ScreenCenter.x,
			ScreenCenter.x + gaps[0] + centerDistance
		]

		buttonPoints = getNinePoints(xPositions, gaps: gaps, centerDistance: centerDistance)
		let squareSize = CGSize(width: sideLength, height: sideLength)

		let titles = ["答题\n记录", "初级", "中级", "欧姆\n定律", "功率", "电量", "电阻", "单位\n公式", "图标\n符号", "工具\n设备"]

		for i in 0..<buttonPoints.count {
			let button = prismaticButton(titles[i], center: buttonPoints[i], size: squareSize)
			button.tag = 100 + i
			buttons.append(button)
		}
		
	}

	func getNinePoints(xPositions: [CGFloat], gaps: [CGFloat], centerDistance: CGFloat) -> [CGPoint] {
		let point_0 = CGPoint(x: xPositions[1], y: 20 + gaps[0] + centerDistance)
		let point_1 = CGPoint(x: xPositions[0], y: point_0.y + gaps[0] + centerDistance)
		let point_2 = CGPoint(x: xPositions[2], y: point_0.y + gaps[0] + centerDistance)

		let point_3 = CGPoint(x: xPositions[1], y: point_0.y + gaps[1] + centerDistance * 2)
		let point_4 = CGPoint(x: xPositions[0], y: point_3.y + gaps[0] + centerDistance)
		let point_5 = CGPoint(x: xPositions[2], y: point_3.y + gaps[0] + centerDistance)
		let point_6 = CGPoint(x: xPositions[1], y: point_5.y + gaps[0] + centerDistance)

		let point_9 = CGPoint(x: xPositions[1], y: point_6.y + gaps[1] + centerDistance * 2)
		let point_7 = CGPoint(x: xPositions[0], y: point_9.y - gaps[0] - centerDistance)
		let point_8 = CGPoint(x: xPositions[2], y: point_9.y - gaps[0] - centerDistance)

		let points = [point_0, point_1, point_2, point_3, point_4, point_5, point_6, point_7, point_8, point_9]
		return points
	}

	func prismaticButton(title: String, center: CGPoint, size: CGSize) -> UIButton {
		let button = UIButton(type: .System)
		button.backgroundColor = UIColor.whiteColor()
		button.frame.size = size
		button.center = center
		button.exclusiveTouch = true
		button.transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))

		let titleLabel = UILabel(frame: CGRectMake(0, 0, size.width, size.height))
		titleLabel.transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
		button.addSubview(titleLabel)
		print(size.width)

		titleLabel.font = UIFont.systemFontOfSize(18)
		if ScreenHeight == 480 {
			titleLabel.font = UIFont.systemFontOfSize(13)
		}
		titleLabel.text = title
		titleLabel.numberOfLines = 0
		titleLabel.textColor = UIColor.blackColor()
		titleLabel.textAlignment = .Center


		//		titleLabel.transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
		//		print(titleLabel.center)
		//		titleLabel.sizeToFit()
		//		let xy = sqrt((size.width * size.width) / 2)
		//		titleLabel.center = CGPoint(x: xy, y: xy)
		
		return button
	}

	// MARK: - Backgound View

	mutating func getbackgroundViews() {
		let gaps = [
			CGFloat(sqrt(0.5)),
			sqrt(2)
		]

		let allGapLength = gaps[0] * 2 + gaps[1] * 3
		let diagonalLength = (ScreenHeight - 20 - allGapLength - 20) / 4
		let sideLength = diagonalLength / sqrt(2)
		let centerDistance = diagonalLength / 2

		let xPositions = [
			ScreenCenter.x - (gaps[0] + centerDistance) * 3,
			ScreenCenter.x - (gaps[0] + centerDistance) * 2,
			ScreenCenter.x - gaps[0] - centerDistance,
			ScreenCenter.x,
			ScreenCenter.x + gaps[0] + centerDistance,
			ScreenCenter.x + (gaps[0] + centerDistance) * 2,
			ScreenCenter.x + (gaps[0] + centerDistance) * 3
		]

		var i = 0
		repeat {
			var points = verticalSixPoints(xPositions[i])
			if i % 2 == 0 {
				for k in 0..<points.count {
					points[k].y += gaps[0] + centerDistance
				}

			}
			var j = 0
			repeat {
				if !buttonPoints.contains(points[j]) {
					let view = UIView()
					view.frame.size = CGSize(width: sideLength, height: sideLength)
					view.center = points[j]
					view.backgroundColor = UIColor.themeRed()
					view.transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
					backgroundViews.append(view)
				}
				j += 1
			} while j < points.count

			i += 1
		} while i < xPositions.count
	}

	func verticalSixPoints(xPositon: CGFloat) -> [CGPoint] {
		var sixPoints = [CGPoint]()
		let gaps = [
			CGFloat(sqrt(0.5)),
			sqrt(2)
		]

		let allGapLength = gaps[0] * 2 + gaps[1] * 3
		let diagonalLength = (ScreenHeight - 20 - allGapLength - 20) / 4

		let topPoint = CGPoint(x: xPositon, y: ScreenCenter.y - (diagonalLength + gaps[1]) * 2.5)
		sixPoints.append(topPoint)

		var i: CGFloat = 1
		repeat {
			let point = CGPoint(x: xPositon, y: topPoint.y + (diagonalLength + gaps[1]) * i)
			sixPoints.append(point)

			i += 1
		} while i < 6

		return sixPoints
	}

	func randomRedColor() -> UIColor {
		let alpha: CGFloat = CGFloat(random() % 10) * 0.1
		print(alpha)
		let color = UIColor(red: 254/255, green: 51/255, blue: 42/255, alpha: alpha)
		return color
	}





}