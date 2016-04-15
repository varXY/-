
//
//  Attributes.swift
//  Questions
//
//  Created by 文川术 on 15/9/3.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit
import Foundation

class ViewGenerator {


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
		button.tintColor = UIColor.blackColor()
		button.layer.cornerRadius = globalRadius
		button.clipsToBounds = true
		button.exclusiveTouch = true

		addShadowForView(button)

		button.titleLabel?.font = UIFont.systemFontOfSize(20)
		button.backgroundColor = UIColor.whiteColor()
		button.tag = tag
        

		return button
	}


	func genRightOrWrongViewForQA(rightOrWrong: String, page: Int) -> UIView {
		let view = UIView(frame: CGRect(x: ScreenCenter.x - 50 + ScreenWidth * CGFloat(page), y: ScreenCenter.y - 50 - 64 - 30, width: 100, height: 100))
		view.layer.cornerRadius = view.frame.size.width / 2

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
		jumpButton.layer.cornerRadius = buttonWidth / 2
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
		let button_0 = genButtonWithCenter("查看题目", center: center_0, size: buttonSize)!
		button_0.backgroundColor = UIColor.whiteColor()
		if let label = button_0.subviews[0] as? UILabel {
			label.textColor = UIColor.themeRed()
		}
		button_0.layer.cornerRadius = globalRadius
		button_0.alpha = 0.7
		button_0.tag = 12345
		addShadowForView(button_0)
		view.addSubview(button_0)


		let center_1 = CGPoint(x: view.frame.width / 2, y: view.frame.size.height * 0.65 + 90 - 64)
		let button_1 = genButtonWithCenter("返回主页", center: center_1, size: buttonSize)!
		button_1.backgroundColor = UIColor.whiteColor()
		if let label = button_1.subviews[0] as? UILabel {
			label.textColor = UIColor.themeRed()
		}
		button_1.layer.cornerRadius = globalRadius
		button_1.alpha = 0.7
		button_1.tag = 123456
		addShadowForView(button_1)
		view.addSubview(button_1)

		return view
	}

	//MARK: - Base

//	func genButton(title: String, frame: CGRect) -> UIButton? {
//		let button = UIButton(type: .System)
//		button.frame = CGRect(x: round(frame.origin.x), y: round(frame.origin.y), width: round(frame.size.width), height: round(frame.size.height))
//		button.tintColor = UIColor.redColor()
//		button.setTitle(title, forState: .Normal)
//		button.titleLabel?.font = UIFont.systemFontOfSize(18)
//		button.backgroundColor = UIColor.whiteColor()
//		button.layer.cornerRadius = frame.height / 2
//		button.clipsToBounds = true
//        
//		addShadowForView(button)
//        
//        button.exclusiveTouch = true
//
//		return button
//	}

	func genButtonWithCenter(title: String, center: CGPoint, size: CGSize) -> UIButton? {
		let button = UIButton(type: .System)
		button.frame.size = size
		button.center = center
		button.tintColor = UIColor.redColor()
		button.setTitle(title, forState: .Normal)
		button.titleLabel?.font = UIFont.systemFontOfSize(18)
		button.backgroundColor = UIColor.whiteColor()
		button.clipsToBounds = true

		addShadowForView(button)
        
        button.exclusiveTouch = true

		return button
	}

	func addShadowForView(view: UIView) {
		view.layer.masksToBounds = false
		view.layer.shadowRadius = 3
		view.layer.shadowOpacity = 0.3
		view.layer.shadowColor = UIColor.lightGrayColor().CGColor
		view.layer.shadowOffset = CGSizeMake(0, 0)
	}


}