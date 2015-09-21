
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

	var button: UIButton?
	var littleButtons = [UIButton]()
	let buttonSize : CGFloat = 30.0

	var global = Global()

	func genRightOrWrongViewForQA(rightOrWrong: String, page: Int) -> UIView {
		let view = UIView(frame: CGRect(x: global.center.x - 50 + global.size.width * CGFloat(page), y: global.center.y - 50 - 64 - 30, width: 100, height: 100))
		view.layer.cornerRadius = 50
		
		switch rightOrWrong {
		case "right":
			view.backgroundColor = UIColor(patternImage: UIImage(named: "电流表")!)
		case "wrong":
			view.backgroundColor = UIColor(patternImage: UIImage(named: "电压表")!)
		default:
			break
		}

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



	func genJumpButtonForQA(superView: UIView, page: Int) {
		let buttonWidth: CGFloat = 100
		let buttonHeight:CGFloat = 100
		let x = global.size.width * CGFloat(page) + global.center.x - buttonWidth / 2
		let y = global.center.y - buttonWidth / 2 - 64 - 30

		let jumpButton = UIButton(type: .System)
		jumpButton.backgroundColor = UIColor.clearColor()
		// jumpButton.alpha = 0.0
		jumpButton.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
		jumpButton.layer.cornerRadius = 50
		jumpButton.clipsToBounds = true
		jumpButton.tag = page + 2333
		superView.addSubview(jumpButton)
	}

	func genQA(superView: UIView, page: Int, questions: [Question]) {
		let redColor = Global.redColor().CGColor

		let label = UILabel()
		label.frame = CGRect(x: 15 + global.size.width * CGFloat(page), y: global.size.height / 5.5 - 64, width: global.size.width - 30, height: 200)
		label.numberOfLines = 0
		label.backgroundColor = UIColor.whiteColor()
		label.font = UIFont.systemFontOfSize(23)
		label.text = questions[page].question
		label.sizeToFit()
		superView.addSubview(label)

		let button1 = UIButton(type: .System)
		button1.frame = CGRect(x: 20 + global.size.width * CGFloat(page), y: global.size.height * 0.65 - 64, width: global.size.width - 40, height: 60)
		button1.layer.cornerRadius = 10
		button1.layer.borderColor = redColor
		button1.layer.borderWidth = 1.0
		button1.titleLabel?.font = UIFont.systemFontOfSize(20)
		button1.tintColor = Global.redColor()
		button1.backgroundColor = UIColor.whiteColor()
		button1.setTitle(questions[page].rightAnswer, forState: .Normal)
		button1.tag = page * 2 + 1000
		superView.addSubview(button1)

		let button2 = UIButton(type: .System)
		button2.frame = CGRect(x: 20 + global.size.width * CGFloat(page), y: global.size.height * 0.65 + 90 - 64, width: global.size.width - 40, height: 60)
		button2.layer.cornerRadius = 10
		button2.tintColor = Global.redColor()
		button2.setTitle(questions[page].wrongAnswer, forState: .Normal)
		button2.layer.borderColor = redColor
		button2.layer.borderWidth = 1.0
		button2.backgroundColor = UIColor.whiteColor()
		button2.titleLabel?.font = UIFont.systemFontOfSize(20)
		button2.tag = page * 2 + 1001
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

	func genLabelForTest() -> UILabel {
		let label = UILabel()
		label.text = "精选电工考试题目"
		label.textAlignment = .Center
		label.font = UIFont.boldSystemFontOfSize(22)
		label.textColor = UIColor.whiteColor()
		label.sizeToFit()
		label.frame.origin = CGPoint(x: (global.size.width - label.frame.width) / 2, y: 104)

		return label
	}

	// MARK: - Big Buttons

	func genButtonsForInfo() -> [UIButton] {
		let buttonSize = global.buttonSize()
		let marginY = global.margin()
		var buttons = [UIButton]()

		let buttonX = (global.size.width - buttonSize.width) / 2

		let marginY_1 = marginY + 64
		let marginY_2 = marginY * 2 + buttonSize.height + 64
		let marginY_3 = marginY * 3 + buttonSize.height * 2 + 64

		var button = genButton("单位公式", frame: CGRect(x: buttonX, y: marginY_1, width: buttonSize.width, height: buttonSize.height))
		button?.tag = 93456
		buttons.append(button!)

		button = genButton("图标符号", frame: CGRect(x: buttonX, y: marginY_2, width: buttonSize.width, height: buttonSize.height))
		button?.tag = 93457
		buttons.append(button!)

		button = genButton("工具设备", frame: CGRect(x: buttonX, y: marginY_3, width: buttonSize.width, height: buttonSize.height))
		button?.tag = 93458
		buttons.append(button!)

		return buttons
	}

	func genButtonsForTest() -> [UIButton] {
		var buttons = [UIButton]()

		let StartbuttonWidth: CGFloat = global.testBigButtonSize().width
		let StartbuttonHeight:CGFloat = global.testBigButtonSize().height
		let smallbuttonWidth: CGFloat = global.testSmallButtonSize().width
		let smallbuttonHeight:CGFloat = global.testSmallButtonSize().height

		var button = genButton("开始", frame: CGRect(x: (global.size.width - StartbuttonWidth) / 2, y: (global.size.height - StartbuttonHeight) / 2 - 49 , width: StartbuttonWidth, height: StartbuttonHeight))
		button?.titleLabel?.font = UIFont.systemFontOfSize(22)
		button!.tag = 333
		buttons.append(button!)

		button = genButton("纪录", frame: CGRect(x: (global.size.width - smallbuttonWidth) / 2, y: global.size.height - 150, width: smallbuttonWidth, height: smallbuttonHeight))
		button!.tag = 334
		buttons.append(button!)

		return buttons
	}

	func genButtonsForScale() -> [UIButton] {
		let buttonSize = global.buttonSize()
		let marginY = global.margin()
		var buttons = [UIButton]()

		let buttonX0 = (global.size.width - buttonSize.width) / 2
		let buttonX1 = global.size.width / 4 - buttonSize.width / 2
		let buttonX2 = global.size.width * 3 / 4 - buttonSize.width / 2

		let marginY_1 = marginY + 64
		let marginY_2 = marginY * 2 + buttonSize.height + 64
		let marginY_3 = marginY * 3 + buttonSize.height * 2 + 64

		var button = genButton("欧姆定律", frame: CGRect(x: buttonX0, y: marginY_1, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)

		button = genButton("功率", frame: CGRect(x: buttonX1, y: marginY_2, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)

		button = genButton("电量", frame: CGRect(x: buttonX2, y: marginY_2, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)

		button = genButton("马力", frame: CGRect(x: buttonX0, y: marginY_3, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)

		return buttons
	}

	// MARK: - Little Buttons


	func genLitteButtons() -> [UIButton] {

		for _ in 0..<20 {
			let button = generateLittleButtons()
			littleButtons.append(button)
		}

		return littleButtons
	}



	func generateLittleButtons() -> UIButton {
		let frame = randomFrame()
		let color = UIColor.clearColor()
		let newbutton = addLittlebutton(frame, color: color)
		newbutton.setTitle(randomLetter(), forState: .Normal)
		// newbutton.titleLabel?.textColor = Global.lightGrayColor()
		newbutton.alpha = 1.0
		return newbutton
	}

	func addLittlebutton(location: CGRect, color: UIColor) -> UIButton {
		let newbutton = UIButton(frame: location)
		newbutton.backgroundColor = color
		return newbutton
	}

	func randomLetter() -> String {
		var letters = ["U","I", "P", "μ", "Ω", "ρ", "Hz", "φ", "var", "VA", "S", "f", "W", "kW", "R"]
		let random = Int(arc4random_uniform(15))
		return letters[random]
	}

	func randomFrame() -> CGRect {
		var guess = CGRectMake(64, 64, 30, 30)

		repeat {
			let maxX = UInt32(global.size.width - 30)
			let maxY = UInt32(global.size.height - 79)
			let guessX = CGFloat(arc4random_uniform(maxX))
			let guessY = CGFloat(arc4random_uniform(maxY))
			guess = CGRectMake(guessX, guessY, buttonSize, buttonSize)
		} while(!doesNotCollide(guess)) 

		return guess

	}

	func doesNotCollide(testRect: CGRect) -> Bool {
		for button in littleButtons {
			button.transform = CGAffineTransformMakeScale(1.5, 1.5)
			let viewRect = button.frame
			if(CGRectIntersectsRect(testRect, viewRect)) {
				return false
			}
			button.transform = CGAffineTransformMakeScale(1.0, 1.0)

		}
		return true
	}

	// MARK: -


	func genDots() -> UIView {
		let view = UIView(frame: CGRect(x: (global.size.width - 155) / 2, y: global.size.height - 30, width: 155, height: 20))
		view.backgroundColor = UIColor.clearColor()

		for i in 0..<10 {
			let littleView = UIView(frame: CGRect(x: 5 + 15 * i, y: 5, width: 10, height: 10))
			littleView.layer.cornerRadius = 5
			littleView.clipsToBounds = true
			littleView.backgroundColor = Global.grayColor()
			littleView.tag = i + 500
			view.addSubview(littleView)
		}

		return view
	}

	func showTestFinalPage(rightCount: Int) -> UIView {
		let view = UIView()
		view.frame = CGRect(x: 0, y: 0, width: global.size.width, height: global.size.height)

		let label = UILabel()
		label.frame = CGRect(x: 10, y: 74, width: global.size.width - 20, height: global.size.width - 20)
		label.layer.cornerRadius = (global.size.width - 20) / 2
		label.clipsToBounds = true
		label.numberOfLines = 0
		label.textAlignment = .Center
		label.textColor = UIColor.whiteColor()
		label.backgroundColor = Global.redColor()

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
			label.text = "竟然全答对了！屌爆了！"
		}

		view.addSubview(label)

		let buttonWidth = global.testSmallButtonSize().width
		let buttonHeight = global.testSmallButtonSize().height

		var button = genButton("查看题目", frame: CGRect(x: global.size.width / 4 - (buttonWidth + 50) / 2, y: global.size.width + 54 - buttonHeight / 2, width: buttonWidth + 50, height: buttonHeight + 50))
		button!.tag = 12345
		view.addSubview(button!)

		button = genButton("退出", frame: CGRect(x: global.size.width * 3 / 4 - buttonWidth / 2, y: global.size.width + 54, width: buttonWidth, height: buttonHeight))
		button!.tag = 123456
		view.addSubview(button!)
		
		return view
	}


	func genButton(title: String, frame: CGRect) -> UIButton? {

		let button = UIButton(type: .System)
		button.frame = CGRect(x: round(frame.origin.x), y: round(frame.origin.y), width: round(frame.size.width), height: round(frame.size.height))
		button.tintColor = Global.redColor()
		button.setTitle(title, forState: .Normal)
		button.titleLabel?.font = UIFont.systemFontOfSize(18)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = frame.height / 2
		// button.layer.borderWidth = 1.0
		// button.layer.borderColor = global.CGRedColor
		button.clipsToBounds = true
		return button
	}


}