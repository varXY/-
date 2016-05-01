
//
//  Attributes.swift
//  Questions
//
//  Created by 文川术 on 15/9/3.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit
import Foundation

struct ViewGenerator {

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
		button.tintColor = UIColor.blackColor()
		button.layer.cornerRadius = globalRadius
		button.clipsToBounds = true
		button.exclusiveTouch = true
		button.addShadow()

		button.titleLabel?.font = UIFont.systemFontOfSize(20)
		button.backgroundColor = UIColor.whiteColor()
		button.tag = tag

		return button
	}


	func genRightOrWrongViewForQA(rightOrWrong: String, page: Int) -> UIView {
		let view = UIView(frame: CGRect(x: ScreenCenter.x - 50 + ScreenWidth * CGFloat(page), y: ScreenCenter.y - 50 - 64 - 30, width: 100, height: 100))
		view.layer.cornerRadius = view.frame.size.width / 2

		switch rightOrWrong {
		case "right": view.backgroundColor = UIColor(patternImage: UIImage(named: "正确")!)
		case "wrong": view.backgroundColor = UIColor(patternImage: UIImage(named: "错误")!)
		default: break
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
		jumpButton.layer.cornerRadius = buttonWidth / 2
		jumpButton.clipsToBounds = true
		jumpButton.tag = page + 2333
        jumpButton.exclusiveTouch = true
		superView.addSubview(jumpButton)
	}


	func genDots() -> UIView {
		var frame = CGRect()

		switch ScreenHeight {
		case 480: frame = CGRect(x: (ScreenWidth - 135) / 2, y: ScreenHeight - 15 - 64, width: 135, height: 15)
		default: frame = CGRect(x: (ScreenWidth - 135) / 2, y: ScreenHeight - 30 - 64, width: 135, height: 20)
		}

		let view = UIView(frame: frame)
		view.backgroundColor = UIColor.clearColor()

		let indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		indexes.forEach({
			let littleView = UIView(frame: CGRect(x: 5 + 13 * $0, y: 5, width: 8, height: 8))
			littleView.layer.cornerRadius = 4
			littleView.clipsToBounds = true
			littleView.backgroundColor = UIColor.grayColor()
			littleView.tag = $0 + 500
			view.addSubview(littleView)
		})

		return view
	}


}