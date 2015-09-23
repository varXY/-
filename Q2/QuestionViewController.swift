//
//  QuestionViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import AVFoundation

class QuestionViewController: UIViewController {
	var scrollView = UIScrollView()
	var pageControl = UIPageControl()

	var global = Global()

	var questions = [Question]()
	var rightCount = 0
	var rightOrWrong = [Int]()
	var generator = Generator()
	var dotView = UIView()

	var player0 = AVAudioPlayer()
	var player1 = AVAudioPlayer()

	var record: ((rightCount: Int, date: NSDate) -> Void)?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "1/10"
		let question = Question()
		questions = question.getQestions(10)

		self.view.backgroundColor = UIColor.whiteColor()
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "confirmToQuit")
		quitButton.tintColor = UIColor.whiteColor()
		self.navigationItem.rightBarButtonItem = quitButton
		self.navigationItem.leftBarButtonItem = quitButton
		self.navigationController?.navigationItem.leftBarButtonItem = nil

		scrollView.frame = view.bounds
		scrollView.delegate = self
		scrollView.backgroundColor = UIColor.whiteColor()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		scrollView.contentSize = CGSize(width: self.view.bounds.width * 10, height: self.view.bounds.height)
		// scrollView.bounces = false
		view.addSubview(scrollView)

		pageControl.frame = CGRect(x: 0, y: 520, width: 320, height: 30)
		pageControl.numberOfPages = 10
		pageControl.currentPage = 0
		pageControl.userInteractionEnabled = false
		pageControl.hidden = true
		view.addSubview(pageControl)

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
		hidesBottomBarWhenPushed = true

		if let page = self.view.viewWithTag(9999999) {

			let seeButton = page.viewWithTag(12345) as! UIButton
			seeButton.hidden = false
			seeButton.genAnimation(.Appear, delay: 0.0, distance: 30)

			let quitButton = page.viewWithTag(123456) as! UIButton
			quitButton.hidden = false
			quitButton.genAnimation(.Appear, delay: 0.1, distance: 70)
		}


	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		hidesBottomBarWhenPushed = false
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
	}


	func chosen(sender: UIButton) {
		getResult(sender)
		disableAndColorButtons(sender)
		delay(seconds: 0.2) { () -> () in
			self.genJumpButton(sender)
		}
		testIsOver(sender)
	}


	func getResult(sender: UIButton) {

		if sender.titleLabel?.text == questions[pageControl.currentPage].rightAnswer {
			player0.play()
			showRightOrWrongView("right")
			rightCount += 1
			rightOrWrong.append(1)

			if let dot = dotView.viewWithTag(pageControl.currentPage + 500) {
				dot.backgroundColor = Global.greenColor()
			}

		} else {
			player1.play()
			AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
			showRightOrWrongView("wrong")
			rightOrWrong.append(0)

			if let dot = dotView.viewWithTag(pageControl.currentPage + 500) {
				dot.backgroundColor = Global.redColor()
			}


		}
	}

	func disableAndColorButtons(sender: UIButton) {
		let rightAnswer = questions[pageControl.currentPage].rightAnswer
		let tags = [sender.tag - 1, sender.tag, sender.tag + 1]

		for tag in tags {

			if let button = scrollView.viewWithTag(tag) as? UIButton {

				if button.titleLabel?.text == rightAnswer {
					button.userInteractionEnabled = false
					button.genAnimation(.IsRightAnswer, delay: 0.0, distance: 0.0)
					button.tintColor = UIColor.whiteColor()
					button.layer.borderColor = global.CGGreenColor
					button.backgroundColor = Global.greenColor()
				} else {
					button.enabled = false
					button.layer.borderColor = global.CGlightGrayColor
				}

			}
			
		}
		
	}

	func genJumpButton(sender: UIButton) {
		if sender.tag != 1018 && sender.tag != 1019 {

			delay(seconds: 0.5, completion: { () -> () in
				let page = self.pageControl.currentPage
				self.generator.genJumpButtonForQA(self.scrollView, page: page)
				self.addActionToButtons(1, page: page)
			})
		}
	}



	func testIsOver(sender: UIButton) {
		if sender.tag == 1018 || sender.tag == 1019 {

			let date = NSDate()
			record?(rightCount: rightCount, date: date)

			delay(seconds: 2.0, completion: { () -> () in
				UIView.animateWithDuration(0.8, animations: { () -> Void in
					self.scrollView.alpha = 0.0
					self.scrollView.removeFromSuperview()
					self.view.backgroundColor = Global.grayColor()
				})
			})

			delay(seconds: 3.0, completion: { () -> () in
				let finalView = self.generator.showTestFinalPage(self.rightCount)

				if let button = finalView.viewWithTag(12345) as? UIButton {
					button.addTarget(self, action: "seeAnsweredQA", forControlEvents: .TouchUpInside)
					button.genAnimation(.Appear, delay: 0.0, distance: 40)
				}

				if let button = finalView.viewWithTag(123456) as? UIButton {
					button.addTarget(self, action: "animatedAndQuit", forControlEvents: .TouchUpInside)
					button.genAnimation(.Appear, delay: 0.1, distance: 80)
				}

				finalView.tag = 9999999
				self.view.addSubview(finalView)
			})
			
			
		}
	}

	func showRightOrWrongView(rightOrWrong: String) {
		let view = generator.genRightOrWrongViewForQA(rightOrWrong, page: pageControl.currentPage)
		scrollView.addSubview(view)

		delay(seconds: 1.0) { () -> () in
			view.alpha = 0.0
			view.transform = CGAffineTransformMakeScale(0.7, 0.7)
			view.frame.origin.y += 30
		}

		if pageControl.currentPage != 9 {
			delay(seconds: 2.0) { () -> () in

				UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
					view.backgroundColor = UIColor(patternImage: UIImage(named: "下一题")!)
					view.alpha = 0.7
					view.frame.origin.y -= 30
					}, completion: nil)
				
			}
		}

	}

	func addActionToButtons(kind: Int, page: Int) {

		switch kind {
		case 0:
			if let button = scrollView.viewWithTag(page * 2 + 1000) as? UIButton {
				button.addTarget(self, action: "chosen:", forControlEvents: .TouchUpInside)
			}

			if let button = scrollView.viewWithTag(page * 2 + 1001) as? UIButton {
				button.addTarget(self, action: "chosen:", forControlEvents: .TouchUpInside)
			}

		case 1:
			if let button = scrollView.viewWithTag(page + 2333) as? UIButton {
				button.addTarget(self, action: "jump", forControlEvents: .TouchUpInside)
			}

		default:
			break
		}
	}


	func jump() {
		let page = pageControl.currentPage + 1

		generator.genQA(scrollView, page: page, questions: questions)
		addActionToButtons(0, page: page)

		jumpToPage(page)

		if let dot = dotView.viewWithTag(page + 500) {
			dot.backgroundColor = UIColor.lightGrayColor()
		}

		dispatch_async(dispatch_get_main_queue()) {
			self.title = "\(page + 1)/10"
		}
	}


	func jumpToPage(page: Int) {
		UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: -64.0)
			}, completion: nil)
	}


	func quit() {
		player0.stop()
		player1.stop()
		self.scrollView.removeFromSuperview()
		self.rightCount = 0
		self.rightOrWrong.removeAll(keepCapacity: false)
		self.navigationController?.popViewControllerAnimated(true)
	}

	func confirmToQuit() {

		if self.view.viewWithTag(9999999) == nil {
			let alert = UIAlertController(title: "提示", message: "答题还没完成，确定退出吗？", preferredStyle: .Alert)

			let action = UIAlertAction(title: "确定", style: .Destructive, handler: ({ _ in self.quit() }))
			alert.addAction(action)

			let action1 = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
			// alert.view.tintColor = Global.greenColor()
			alert.addAction(action1)

			presentViewController(alert, animated: true, completion: nil)
		} else {
			self.quit()
		}

	}


	func seeAnsweredQA() {

		let page = self.view.viewWithTag(9999999)

		let seeButton = page?.viewWithTag(12345) as! UIButton
		seeButton.genAnimation(.Touched, delay: 0.0, distance: 0.0)

		let quitButton = page?.viewWithTag(123456) as! UIButton
		quitButton.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
		
		let AnsweredQAVC = AnsweredQAViewController()
		AnsweredQAVC.questions = self.questions
		AnsweredQAVC.rightOrWrong = self.rightOrWrong

		let detailNV = DetailNavigationController(rootViewController: AnsweredQAVC)
		detailNV.toolbarHidden = true

		delay(seconds: 0.5) { () -> () in
			self.presentViewController(detailNV, animated: true, completion: nil)
		}

	}

	func animatedAndQuit() {
		let page = self.view.viewWithTag(9999999)

		let seeButton = page?.viewWithTag(12345) as! UIButton
		seeButton.genAnimation(.Disappear, delay: 0.0, distance: 0.0)

		let quitButton = page?.viewWithTag(123456) as! UIButton
		quitButton.genAnimation(.Touched, delay: 0.0, distance: 0.0)

		delay(seconds: 0.7) { () -> () in
			self.quit()
		}
	}


	// MARK: - Sound Effect

	func prepareAudios() {
		let rightSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("right", ofType: "caf")!)
		let wrongSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong", ofType: "caf")!)

		try! player0 = AVAudioPlayer(contentsOfURL: rightSound)
		try! player1 = AVAudioPlayer(contentsOfURL: wrongSound)


	}


}

extension QuestionViewController: UIScrollViewDelegate {

	func scrollViewDidScroll(scrollView: UIScrollView) {
		let width = scrollView.bounds.size.width
		pageControl.currentPage = Int((scrollView.contentOffset.x + width/2) / width)
	}

}

