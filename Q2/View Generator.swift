
//
//  Attributes.swift
//  Questions
//
//  Created by 文川术 on 15/9/3.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit
import Foundation

class Generator {


	// MARK: - Big Buttons

	func describeButtons(topPoint: CGPoint) -> [UIButton] {
		var Buttons = [UIButton]()


		let gaps: [CGFloat] = [2, 12.5]

		let diagonalLength: CGFloat = 8
		let sideLength = diagonalLength / sqrt(2)
		let centerDistance = diagonalLength / 2

		let xPositions = [
			topPoint.x - gaps[0] - centerDistance,
			topPoint.x,
			topPoint.x + gaps[0] + centerDistance
		]

		let points = getNinePoints(xPositions, gaps: gaps, centerDistance: centerDistance)
		let squareSize = CGSize(width: sideLength, height: sideLength)

		for i in 0..<points.count {
			let button = prismaticButton("", center: points[i], size: squareSize)
			button.enabled = false
			Buttons.append(button)
		}

		return Buttons
	}

	func allMainButtons() -> [UIButton] {
		var buttons = [UIButton]()

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

		let points = getNinePoints(xPositions, gaps: gaps, centerDistance: centerDistance)
		let squareSize = CGSize(width: sideLength, height: sideLength)

		let titles = ["答题\n记录", "初级", "中级", "欧姆\n定律", "功率", "电量", "电阻", "单位\n公式", "图标\n符号", "工具\n设备"]

		for i in 0..<points.count {
			let button = prismaticButton(titles[i], center: points[i], size: squareSize)
			button.tag = 100 + i
			buttons.append(button)
		}
        
		return buttons
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


	// MARK: - For Test

	func genDots() -> UIView {
		var frame = CGRect()

		switch ScreenHeight {

		case 480:
			frame = CGRect(x: (ScreenWidth - 135) / 2, y: ScreenHeight - 15 - 64, width: 135, height: 15)
		default:
			frame = CGRect(x: (ScreenWidth - 135) / 2, y: ScreenHeight - 30 - 64, width: 135, height: 20)
		}

		let view = UIView(frame: frame)
		view.backgroundColor = UIColor.clearColor()

		for i in 0..<10 {
			let littleView = UIView(frame: CGRect(x: 5 + 13 * i, y: 5, width: 8, height: 8))
			littleView.layer.cornerRadius = 4
			littleView.clipsToBounds = true
			littleView.backgroundColor = UIColor.grayColor()
			littleView.tag = i + 500
			view.addSubview(littleView)
		}

		return view
	}

	func genQA(superView: UIView, page: Int, questions: [Question]) {

		let label = UILabel()
		label.frame = CGRect(x: 15 + ScreenWidth * CGFloat(page), y: ScreenHeight / 5.5 - 64, width: ScreenWidth - 30, height: 200)
		label.numberOfLines = 0
		label.backgroundColor = UIColor.backgroundColor()
		label.font = UIFont.systemFontOfSize(23)
		label.text = questions[page].question
		label.sizeToFit()
		superView.addSubview(label)

		var point = CGPoint(x: 20 + ScreenWidth * CGFloat(page), y: ScreenHeight * 0.65 - 64)
		var tag = page * 2 + 1000
		let button1 = genChoiceButton(point, tag: tag)
		superView.addSubview(button1)

		point = CGPoint(x: 20 + ScreenWidth * CGFloat(page), y: ScreenHeight * 0.65 + 90 - 64)
		tag = page * 2 + 1001
		let button2 = genChoiceButton(point, tag: tag)
		superView.addSubview(button2)

		let ramdom = arc4random_uniform(2)
		if ramdom == 0 {
			button1.setTitle(questions[page].rightAnswer, forState: .Normal)
			button2.setTitle(questions[page].wrongAnswer, forState: .Normal)
		} else {
			button1.setTitle(questions[page].wrongAnswer, forState: .Normal)
			button2.setTitle(questions[page].rightAnswer, forState: .Normal)
		}
	}

	func genChoiceButton(point: CGPoint, tag: Int) -> UIButton {
		let button = UIButton(type: .System)
		button.frame.origin = point
		button.frame.size = CGSize(width: ScreenWidth - 40, height: 60)
		button.tintColor = UIColor.grayColor()
		button.layer.cornerRadius = 10
		button.clipsToBounds = true

		addShadowForButton(button)

		button.titleLabel?.font = UIFont.systemFontOfSize(20)
		button.backgroundColor = UIColor.whiteColor()
		button.tag = tag
        
        button.exclusiveTouch = true

		return button
	}


	func genRightOrWrongViewForQA(rightOrWrong: String, page: Int) -> UIView {
		let view = UIView(frame: CGRect(x: ScreenCenter.x - 50 + ScreenWidth * CGFloat(page), y: ScreenCenter.y - 50 - 64 - 30, width: 100, height: 100))
		view.layer.cornerRadius = 50

		switch rightOrWrong {
		case "right":
			view.backgroundColor = UIColor(patternImage: UIImage(named: "正确")!)
		case "wrong":
			view.backgroundColor = UIColor(patternImage: UIImage(named: "错误")!)
		default:
			break
		}

		return view
		
	}


	func genJumpButtonForQA(superView: UIView, page: Int) {
		let buttonWidth: CGFloat = 100
		let buttonHeight:CGFloat = 100
		let x = ScreenWidth * CGFloat(page) + ScreenCenter.x - buttonWidth / 2
		let y = ScreenCenter.y - buttonWidth / 2 - 64 - 30

		let jumpButton = UIButton(type: .System)
		jumpButton.backgroundColor = UIColor.clearColor()
		jumpButton.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
		jumpButton.layer.cornerRadius = 50
		jumpButton.clipsToBounds = true
		jumpButton.tag = page + 2333
        jumpButton.exclusiveTouch = true
		superView.addSubview(jumpButton)
	}


	func showTestFinalPage(rightCount: Int) -> UIView {
		let view = UIView()
		view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)

		let label = UILabel()
		label.frame = CGRect(x: 10, y: 10, width: ScreenWidth - 20, height: ScreenWidth - 20)

		label.numberOfLines = 0
		label.textAlignment = .Center
		label.textColor = UIColor.whiteColor()
		label.font = UIFont.boldSystemFontOfSize(22)
		label.backgroundColor = UIColor.lightRedColor()
		label.layer.cornerRadius = (ScreenWidth - 20) / 2
		label.clipsToBounds = true

		if rightCount < 5 {
			label.text = "只答对了\(rightCount)题，再接再厉！"
		}

		if rightCount == 5 {
			label.text = "答对了\(rightCount)题，还行。"
		}

		if rightCount > 5 && rightCount < 10 {
			label.text = "答对了\(rightCount)题，很棒！"
		}

		if rightCount == 10 {
			label.text = "竟然全答对了！太棒了！"
		}

		view.addSubview(label)

		let buttonSize = CGSize(width: label.frame.width - 40, height: 60)

		let center_0 = CGPoint(x: view.frame.width / 2, y: view.frame.size.height * 0.65 - 64)
		let button_0 = prismaticButton("查看题目", center: center_0, size: buttonSize)
		button_0.backgroundColor = UIColor.whiteColor()
		if let label = button_0.subviews[0] as? UILabel {
			label.textColor = UIColor.themeRed()
		}
		button_0.layer.cornerRadius = 10
		button_0.alpha = 0.7
		button_0.tag = 12345
		addShadowForButton(button_0)
		view.addSubview(button_0)


		let center_1 = CGPoint(x: view.frame.width / 2, y: view.frame.size.height * 0.65 + 90 - 64)
		let button_1 = prismaticButton("返回主页", center: center_1, size: buttonSize)
		button_1.backgroundColor = UIColor.whiteColor()
		if let label = button_1.subviews[0] as? UILabel {
			label.textColor = UIColor.themeRed()
		}
		button_1.layer.cornerRadius = 10
		button_1.alpha = 0.7
		button_1.tag = 123456
		addShadowForButton(button_1)
		view.addSubview(button_1)

		return view
	}


	func genQLabelForAnsweredCell(question: Question) -> UILabel {
		let QLabel = UILabel()
		QLabel.frame = CGRect(x: 35, y: 10, width: ScreenWidth - 45, height: 150)
		QLabel.numberOfLines = 0
		QLabel.lineBreakMode = .ByClipping
		QLabel.text = question.question
		QLabel.sizeToFit()

		return QLabel
	}


	func genShareButton(point: CGPoint, tag: Int) -> UIButton {
		let button = UIButton(type: .System)
		button.frame.origin = point
		button.frame.size = CGSize(width: ScreenWidth - 40, height: 120)
		button.tintColor = UIColor.grayColor()
		button.layer.cornerRadius = 10
		button.clipsToBounds = true

		let label = UILabel(frame: CGRect(x: 0, y: 0, width: button.frame.size.width, height: button.frame.size.height / 2))
		label.text = "分享"
		label.font = UIFont.systemFontOfSize(20)
		label.textColor = UIColor.themeRed()
		label.textAlignment = .Center
		button.addSubview(label)

		addShadowForButton(button)

		button.backgroundColor = UIColor.whiteColor()
		button.tag = tag

        button.exclusiveTouch = true
        
		return button
	}



	//MARK: - Base

	func genButton(title: String, frame: CGRect) -> UIButton? {
		let button = UIButton(type: .System)
		button.frame = CGRect(x: round(frame.origin.x), y: round(frame.origin.y), width: round(frame.size.width), height: round(frame.size.height))
		button.tintColor = UIColor.redColor()
		button.setTitle(title, forState: .Normal)
		button.titleLabel?.font = UIFont.systemFontOfSize(18)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = frame.height / 2
		button.clipsToBounds = true
        
		addShadowForButton(button)
        
        button.exclusiveTouch = true

		return button
	}

	func genButtonWithCenter(title: String, center: CGPoint, size: CGSize) -> UIButton? {
		let button = UIButton(type: .System)
		button.frame.size = size
		button.center = center
		button.tintColor = UIColor.redColor()
		button.setTitle(title, forState: .Normal)
		button.titleLabel?.font = UIFont.systemFontOfSize(18)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = size.height / 2
		button.clipsToBounds = true

		addShadowForButton(button)
        
        button.exclusiveTouch = true

		return button
	}
    
    func prismaticButton(title: String, center: CGPoint, size: CGSize) -> UIButton {
        let button = UIButton(type: .System)
        button.frame.size = size
        button.center = center
        button.backgroundColor = UIColor.whiteColor()
//		button.layer.cornerRadius = size.width / 15
        button.clipsToBounds = true
        
        let titleLabel = UILabel()
        titleLabel.frame.size = CGSize(width: size.width, height: 40)
        titleLabel.font = UIFont.systemFontOfSize(18)
		if ScreenHeight == 480 {
			titleLabel.font = UIFont.systemFontOfSize(13)
		}
        titleLabel.text = title
		titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Center
		titleLabel.sizeToFit()
		titleLabel.center = CGPoint(x: button.frame.width / 2, y: button.frame.height / 2)

        button.addSubview(titleLabel)
        
        button.exclusiveTouch = true

		button.transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
		titleLabel.transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
        
        return button
    }

	
	func addShadowForButton(button: UIButton) {
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 10
		button.layer.shadowOpacity = 0.5
		button.layer.shadowColor = UIColor.lightGrayColor().CGColor
		button.layer.shadowOffset = CGSizeMake(0, 0)
	}


}