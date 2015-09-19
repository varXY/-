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

class QuestionViewController: UIViewController {
	var scrollView = UIScrollView()
	var pageControl = UIPageControl()

	var global = Global()

	var questions = [Question]()
	var rightCount = 0
	var rightOrWrong = [Int]()
	var generator = Generator()
	var dotView = UIView()

	var record: ((rightCount: Int, date: NSDate) -> Void)?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "1/10"
		let question = Question()
		questions = question.getQestions(10)

		self.view.backgroundColor = UIColor.whiteColor()
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "quit")
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
		view.addSubview(dotView)

		generator.genQA(scrollView, page: 0, questions: questions)
		addAnimationAndActionToButtons(0, page: 0)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = true
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
		genJumpButton(sender)
		testIsOver(sender)
	}


	func getResult(sender: UIButton) {

		if sender.titleLabel?.text == questions[pageControl.currentPage].rightAnswer {
			AudioServicesPlaySystemSound(1008)
			showRightOrWrongView("right")
			rightCount += 1
			rightOrWrong.append(1)

			if let dot = dotView.viewWithTag(pageControl.currentPage + 500) {
				dot.backgroundColor = UIColor.greenColor()
			}

		} else {
			AudioServicesPlaySystemSound(1053)
			showRightOrWrongView("wrong")
			rightOrWrong.append(0)

			if let dot = dotView.viewWithTag(pageControl.currentPage + 500) {
				dot.backgroundColor = UIColor.redColor()
			}

			// AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
		}
	}

	func disableAndColorButtons(sender: UIButton) {
		sender.enabled = false
		let rightAnswer = questions[pageControl.currentPage].rightAnswer
		let tags = [sender.tag - 1, sender.tag, sender.tag + 1]

		for tag in tags {

			if let button = scrollView.viewWithTag(tag) as? UIButton {
				button.enabled = false

				if button.titleLabel?.text == rightAnswer {
					button.genAnimation(.IsRightAnswer, delay: 0.0, distance: 0.0)
					button.layer.borderColor = global.CGGreenColor
					button.titleLabel?.textColor = UIColor.greenColor()
				} else {
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
				self.addAnimationAndActionToButtons(1, page: page)
			})
		}
	}



	func testIsOver(sender: UIButton) {
		if sender.tag == 1018 || sender.tag == 1019 {

			let date = NSDate()
			record?(rightCount: rightCount, date: date)

			delay(seconds: 0.5, completion: { () -> () in
				UIView.animateWithDuration(0.8, animations: { () -> Void in
					self.scrollView.alpha = 0.0
					self.scrollView.removeFromSuperview()
					self.view.backgroundColor = UIColor.grayColor()
				})
			})

			delay(seconds: 1.4, completion: { () -> () in
				let finalView = self.generator.showTestFinalPage(self.rightCount)

				if let button = finalView.viewWithTag(12345) as? UIButton {
					button.addTarget(self, action: "seeAnsweredQA", forControlEvents: .TouchUpInside)
					button.genAnimation(.Appear, delay: 0.0, distance: 0.0)
				}

				if let button = finalView.viewWithTag(123456) as? UIButton {
					button.addTarget(self, action: "quit", forControlEvents: .TouchUpInside)
					button.genAnimation(.Appear, delay: 0.0, distance: 0.0)
				}

				self.view.addSubview(finalView)
			})
			
			
		}
	}

	func showRightOrWrongView(rightOrWrong: String) {
		let view = generator.genRightOrWrongViewForQA(rightOrWrong)
		self.view.addSubview(view)

		delay(seconds: 0.4) { () -> () in
			view.removeFromSuperview()
		}
	}

	func addAnimationAndActionToButtons(kind: Int, page: Int) {

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
				button.genAnimation(.FromZeroToFull, delay: 1.0, distance: 0.0)
			}

		default:
			break
		}
	}


	func jump() {
		let page = pageControl.currentPage + 1

		generator.genQA(scrollView, page: page, questions: questions)
		addAnimationAndActionToButtons(0, page: page)

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
		self.scrollView.removeFromSuperview()
		self.rightCount = 0
		self.rightOrWrong.removeAll(keepCapacity: false)

		dispatch_async(dispatch_get_main_queue()) {
			self.navigationController?.popViewControllerAnimated(true)
		}
	}


	func seeAnsweredQA() {
		let AnsweredQAVC = AnsweredQAViewController()
		AnsweredQAVC.questions = self.questions
		AnsweredQAVC.rightOrWrong = self.rightOrWrong
		presentViewController(AnsweredQAVC, animated: true, completion: nil)
	}




}

extension QuestionViewController: UIScrollViewDelegate {

	func scrollViewDidScroll(scrollView: UIScrollView) {
		let width = scrollView.bounds.size.width
		pageControl.currentPage = Int((scrollView.contentOffset.x + width/2) / width)
	}

}

