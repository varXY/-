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

	var viewGenerator = ViewGenerator()

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

	var beginnerRecords: Records!
	var intermediateRecords: Records!
	var advancedRecords: Records!

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "1/10"
		view.backgroundColor = UIColor.whiteColor()
		fd_interactivePopDisabled = true

		questions = Question().getQestions(10, type: type)

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(confirmToQuit))
		quitButton.tintColor = UIColor.whiteColor()
		navigationItem.rightBarButtonItem = quitButton
		navigationItem.setHidesBackButton(true, animated: true)

		scrollView.frame = view.bounds
		scrollView.backgroundColor = UIColor.backgroundColor()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		scrollView.contentSize = CGSize(width: self.view.bounds.width * 10, height: self.view.bounds.height)
		view.addSubview(scrollView)

		dotView = viewGenerator.genDots()
		let firstDot = dotView.subviews[0]
		firstDot.backgroundColor = UIColor.lightGrayColor()
		view.addSubview(dotView)

		viewGenerator.genQA(scrollView, page: 0, questions: questions)
		addActionToButtons(0, page: 0)

		prepareAudios()

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
					button.genAnimation(.IsRightAnswer, delayTime: 0.0, distance: 0.0)
					button.tintColor = UIColor.whiteColor()
					button.backgroundColor = UIColor.rightGreen()
				} else {
					button.enabled = false
				}

			}
			
		}
		
	}

	func genJumpButton() {
		delay(seconds: 0.5, completion: {
			self.viewGenerator.genJumpButtonForQA(self.scrollView, page: self.currentPage - 1)
			self.addActionToButtons(1, page: self.currentPage - 1)
		})
	}


	func testIsOver() {
		record?(rightCount: rightCount, date: NSDate())

		delay(seconds: 1.5, completion: { () -> () in
			UIView.animateWithDuration(0.8, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				self.scrollView.removeFromSuperview()
				self.view.backgroundColor = UIColor.backgroundColor()
				self.title = "完成"
			})
		})

		delay(seconds: 2.5, completion: { () -> () in
			let finalViews = FinalViews(rightCount: self.rightCount)
			self.view.addSubview(finalViews.finalLabel)
			finalViews.buttons.forEach({
				self.view.addSubview($0)
				let index = finalViews.buttons.indexOf($0)!
				$0.genAnimation(.Appear, delayTime: 0.1 * Double(index) , distance: 40 + 30 * CGFloat(index))

				$0.addTarget(self, action: #selector(self.touchDown(_:)), forControlEvents: .TouchDown)
				$0.addTarget(self, action: #selector(self.touchUpOutSide(_:)), forControlEvents: .TouchUpOutside)
				$0.addTarget(self, action: #selector(self.touchUpInside(_:)), forControlEvents: .TouchUpInside)
			})

		})

	}

	func touchDown(sender: UIButton) {
		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: { 
			sender.transform = CGAffineTransformMakeScale(0.9, 0.9)
			}) { (_) in
		}
	}

	func touchUpOutSide(sender: UIButton) {
		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: {
			sender.transform = CGAffineTransformIdentity
		}) { (_) in
		}
	}

	func touchUpInside(sender: UIButton) {
		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: {
			sender.transform = CGAffineTransformIdentity
		}) { (_) in
			switch (sender.titleLabel?.text)! {
			case "查看题目":
				let answeredQAVC = AnsweredQAViewController()
				answeredQAVC.questions = self.questions
				answeredQAVC.rightOrWrong = self.rightOrWrong
				self.presentViewController(NavigationController(viewController: answeredQAVC), animated: true, completion: nil)
			case "答题记录":
				let recordVC = RecordViewController()
				recordVC.beginnerRecords = self.beginnerRecords.records
				recordVC.intermediateRecords = self.intermediateRecords.records
				recordVC.advancedRecords = self.advancedRecords.records
				recordVC.type = self.type
				self.presentViewController(NavigationController(viewController: recordVC), animated: true, completion: nil)
			case "返回主页":
				self.quit()
			default:
				break
			}
		}
	}

	func showRightOrWrongView(rightOrWrong: String) {
		let view = viewGenerator.genRightOrWrongViewForQA(rightOrWrong, page: currentPage)
		scrollView.addSubview(view)

		delay(seconds: 1.0) {
			view.alpha = 0.0
			view.transform = CGAffineTransformMakeScale(0.7, 0.7)
			view.frame.origin.y += 30
			self.fakeButton = view
		}

		if currentPage != 9 {

			delay(seconds: 2.0) {
				UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
					view.backgroundColor = UIColor(patternImage: UIImage(named: "下一题")!)
					view.alpha = 1.0
					view.frame.origin.y -= 30
					view.addShadow()
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
		viewGenerator.genQA(scrollView, page: currentPage, questions: questions)
		addActionToButtons(0, page: currentPage)
		jumpToPage(currentPage)

		if let dot = dotView.viewWithTag(currentPage + 500) {
			dot.backgroundColor = UIColor.lightGrayColor()
		}

		title = "\(currentPage + 1)/10"

	}


	func jumpToPage(page: Int) {

		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: { 
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: nil)

//		let duration = Double(ScreenWidth / 640)
//
//		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
//			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
//			}, completion: nil)

	}


	func quit() {
		navigationController?.popViewControllerAnimated(true)
	}

	func confirmToQuit() {

		if currentPage != 0 && currentPage != 10 {
			let alert = UIAlertController(title: "提示", message: "答题还没完成，确定退出吗？", preferredStyle: .Alert)

			let action = UIAlertAction(title: "确定", style: .Default, handler: ({ _ in self.quit() }))
			let action1 = UIAlertAction(title: "取消", style: .Default, handler: nil)

			alert.addAction(action)
			alert.addAction(action1)

			presentViewController(alert, animated: true, completion: nil)
		} else {
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


