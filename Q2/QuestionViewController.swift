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

protocol RecordDelegate {
	func getRecord(record: Record)
}

class QuestionViewController: UIViewController {
	var scrollView = UIScrollView()
	var pageControl = UIPageControl()

	var questions = [Question]()

	override func viewDidLoad() {
		super.viewDidLoad()

		let question = Question()
		questions = question.getQestions(4)

		self.view.backgroundColor = UIColor.whiteColor()
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "quit")
		quitButton.tintColor = UIColor.redColor()
		self.navigationItem.rightBarButtonItem = quitButton
		self.navigationItem.leftBarButtonItem = quitButton
		// self.navigationController?.navigationItem.leftBarButtonItem = nil

		scrollView.frame = view.bounds
		scrollView.delegate = self
		scrollView.backgroundColor = UIColor.grayColor()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		scrollView.contentSize = CGSize(width: self.view.bounds.width * 10, height: self.view.bounds.height)
		// scrollView.bounces = false
		view.addSubview(scrollView)

		pageControl.frame = CGRect(x: 0, y: 520, width: 320, height: 30)
		pageControl.numberOfPages = 10
		pageControl.currentPage = 0
		pageControl.userInteractionEnabled = false
		view.addSubview(pageControl)

		genQA(0)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
	}


	func genQA(page: Int) {

		var label = UILabel()
		label.frame = CGRect(x: 10 + view.bounds.width * CGFloat(page), y: 10, width: 300, height: 200)
		label.numberOfLines = 0
		label.backgroundColor = UIColor.whiteColor()
		label.text = questions[page].question
		scrollView.addSubview(label)

		var button1 = UIButton.buttonWithType(.Custom) as! UIButton
		button1.frame = CGRect(x: 10 + view.bounds.width * CGFloat(page), y: 300, width: 300, height: 60)
		button1.backgroundColor = UIColor.blueColor()
		button1.setTitle(questions[page].rightAnswer, forState: .Normal)
		button1.tag = page * 2 + 1000
		button1.addTarget(self, action: Selector("chosen:"), forControlEvents: .TouchUpInside)
		scrollView.addSubview(button1)

		var button2 = UIButton.buttonWithType(.Custom) as! UIButton
		button2.frame = CGRect(x: 10 + view.bounds.width * CGFloat(page), y: 400, width: 300, height: 60)
		button2.backgroundColor = UIColor.blueColor()
		button2.setTitle(questions[page].wrongAnswer, forState: .Normal)
		button2.tag = page * 2 + 1001
		button2.addTarget(self, action: Selector("chosen:"), forControlEvents: .TouchUpInside)
		scrollView.addSubview(button2)

		let ramdom = arc4random_uniform(2)
		if ramdom == 0 {
			button1.setTitle(questions[page].rightAnswer, forState: .Normal)
			button2.setTitle(questions[page].wrongAnswer, forState: .Normal)
		} else {
			button1.setTitle(questions[page].wrongAnswer, forState: .Normal)
			button2.setTitle(questions[page].rightAnswer, forState: .Normal)
		}
	}

	func genJumpButton() {
		var buttonWidth: CGFloat = 100
		var buttonHeight:CGFloat = 100
		var x = scrollView.bounds.width * CGFloat(pageControl.currentPage) + scrollView.center.x - buttonWidth / 2
		var y = scrollView.center.x - buttonWidth / 2

		var jumpButton = UIButton.buttonWithType(.System) as! UIButton
		jumpButton.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
		jumpButton.layer.cornerRadius = 50
		jumpButton.clipsToBounds = true
		jumpButton.backgroundColor = UIColor.whiteColor()
		jumpButton.setTitle("Next", forState: .Normal)
		jumpButton.tag = pageControl.currentPage + 2000
		jumpButton.addTarget(self, action: "jump", forControlEvents: .TouchUpInside)
		scrollView.addSubview(jumpButton)
	}

	func jump() {
		let page = pageControl.currentPage + 1
		genQA(page)
		jumpToPage(page)
	}

	func chosen(sender: UIButton) {
		println(sender.tag)
		println(sender.titleLabel?.text)
		if sender.titleLabel?.text == questions[pageControl.currentPage].rightAnswer {
			AudioServicesPlaySystemSound(1008)
			genJumpButton()
		} else {
			AudioServicesPlaySystemSound(1053)
			// AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
		}
	}

	func jumpToPage(page: Int) {

		UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: -64.0)
			}, completion: nil)
		println(self.scrollView.contentOffset)
	}

	func quit() {

		self.scrollView.removeFromSuperview()

		dispatch_async(dispatch_get_main_queue()) {
			self.navigationController?.popViewControllerAnimated(true)
		}
		
	}
}

extension QuestionViewController: UIScrollViewDelegate {

	func scrollViewDidScroll(scrollView: UIScrollView) {
		let width = scrollView.bounds.size.width
		pageControl.currentPage = Int((scrollView.contentOffset.x + width/2) / width)
		println(Int((scrollView.contentOffset.x + width/2) / width))
	}

}

