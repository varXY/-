//
//  QuestionViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class QuestionViewController: UIViewController {

	var global = Global()
	var generator = Generator()

	var type = 0
	var questions = [Question]()
	var rightCount = 0
	var rightOrWrong = [Int]()

	var scrollView = UIScrollView()
	var currentPage = 0
	var dotView = UIView()
	var fakeButton = UIView()

	var sound = true
	var vibration = true

	var rightSound: AVAudioPlayer!
	var wrongSound: AVAudioPlayer!

	var record: ((rightCount: Int, date: NSDate) -> Void)?

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "1/10"
		self.view.backgroundColor = UIColor.whiteColor()
		self.fd_interactivePopDisabled = true

		let question = Question()
		questions = question.getQestions(10, type: type)

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(confirmToQuit))
		quitButton.tintColor = UIColor.whiteColor()
		self.navigationItem.rightBarButtonItem = quitButton
		self.navigationItem.setHidesBackButton(true, animated: true)

		scrollView.frame = view.bounds
		scrollView.backgroundColor = UIColor.backgroundColor()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		scrollView.contentSize = CGSize(width: self.view.bounds.width * 10, height: self.view.bounds.height)
		view.addSubview(scrollView)

		dotView = generator.genDots()
		let firstDot = dotView.subviews[0]
		firstDot.backgroundColor = UIColor.lightGrayColor()
		view.addSubview(dotView)

		generator.genQA(scrollView, page: 0, questions: questions)
		addActionToButtons(0, page: 0)

		prepareAudios()

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		if let page = self.view.viewWithTag(9999999) {

			let seeButton = page.viewWithTag(12345) as! UIButton
			seeButton.hidden = false
			seeButton.transform = CGAffineTransformIdentity
			seeButton.backgroundColor = UIColor.whiteColor()
			if let label = seeButton.subviews[0] as? UILabel {
				label.textColor = UIColor.themeRed()
			}
			seeButton.genAnimation(.Appear, delay: 0.0, distance: 40)

			let quitButton = page.viewWithTag(123456) as! UIButton
			quitButton.hidden = false
			quitButton.transform = CGAffineTransformIdentity
			quitButton.backgroundColor = UIColor.whiteColor()
			if let label = quitButton.subviews[0] as? UILabel {
				label.textColor = UIColor.themeRed()
			}
			quitButton.genAnimation(.Appear, delay: 0.1, distance: 70)
		}

		let userDefaults = NSUserDefaults.standardUserDefaults()
		if let sound = userDefaults.valueForKey("Sound") as? Bool {
			self.sound = sound
		}

	}


	func chosen(sender: UIButton) {
		getResult(sender)
		disableAndColorButtons(sender)
		currentPage += 1
		currentPage == 10 ? testIsOver() : genJumpButton()
	}


	func getResult(sender: UIButton) {

		if sender.titleLabel?.text == questions[currentPage].rightAnswer {
			if sound { rightSound.play() }
			showRightOrWrongView("right")
			rightCount += 1
			rightOrWrong.append(1)

			if let dot = dotView.viewWithTag(currentPage + 500) {
				dot.backgroundColor = UIColor.rightGreen()
			}

		} else {
			if sound { wrongSound.play() }
			if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
			showRightOrWrongView("wrong")
			rightOrWrong.append(0)

			if let dot = dotView.viewWithTag(currentPage + 500) {
				dot.backgroundColor = UIColor.themeRed()
			}

		}
	}

	func disableAndColorButtons(sender: UIButton) {
		let rightAnswer = questions[currentPage].rightAnswer
		let tags = [sender.tag - 1, sender.tag, sender.tag + 1]

		for tag in tags {

			if let button = scrollView.viewWithTag(tag) as? UIButton {

				if button.titleLabel?.text == rightAnswer {
					button.userInteractionEnabled = false
					button.genAnimation(.IsRightAnswer, delay: 0.0, distance: 0.0)
					button.tintColor = UIColor.whiteColor()
					button.backgroundColor = UIColor.rightGreen()
				} else {
					button.enabled = false
				}

			}
			
		}
		
	}

	func genJumpButton() {
		delay(seconds: 0.5, completion: { () -> () in
			self.generator.genJumpButtonForQA(self.scrollView, page: self.currentPage - 1)
			self.addActionToButtons(1, page: self.currentPage - 1)
		})
	}


	func testIsOver() {
		let date = NSDate()
		record?(rightCount: rightCount, date: date)

		delay(seconds: 2.0, completion: { () -> () in
			UIView.animateWithDuration(0.8, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				self.scrollView.removeFromSuperview()
				self.view.backgroundColor = UIColor.backgroundColor()
				self.title = "完成"
			})
		})

		delay(seconds: 3.0, completion: { () -> () in
			let finalView = self.generator.showTestFinalPage(self.rightCount)
			finalView.tag = 9999999
			self.view.addSubview(finalView)

			if let button = finalView.viewWithTag(12345) as? UIButton {
				button.addTarget(self, action: #selector(self.seeAnsweredQA(_:)), forControlEvents: .TouchUpInside)
				button.genAnimation(.Appear, delay: 0.0, distance: 40)
			}

			if let button = finalView.viewWithTag(123456) as? UIButton {
				button.addTarget(self, action: #selector(self.animatedAndQuit(_:)), forControlEvents: .TouchUpInside)
				button.genAnimation(.Appear, delay: 0.1, distance: 70)
			}


		})

	}

	func showRightOrWrongView(rightOrWrong: String) {
		let view = generator.genRightOrWrongViewForQA(rightOrWrong, page: currentPage)
		scrollView.addSubview(view)

		delay(seconds: 1.0) { () -> () in
			view.alpha = 0.0
			view.transform = CGAffineTransformMakeScale(0.7, 0.7)
			view.frame.origin.y += 30
			self.fakeButton = view
		}

		if currentPage != 9 {

			delay(seconds: 2.0) { () -> () in

				UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
					view.backgroundColor = UIColor(patternImage: UIImage(named: "下一题")!)
					view.alpha = 1.0
					view.frame.origin.y -= 30

					view.layer.masksToBounds = false
					view.layer.shadowColor = UIColor.lightGrayColor().CGColor
					view.layer.shadowOpacity = 0.5
					view.layer.shadowRadius = 10
					view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
					}, completion: nil)
				
			}

		}

	}

	func addActionToButtons(kind: Int, page: Int) {

		switch kind {
		case 0:
			if let button = scrollView.viewWithTag(page * 2 + 1000) as? UIButton {
				button.addTarget(self, action: #selector(chosen(_:)), forControlEvents: .TouchUpInside)
			}

			if let button = scrollView.viewWithTag(page * 2 + 1001) as? UIButton {
				button.addTarget(self, action: #selector(chosen(_:)), forControlEvents: .TouchUpInside)
			}

		case 1:
			if let button = scrollView.viewWithTag(page + 2333) as? UIButton {
				button.addTarget(self, action: #selector(jump), forControlEvents: .TouchUpInside)
			}

		default:
			break
		}

	}


	func jump() {
		fakeButton.alpha = 0.5
		generator.genQA(scrollView, page: currentPage, questions: questions)
		addActionToButtons(0, page: currentPage)
		jumpToPage(currentPage)

		if let dot = dotView.viewWithTag(currentPage + 500) {
			dot.backgroundColor = UIColor.lightGrayColor()
		}

		self.title = "\(currentPage + 1)/10"

	}


	func jumpToPage(page: Int) {
		let duration = Double(global.size.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: nil)

	}


	func quit() {
		navigationController?.popViewControllerAnimated(true)
	}

	func confirmToQuit() {

		if currentPage != 0 && currentPage != 10 {
			let alert = UIAlertController(title: "提示", message: "答题还没完成，确定退出吗？", preferredStyle: .Alert)

			let action = UIAlertAction(title: "确定", style: .Default, handler: ({ _ in self.quit() }))
			alert.addAction(action)

			let action1 = UIAlertAction(title: "取消", style: .Default, handler: nil)
			alert.addAction(action1)

			presentViewController(alert, animated: true, completion: nil)
		} else {
			self.quit()
		}

	}


	func seeAnsweredQA(sender: UIButton) {

		UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.225, options: [], animations: { () -> Void in
			sender.backgroundColor = UIColor.backgroundColor()
			sender.transform = CGAffineTransformMakeScale(0.9, 0.9)
			if let label = sender.subviews[0] as? UILabel {
				label.textColor = UIColor.grayColor()
			}

			}, completion: nil)

		let answeredQAVC = AnsweredQAViewController()
		answeredQAVC.questions = self.questions
		answeredQAVC.rightOrWrong = self.rightOrWrong

		let answeredQANavi = NavigationController(viewController: answeredQAVC)

		delay(seconds: 0.2) { () -> () in
			self.presentViewController(answeredQANavi, animated: true, completion: nil)
		}

	}

	func animatedAndQuit(sender: UIButton) {

		UIView.animateWithDuration(0.3) { () -> Void in
			sender.backgroundColor = UIColor.backgroundColor()
			sender.transform = CGAffineTransformMakeScale(0.9, 0.9)
			if let label = sender.subviews[0] as? UILabel {
				label.textColor = UIColor.grayColor()
			}
		}

		delay(seconds: 0.2) { () -> () in
			self.quit()
		}
	}


	// MARK: - Sound Effect

	func prepareAudios() {
		let sound_0 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("right", ofType: "caf")!)
		try! rightSound = AVAudioPlayer(contentsOfURL: sound_0)
		let sound_1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong", ofType: "caf")!)
		try! wrongSound = AVAudioPlayer(contentsOfURL: sound_1)
	}


}


