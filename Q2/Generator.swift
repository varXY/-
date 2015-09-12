
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

	func genButtons() -> [UIButton] {
		var button = genButton("单位公式", position: (110, 100))
		buttons.append(button!)

		button = genButton("符号图标", position: (110, 230))
		buttons.append(button!)

		button = genButton("工具设备", position: (110, 360))
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

	func genButton(title: String, position: (Int, Int)) -> UIButton? {

		let button = UIButton.buttonWithType(.System) as! UIButton
		button.frame = CGRect(x: position.0, y: position.1, width: 100, height: 100)
		button.setTitle(title, forState: .Normal)
		button.backgroundColor = UIColor.whiteColor()
		button.layer.cornerRadius = 50
		button.clipsToBounds = true
		return button
	}


}