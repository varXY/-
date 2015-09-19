
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
	var maxX : CGFloat = 320
	var maxY : CGFloat = 320
	let buttonSize : CGFloat = 30.0

	var global = Global()

	func genRightOrWrongViewForQA(rightOrWrong: String) -> UIView {
		let view = UIView(frame: CGRect(x: global.center.x - 50, y: global.center.y - 50, width: 100, height: 100))
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
		let y = global.center.y - buttonWidth / 2 - 64

		let jumpButton = UIButton(type: .System)
		jumpButton.backgroundColor = UIColor.purpleColor()
		jumpButton.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
		jumpButton.layer.cornerRadius = 50
		jumpButton.clipsToBounds = true
		jumpButton.setTitle("Next", forState: .Normal)
		jumpButton.tag = page + 2333
		superView.addSubview(jumpButton)
	}

	func genQA(superView: UIView, page: Int, questions: [Question]) {
		let redColor = UIColor.redColor().CGColor

		let label = UILabel()
		label.frame = CGRect(x: 15 + global.size.width * CGFloat(page), y: global.size.height / 4.5 - 64, width: global.size.width - 30, height: 200)
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
		button1.layer.borderWidth = 0.5
		button1.titleLabel?.font = UIFont.systemFontOfSize(20)
		button1.tintColor = UIColor.redColor()
		button1.backgroundColor = UIColor.whiteColor()
		button1.setTitle(questions[page].rightAnswer, forState: .Normal)
		button1.tag = page * 2 + 1000
		superView.addSubview(button1)

		let button2 = UIButton(type: .System)
		button2.frame = CGRect(x: 20 + global.size.width * CGFloat(page), y: global.size.height * 0.65 + 90 - 64, width: global.size.width - 40, height: 60)
		button2.layer.cornerRadius = 10
		button2.tintColor = UIColor.redColor()
		button2.setTitle(questions[page].wrongAnswer, forState: .Normal)
		button2.layer.borderColor = redColor
		button2.layer.borderWidth = 0.5
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

	func genStartButtonForTest() -> UIButton {
		let buttonWidth: CGFloat = global.testBigButtonSize().width
		let buttonHeight:CGFloat = global.testBigButtonSize().height

		let startButton = UIButton(type: .System)
		startButton.frame = CGRect(x: (global.size.width - buttonWidth) / 2, y: (global.size.height - buttonHeight) / 2 - 49 , width: buttonWidth, height: buttonHeight)
		startButton.layer.cornerRadius = global.testBigButtonSize().width / 2
		startButton.clipsToBounds = true
		startButton.backgroundColor = UIColor.whiteColor()
		startButton.setTitle("start", forState: .Normal)
		startButton.tag = 333

		return startButton
	}

	func genRecordButtonForTest() -> UIButton {
		let buttonWidth: CGFloat = global.testSmallButtonSize().width
		let buttonHeight:CGFloat = global.testSmallButtonSize().height

		let recordButton = UIButton(type: .System)
		recordButton.frame = CGRect(x: (global.size.width - buttonWidth) / 2, y: (global.size.height - buttonHeight) / 2 + 200, width: buttonWidth, height: buttonHeight)
		recordButton.layer.cornerRadius = global.testSmallButtonSize().width / 2
		recordButton.clipsToBounds = true
		recordButton.backgroundColor = UIColor.whiteColor()
		recordButton.setTitle("Record", forState: .Normal)
		recordButton.tag = 444

		return recordButton
	}

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

	func genLitteButtons() -> [UIButton] {

		for _ in 0..<15 {
			let button = generateLittleButtons()
			littleButtons.append(button)
		}

		return littleButtons
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

	func generateLittleButtons() -> UIButton {
		let frame = randomFrame()
		let color = UIColor.clearColor()
		let newbutton = addLittlebutton(frame, color: color)
		newbutton.setTitle(randomLetter(), forState: .Normal)
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
		var guess = CGRectMake(60, 60, 30, 30)

		repeat {
			let guessX = CGFloat(arc4random_uniform(291))
			let guessY = CGFloat(arc4random_uniform(490) + 60)
			guess = CGRectMake(guessX, guessY, buttonSize + 5, buttonSize + 5)
		} while(!doesNotCollide(guess)) 

		return guess

	}

	func doesNotCollide(testRect: CGRect) -> Bool {
		for button: UIButton in littleButtons {
			let viewRect = button.frame
			if(CGRectIntersectsRect(testRect, viewRect)) {
				return false
			}
		}
		return true
	}

	func genButton(title: String, frame: CGRect) -> UIButton? {

		let button = UIButton(type: .System)
		button.frame = frame
		button.setTitle(title, forState: .Normal)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = frame.height / 2
		button.clipsToBounds = true
		return button
	}


	func genDots() -> UIView {
		let view = UIView(frame: CGRect(x: (global.size.width - 155) / 2, y: global.size.height - 30, width: 155, height: 20))
		view.backgroundColor = UIColor.clearColor()

		for i in 0..<10 {
			let littleView = UIView(frame: CGRect(x: 5 + 15 * i, y: 5, width: 10, height: 10))
			littleView.layer.cornerRadius = 5
			littleView.clipsToBounds = true
			littleView.backgroundColor = UIColor.darkGrayColor()
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
		label.backgroundColor = UIColor.redColor()

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

		let button = UIButton(type: .System)
		button.frame.size = CGSize(width: buttonWidth + 50, height: buttonHeight + 50)
		button.frame.origin = CGPoint(x: global.size.width / 4 - (buttonWidth + 50) / 2, y: global.size.width + 54 - buttonHeight / 2)
		button.layer.cornerRadius = (buttonWidth + 50) / 2
		button.clipsToBounds = true
		button.tintColor = UIColor.redColor()
		button.backgroundColor = UIColor.whiteColor()
		button.setTitle("查看题目", forState: .Normal)
		button.tag = 12345
		view.addSubview(button)

		let button1 = UIButton(type: .System)
		button1.frame.size = CGSize(width: buttonWidth, height: buttonHeight)
		button1.frame.origin = CGPoint(x: global.size.width * 3 / 4 - buttonWidth / 2, y: global.size.width + 54)
		button1.backgroundColor = UIColor.whiteColor()
		button1.setTitle("退出", forState: .Normal)
		button1.tintColor = UIColor.redColor()
		button1.layer.cornerRadius = buttonWidth / 2
		button1.clipsToBounds = true
		button1.tag = 123456
		view.addSubview(button1)
		
		return view
	}


}