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

	var buttons = [UIButton]()
	var backgroundViews = [UIView]()
	var discribeViews = [UIView]()

	struct Size {
		static let gaps = [CGFloat(sqrt(0.5)), sqrt(2)]
		static let allGapLength = gaps[0] * 2 + gaps[1] * 3
		static let topGap = ScreenHeight == 480 ? 20 : round(ScreenHeight * 0.071)
		static let diagonalLength = (ScreenHeight - topGap - allGapLength - topGap) / 4
		static let sideLength = diagonalLength / sqrt(2)
		static let centerDistance = diagonalLength / 2
	}

	init(VC: HomepageViewController) {
		let buttonPoints = getPrismaticButtons()
		getbackgroundViews(buttonPoints)
		getDescribeViews(CGPoint(x: 20, y: ScreenHeight - 65))

		backgroundViews.forEach({ VC.view.addSubview($0) })
		buttons.forEach({ VC.view.addSubview($0) })
		discribeViews.forEach({ VC.view.addSubview($0) })
	}


	// MARK: - Button

	mutating func getPrismaticButtons() -> [CGPoint] {

		// 方块之间之前垂直距离为10，gap_0 = sqrt(50)  gap_1 = sqrt(200)

		let xPositions = [
			ScreenCenter.x - Size.gaps[0] - Size.centerDistance,
			ScreenCenter.x,
			ScreenCenter.x + Size.gaps[0] + Size.centerDistance
		]

		let buttonPoints = getNinePoints(xPositions, topY: Size.topGap, gaps: Size.gaps, centerDistance: Size.centerDistance)
		let squareSize = CGSize(width: Size.sideLength, height: Size.sideLength)

		let titles = ["高级\n试题", "初级", "中级", "欧姆\n定律", "功率", "电量", "电阻", "单位\n公式", "图标\n符号", "工具\n设备"]

		for i in 0..<buttonPoints.count {
			let button = prismaticButton(titles[i], center: buttonPoints[i], size: squareSize)
			button.tag = 100 + i
			buttons.append(button)
		}

		return buttonPoints
		
	}

	func getNinePoints(_ xPositions: [CGFloat], topY: CGFloat, gaps: [CGFloat], centerDistance: CGFloat) -> [CGPoint] {
		let point_0 = CGPoint(x: xPositions[1], y: topY + gaps[0] + centerDistance)
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

	func prismaticButton(_ title: String, center: CGPoint, size: CGSize) -> UIButton {
		let button = UIButton(type: .system)
		button.backgroundColor = UIColor.white
		button.frame.size = size
		button.center = center
		button.isExclusiveTouch = true
		button.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))

		let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
		titleLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-45 * M_PI / 180))
		button.addSubview(titleLabel)

		titleLabel.font = ScreenHeight == 480 ? UIFont.systemFont(ofSize: 13) : UIFont.systemFont(ofSize: 18)
		titleLabel.text = title
		titleLabel.numberOfLines = 0
		titleLabel.textColor = UIColor.black
		titleLabel.textAlignment = .center
		return button
	}

	// MARK: - Describe View

	mutating func getDescribeViews(_ topPoint: CGPoint)  {
		let gaps: [CGFloat] = [0, 11]
		let diagonalLength: CGFloat = 8
		let sideLength = diagonalLength / sqrt(2)
		let centerDistance = diagonalLength / 2
		let xPositions = [
			topPoint.x - gaps[0] - centerDistance,
			topPoint.x,
			topPoint.x + gaps[0] + centerDistance
		]

		let squareSize = CGSize(width: sideLength, height: sideLength)
		let points = getNinePoints(xPositions, topY: topPoint.y, gaps: gaps, centerDistance: centerDistance)
		points.forEach({
			let view = UIView()
			view.frame.size = squareSize
			view.backgroundColor = UIColor.white
			view.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
			view.center = $0
			discribeViews.append(view)
		})

		let topLabelPoint = CGPoint(x: topPoint.x + 35, y: topPoint.y + 8)
		let descriptions = ["考试题目", "计算工具", "常用知识"]
		descriptions.forEach({
			let label = UILabel()
			label.text = $0
			label.font = UIFont.systemFont(ofSize: 11)
			label.textColor = UIColor.white
			label.sizeToFit()
			label.center = CGPoint(x: topLabelPoint.x, y: topLabelPoint.y + 19.5 * CGFloat(descriptions.index(of: $0)!))
			discribeViews.append(label)
		})

	}

	// MARK: - Backgound View

	mutating func getbackgroundViews(_ buttonPoints: [CGPoint]) {
        
        let x0 = ScreenCenter.x - (Size.gaps[0] + Size.centerDistance) * 3
        let x1 = ScreenCenter.x - (Size.gaps[0] + Size.centerDistance) * 2
        let x2 = ScreenCenter.x - Size.gaps[0] - Size.centerDistance
        let x3 = ScreenCenter.x
        let x4 = ScreenCenter.x + Size.gaps[0] + Size.centerDistance
        let x5 = ScreenCenter.x + (Size.gaps[0] + Size.centerDistance) * 2
        let x6 = ScreenCenter.x + (Size.gaps[0] + Size.centerDistance) * 3
        
		let xPositions = [x0, x1,x2, x3, x4, x5, x6]

		var i = 0
		repeat {
			var points = verticalSixPoints(xPositions[i])
			if i % 2 == 0 {
				for k in 0..<points.count {
					points[k].y += Size.gaps[0] + Size.centerDistance
				}
			}

			var j = 0
			repeat {
				if !buttonPoints.contains(points[j]) {
					let view = UIView()
					view.frame.size = CGSize(width: Size.sideLength, height: Size.sideLength)
					view.center = points[j]
					view.backgroundColor = UIColor.themeRed()
					view.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
					backgroundViews.append(view)
				}
				j += 1
			} while j < points.count

			i += 1
		} while i < xPositions.count
	}

	func verticalSixPoints(_ xPositon: CGFloat) -> [CGPoint] {
		var sixPoints = [CGPoint]()

		let topPoint = CGPoint(x: xPositon, y: ScreenCenter.y - (Size.diagonalLength + Size.gaps[1]) * 2.5)
		sixPoints.append(topPoint)

		var i: CGFloat = 1
		repeat {
			let point = CGPoint(x: xPositon, y: topPoint.y + (Size.diagonalLength + Size.gaps[1]) * i)
			sixPoints.append(point)

			i += 1
		} while i < 6

		return sixPoints
	}

	func randomRedColor() -> UIColor {
		let alpha: CGFloat = CGFloat(arc4random() % 10) * 0.1
		let color = UIColor(red: 254/255, green: 51/255, blue: 42/255, alpha: alpha)
		return color
	}


}




