
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

	func genButtonsForInfo() -> [UIButton] {
		let buttonSize = global.buttonSize()
//		let marginY = global.margin()
		var buttons = [UIButton]()

//		let buttonX = (global.size.width - buttonSize.width) / 2

//		let marginY_1 = marginY - 2
//		let marginY_2 = marginY * 2 + buttonSize.height - 2
//		let marginY_3 = marginY * 3 + buttonSize.height * 2

		let distance = global.size.width / 2
		print(distance)

		let center_0 = CGPoint(x: distance, y: global.size.height / 2  - distance / 2 - 64)
		let center_1 = CGPoint(x: distance / 2, y: global.size.height / 2 + distance / 2 - 64)
		let center_2 = CGPoint(x: (distance / 2) * 3, y: global.size.height / 2 + distance / 2 - 64)

		var button = genButtonWithCenter("单位公式", center: center_0, size: buttonSize)
		button?.tag = 93456
		buttons.append(button!)

		button = genButtonWithCenter("图标符号", center: center_1, size: buttonSize)
		button?.tag = 93457
		buttons.append(button!)

		button = genButtonWithCenter("工具设备", center: center_2, size: buttonSize)
		button?.tag = 93458
		buttons.append(button!)

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

		genShadowForButton(button)

		button.titleLabel?.font = UIFont.systemFontOfSize(20)
		button.backgroundColor = UIColor.whiteColor()
		button.tag = tag

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
//		label.alpha = 0.8
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

		let buttonWidth = global.testSmallButtonSize().width
		let buttonHeight = global.testSmallButtonSize().height

		var button = genButton("查看题目", frame: CGRect(x: global.size.width / 4 - (buttonWidth + 50) / 2, y: global.size.width - buttonHeight / 2 - 10, width: buttonWidth + 50, height: buttonHeight + 50))
		button!.tag = 12345
		view.addSubview(button!)

		button = genButton("退出", frame: CGRect(x: global.size.width * 3 / 4 - buttonWidth / 2, y: global.size.width - 10, width: buttonWidth, height: buttonHeight))
		button!.tag = 123456
		view.addSubview(button!)
		
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

		genShadowForButton(button)

		button.backgroundColor = UIColor.whiteColor()
		button.tag = tag

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

		genShadowForButton(button)

		return button
	}

	func genButtonWithCenter(title: String, center: CGPoint, size: CGSize) -> UIButton? {
		let button = UIButton(type: .System)
		button.frame.size = size
		button.center = center
		print(center)
		button.tintColor = UIColor.redColor()
		button.setTitle(title, forState: .Normal)
		button.titleLabel?.font = UIFont.systemFontOfSize(18)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = size.height / 2
		button.clipsToBounds = true

		genShadowForButton(button)

		return button
	}

	
	func genShadowForButton(button: UIButton) {
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 10
		button.layer.shadowOpacity = 0.5
		button.layer.shadowColor = UIColor.lightGrayColor().CGColor
		button.layer.shadowOffset = CGSizeMake(0, 0)
	}


}