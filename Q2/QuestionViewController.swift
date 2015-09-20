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
		delay(seconds: 0.2) { () -> () in
			self.genJumpButton(sender)
		}
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
		let rightAnswer = questions[pageControl.currentPage].rightAnswer
		let tags = [sender.tag - 1, sender.tag, sender.tag + 1]

		for tag in tags {

			if let button = scrollView.viewWithTag(tag) as? UIButton {

				if button.titleLabel?.text == rightAnswer {
					button.userInteractionEnabled = false
					button.genAnimation(.IsRightAnswer, delay: 0.0, distance: 0.0)
					button.tintColor = UIColor.whiteColor()
					button.layer.borderColor = global.CGGreenColor
					button.backgroundColor = UIColor.greenColor()
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

				finalView.tag = 9999999
				self.view.addSubview(finalView)
			})
			
			
		}
	}

	func showRightOrWrongView(rightOrWrong: String) {
		let view = generator.genRightOrWrongViewForQA(rightOrWrong, page: pageControl.currentPage)
		scrollView.addSubview(view)

		delay(seconds: 0.4) { () -> () in
			view.transform = CGAffineTransformMakeScale(0.0, 0.0)
			view.hidden = true
		}

		delay(seconds: 0.8) { () -> () in
			UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				view.backgroundColor = UIColor.greenColor()
				view.hidden = false
				view.transform = CGAffineTransformMakeScale(1.0, 1.0)
				}, completion: nil)

		}

		scrollView.bringSubviewToFront(view)
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
		self.navigationController?.popViewControllerAnimated(true)
	}

	func confirmToQuit() {

		if self.view.viewWithTag(9999999) == nil {
			let alert = UIAlertController(title: "提示", message: "答题还没完成，确定退出吗？", preferredStyle: .Alert)

			let action = UIAlertAction(title: "确定", style: .Destructive, handler: ({ _ in self.quit() }))
			alert.addAction(action)

			let action1 = UIAlertAction(title: "取消", style: .Destructive, handler: nil)
			alert.view.tintColor = UIColor.redColor()
			alert.addAction(action1)

			presentViewController(alert, animated: true, completion: nil)
		} else {
			self.quit()
		}

	}


	func seeAnsweredQA() {
		
		let AnsweredQAVC = AnsweredQAViewController()
		AnsweredQAVC.questions = self.questions
		AnsweredQAVC.rightOrWrong = self.rightOrWrong

		let detailNV = DetailNavigationController(rootViewController: AnsweredQAVC)
		detailNV.toolbarHidden = true

		presentViewController(detailNV, animated: true, completion: nil)
	}




}

extension QuestionViewController: UIScrollViewDelegate {

	func scrollViewDidScroll(scrollView: UIScrollView) {
		let width = scrollView.bounds.size.width
		pageControl.currentPage = Int((scrollView.contentOffset.x + width/2) / width)
	}

}

