
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

	var global = Global()



	// MARK: - Big Buttons

	func describeButtons(topPoint: CGPoint) -> [UIButton] {
		var Buttons = [UIButton]()

		let gap_0: CGFloat = 2
		let gap_1: CGFloat = 12.5

		let diagonalLength: CGFloat = 8
		let sideLength = diagonalLength / sqrt(2)
		let centerDistance = diagonalLength / 2


		let x_0 = topPoint.x - gap_0 - centerDistance
		let x_1 = topPoint.x
		let x_2 = topPoint.x + gap_0 + centerDistance

		let point_0 = CGPoint(x: x_1, y: topPoint.y)
		let point_1 = CGPoint(x: x_0, y: point_0.y + gap_0 + centerDistance)
		let point_2 = CGPoint(x: x_2, y: point_0.y + gap_0 + centerDistance)

		let point_3 = CGPoint(x: x_1, y: point_0.y + gap_1 + centerDistance * 2)
		let point_4 = CGPoint(x: x_0, y: point_3.y + gap_0 + centerDistance)
		let point_5 = CGPoint(x: x_2, y: point_3.y + gap_0 + centerDistance)
		let point_6 = CGPoint(x: x_1, y: point_5.y + gap_0 + centerDistance)

		let point_9 = CGPoint(x: x_1, y: point_6.y + gap_1 + centerDistance * 2)
		let point_7 = CGPoint(x: x_0, y: point_9.y - gap_0 - centerDistance)
		let point_8 = CGPoint(x: x_2, y: point_9.y - gap_0 - centerDistance)

		let points = [point_0, point_1, point_2, point_3, point_4, point_5, point_6, point_7, point_8, point_9]
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

		let gap_0: CGFloat = sqrt(50)
//		let gap_1: CGFloat = sqrt(325)
		let gap_1: CGFloat = sqrt(200)

		let allGapLength = gap_0 * 2 + gap_1 * 2 + sqrt(200)
		let diagonalLength = (global.size.height - 20 - allGapLength - 20) / 4
		let sideLength = diagonalLength / sqrt(2)
		let centerDistance = diagonalLength / 2


		let x_0 = global.center.x - gap_0 - centerDistance
		let x_1 = global.center.x
		let x_2 = global.center.x + gap_0 + centerDistance

		let point_0 = CGPoint(x: x_1, y: 20 + gap_0 + centerDistance)
		let point_1 = CGPoint(x: x_0, y: point_0.y + gap_0 + centerDistance)
		let point_2 = CGPoint(x: x_2, y: point_0.y + gap_0 + centerDistance)

		let point_3 = CGPoint(x: x_1, y: point_0.y + gap_1 + centerDistance * 2)
		let point_4 = CGPoint(x: x_0, y: point_3.y + gap_0 + centerDistance)
		let point_5 = CGPoint(x: x_2, y: point_3.y + gap_0 + centerDistance)
		let point_6 = CGPoint(x: x_1, y: point_5.y + gap_0 + centerDistance)
        
		let point_9 = CGPoint(x: x_1, y: point_6.y + gap_1 + centerDistance * 2)
		let point_7 = CGPoint(x: x_0, y: point_9.y - gap_0 - centerDistance)
		let point_8 = CGPoint(x: x_2, y: point_9.y - gap_0 - centerDistance)

//		let buttonsCenter = CGPoint(x: x_1, y: point_3.y + centerDistance + sqrt(200) / 2)
//		let boxLength = sideLength * 2 + 10 + 15
//		let boxSize = CGSize(width: boxLength - 2.0, height: boxLength - 2.0)
//		let backgroundBox = UIButton()
//		backgroundBox.frame.size = boxSize
//		backgroundBox.center = buttonsCenter
//		backgroundBox.backgroundColor = UIColor.clearColor()
//		backgroundBox.layer.borderWidth = 1.0
//		backgroundBox.layer.borderColor = Global.lightRedColor().CGColor
//        backgroundBox.userInteractionEnabled = false
//		buttons.append(backgroundBox)

		let points = [point_0, point_1, point_2, point_3, point_4, point_5, point_6, point_7, point_8, point_9]
		let squareSize = CGSize(width: sideLength, height: sideLength)

		let titles = ["答题记录", "初级", "中级", "欧姆定律", "功率", "电量", "马力", "单位公式", "图标符号", "工具设备"]

		for i in 0..<points.count {
			let button = prismaticButton(titles[i], center: points[i], size: squareSize)
			button.tag = 100 + i
			buttons.append(button)
		}
        
		return buttons
	}

	func genButtonsForInfo() -> [UIButton] {
		let buttonSize = global.buttonSize()
//		let marginY = global.margin()
		var buttons = [UIButton]()

//		let buttonX = (global.size.width - buttonSize.width) / 2

//		let marginY_1 = marginY - 2
//		let marginY_2 = marginY * 2 + buttonSize.height - 2
//		let marginY_3 = marginY * 3 + buttonSize.height * 2

		let distance = global.size.width / 2
        
        let center_0 = CGPoint(x: distance / 2, y: global.size.height / 2  - distance / 2 - 64)
        let center_1 = CGPoint(x: (distance / 2) * 3, y: global.size.height / 2  - distance / 2 - 64)
		let center_2 = CGPoint(x: distance, y: global.size.height / 2 + distance / 2 - 64)

		var button = prismaticButton("单位公式", center: center_0, size: buttonSize)
		button.tag = 93456
		buttons.append(button)

		button = prismaticButton("图标符号", center: center_1, size: buttonSize)
		button.tag = 93457
		buttons.append(button)

		button = prismaticButton("工具设备", center: center_2, size: buttonSize)
		button.tag = 93458
		buttons.append(button)

		return buttons
	}


	func genButtonsForTest() -> [UIButton] {
		var buttons = [UIButton]()
		let buttonSize = global.buttonSize()

		let x = (global.size.width - buttonSize.width) / 2

		let centerY = (global.size.height - 64 - 49) / 2
		let Y_1 = centerY - buttonSize.height - 70
		let Y_2 = centerY + 70
//		let StartbuttonWidth: CGFloat = global.testBigButtonSize().width
//		let StartbuttonHeight:CGFloat = global.testBigButtonSize().height
//		let smallbuttonWidth: CGFloat = global.testSmallButtonSize().width
//		let smallbuttonHeight:CGFloat = global.testSmallButtonSize().height

//		var button = genButton("开始答题", frame: CGRect(x: (global.size.width - StartbuttonWidth) / 2, y: (global.size.height - StartbuttonHeight) / 2 - 49 , width: StartbuttonWidth, height: StartbuttonHeight))
//		button?.titleLabel?.font = UIFont.systemFontOfSize(24)
//		button?.tag = 33893
//		buttons.append(button!)

		var button = genButton("初级", frame: CGRectMake(x, Y_1, buttonSize.width, buttonSize.height))
		button?.tag = 33890
		buttons.append(button!)

		button = genButton("中级", frame: CGRectMake(x, Y_2, buttonSize.width, buttonSize.height))
		button?.tag = 33891
		buttons.append(button!)

//		button = genButton("纪录", frame: CGRect(x: (global.size.width - smallbuttonWidth) / 2, y: global.size.height - 70 - smallbuttonHeight - 64, width: smallbuttonWidth, height: smallbuttonHeight))
//		button?.tag = 33892
//		buttons.append(button!)

		return buttons
	}


	func genButtonsForScale() -> [UIButton] {
		let buttonSize = global.buttonSize()
//		let marginY = global.margin()
		var buttons = [UIButton]()

//		let buttonX0 = (global.size.width - buttonSize.width) / 2
//		let buttonX1 = global.size.width / 4 - buttonSize.width / 2
//		let buttonX2 = global.size.width * 3 / 4 - buttonSize.width / 2
//
//		let marginY_1 = marginY - 3
//		let marginY_2 = marginY * 2 + buttonSize.height - 3
//		let marginY_3 = marginY * 3 + buttonSize.height * 2

		let distance = global.size.width / 2

		let center_0 = CGPoint(x: distance / 2, y: global.size.height / 2  - distance / 2 - 64)
		let center_1 = CGPoint(x: (distance / 2) * 3, y: global.size.height / 2  - distance / 2 - 64)
		let center_2 = CGPoint(x: distance / 2, y: global.size.height / 2 + distance / 2 - 64)
		let center_3 = CGPoint(x: (distance / 2) * 3, y: global.size.height / 2 + distance / 2 - 64)


		var button = genButtonWithCenter("欧姆定律", center: center_0, size: buttonSize)
		buttons.append(button!)

		button = genButtonWithCenter("功率", center: center_1, size: buttonSize)
		buttons.append(button!)

		button = genButtonWithCenter("电量", center: center_3, size: buttonSize)
		buttons.append(button!)

		button = genButtonWithCenter("马力", center: center_2, size: buttonSize)
		buttons.append(button!)

		return buttons
	}



	// MARK: - For Test

	func genLabelForTest() -> UILabel {
		let label = UILabel()
		label.text = "选择级别开始问答"
		label.textAlignment = .Center
		label.font = UIFont.boldSystemFontOfSize(22)
		label.textColor = UIColor.grayColor()
		label.sizeToFit()

		label.frame.origin = CGPointMake((global.size.width - label.frame.width) / 2, global.buttonSize().height / 4 + 64)

		return label
	}


	func genDots() -> UIView {
		var frame = CGRect()

		switch global.size.height {

		case 480:
			frame = CGRect(x: (global.size.width - 135) / 2, y: global.size.height - 15 - 64, width: 135, height: 15)
		default:
			frame = CGRect(x: (global.size.width - 135) / 2, y: global.size.height - 30 - 64, width: 135, height: 20)
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
		label.frame = CGRect(x: 15 + global.size.width * CGFloat(page), y: global.size.height / 5.5 - 64, width: global.size.width - 30, height: 200)
		label.numberOfLines = 0
		label.backgroundColor = Global.backgroundColor()
		label.font = UIFont.systemFontOfSize(23)
		label.text = questions[page].question
		label.sizeToFit()
		superView.addSubview(label)

		var point = CGPoint(x: 20 + global.size.width * CGFloat(page), y: global.size.height * 0.65 - 64)
		var tag = page * 2 + 1000
		let button1 = genChoiceButton(point, tag: tag)
		superView.addSubview(button1)

		point = CGPoint(x: 20 + global.size.width * CGFloat(page), y: global.size.height * 0.65 + 90 - 64)
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
		button.frame.size = CGSize(width: global.size.width - 40, height: 60)
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
		let view = UIView(frame: CGRect(x: global.center.x - 50 + global.size.width * CGFloat(page), y: global.center.y - 50 - 64 - 30, width: 100, height: 100))
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
		let x = global.size.width * CGFloat(page) + global.center.x - buttonWidth / 2
		let y = global.center.y - buttonWidth / 2 - 64 - 30

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
		view.frame = CGRect(x: 0, y: 0, width: global.size.width, height: global.size.height)

		let label = UILabel()
		label.frame = CGRect(x: 10, y: 10, width: global.size.width - 20, height: global.size.width - 20)

		label.numberOfLines = 0
		label.textAlignment = .Center
		label.textColor = UIColor.whiteColor()
		label.font = UIFont.boldSystemFontOfSize(22)
		label.backgroundColor = Global.lightRedColor()
		label.layer.cornerRadius = (global.size.width - 20) / 2
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
			label.textColor = Global.redColor()
		}
		button_0.layer.cornerRadius = 10
		button_0.alpha = 0.7
		button_0.tag = 12345
		addShadowForButton(button_0)
		view.addSubview(button_0)


		let center_1 = CGPoint(x: view.frame.width / 2, y: view.frame.size.height * 0.65 + 90 - 64)
		let button_1 = prismaticButton("退出", center: center_1, size: buttonSize)
		button_1.backgroundColor = UIColor.whiteColor()
		if let label = button_1.subviews[0] as? UILabel {
			label.textColor = Global.redColor()
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
		QLabel.frame = CGRect(x: 35, y: 10, width: global.size.width - 45, height: 150)
		QLabel.numberOfLines = 0
		QLabel.lineBreakMode = .ByClipping
		QLabel.text = question.question
		QLabel.sizeToFit()

		return QLabel
	}


	func genShareButton(point: CGPoint, tag: Int) -> UIButton {
		let button = UIButton(type: .System)
		button.frame.origin = point
		button.frame.size = CGSize(width: global.size.width - 40, height: 120)
		button.tintColor = UIColor.grayColor()
		button.layer.cornerRadius = 10
		button.clipsToBounds = true

		let label = UILabel(frame: CGRect(x: 0, y: 0, width: button.frame.size.width, height: button.frame.size.height / 2))
		label.text = "分享"
		label.font = UIFont.systemFontOfSize(20)
		label.textColor = Global.redColor()
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
        titleLabel.center = CGPoint(x: button.frame.width / 2, y: button.frame.height / 2)
        titleLabel.font = UIFont.systemFontOfSize(18)
		if global.size.height == 480 {
			titleLabel.font = UIFont.systemFontOfSize(13)
		}
        titleLabel.text = title
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Center
        
        button.addSubview(titleLabel)
        
        button.exclusiveTouch = true
        
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