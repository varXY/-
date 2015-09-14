
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
	var buttons = [UIButton]()
	var maxX : CGFloat = 320
	var maxY : CGFloat = 320
	let buttonSize : CGFloat = 30.0

	var global = Global()

	func genButtons() -> [UIButton] {
		var buttonSize = global.buttonSize()
		var marginY = global.margin()

		var buttonX = (global.size.width - buttonSize.width) / 2
		
		var marginY_1 = marginY + 64
		var marginY_2 = marginY * 2 + buttonSize.height + 64
		var marginY_3 = marginY * 3 + buttonSize.height * 2 + 64

		var button = genButton("单位公式", frame: CGRect(x: buttonX, y: marginY_1, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)

		button = genButton("图标符号", frame: CGRect(x: buttonX, y: marginY_2, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)

		button = genButton("工具设备", frame: CGRect(x: buttonX, y: marginY_3, width: buttonSize.width, height: buttonSize.height))
		buttons.append(button!)


		for i in 0..<10 {
			let button = generateLittleButtons()
			buttons.append(button)
		}
		
		return buttons

	}

	func generateLittleButtons() -> UIButton {
		var frame = randomFrame()
		var color = UIColor.clearColor()
		var newbutton = addLittlebutton(frame, color: color)
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

		do {
			let guessX = CGFloat(arc4random_uniform(291))
			let guessY = CGFloat(arc4random_uniform(490) + 60)
			guess = CGRectMake(guessX, guessY, buttonSize + 5, buttonSize + 5)
		} while(!doesNotCollide(guess)) 

		return guess

	}

	func doesNotCollide(testRect: CGRect) -> Bool {
		for button: UIButton in buttons {
			var viewRect = button.frame
			if(CGRectIntersectsRect(testRect, viewRect)) {
				return false
			}
		}
		return true
	}

	func genButton(title: String, frame: CGRect) -> UIButton? {

		let button = UIButton.buttonWithType(.System) as! UIButton
		button.frame = frame
		button.setTitle(title, forState: .Normal)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = frame.height / 2
		button.clipsToBounds = true
		return button
	}


	func genDots() -> UIView {
		var view = UIView(frame: CGRect(x: (global.size.width - 155) / 2, y: global.size.height - 30, width: 155, height: 20))
		view.backgroundColor = UIColor.clearColor()

		for i in 0..<10 {
			var littleView = UIView(frame: CGRect(x: 5 + 15 * i, y: 5, width: 10, height: 10))
			littleView.layer.cornerRadius = 5
			littleView.clipsToBounds = true
			littleView.backgroundColor = UIColor.darkGrayColor()
			littleView.tag = i + 500
			view.addSubview(littleView)
		}

		return view
	}

	func showTestFinalPage(rightCount: Int) -> UIView {
		var view = UIView()
		view.frame = CGRect(x: 0, y: 0, width: global.size.width, height: global.size.height)

		var label = UILabel()
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

		var buttonWidth = global.testSmallButtonSize().width
		var buttonHeight = global.testSmallButtonSize().height

		var button = UIButton.buttonWithType(.System) as! UIButton
		button.frame.size = CGSize(width: buttonWidth + 50, height: buttonHeight + 50)
		button.frame.origin = CGPoint(x: global.size.width / 4 - (buttonWidth + 50) / 2, y: global.size.width + 54 - buttonHeight / 2)
		button.layer.cornerRadius = (buttonWidth + 50) / 2
		button.clipsToBounds = true
		button.tintColor = UIColor.redColor()
		button.backgroundColor = UIColor.whiteColor()
		button.setTitle("查看题目", forState: .Normal)
		button.tag = 12345
		view.addSubview(button)

		var button1 = UIButton.buttonWithType(.System) as! UIButton
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