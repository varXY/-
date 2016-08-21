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

	var record: ((rightCount: Int, date: Date) -> Void)?

	var beginnerRecords: Records!
	var intermediateRecords: Records!
	var advancedRecords: Records!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "1/10"
		view.backgroundColor = UIColor.white
		fd_interactivePopDisabled = true

		questions = Question().getQestions(10, type: type)

		let quitButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(confirmToQuit))
		quitButton.tintColor = UIColor.white
		navigationItem.rightBarButtonItem = quitButton
		navigationItem.setHidesBackButton(true, animated: true)

		scrollView.frame = view.bounds
		scrollView.backgroundColor = UIColor.backgroundColor()
		scrollView.isPagingEnabled = true
		scrollView.isScrollEnabled = false
		scrollView.contentSize = CGSize(width: self.view.bounds.width * 10, height: self.view.bounds.height)
		view.addSubview(scrollView)

		dotView = viewGenerator.genDots()
		let firstDot = dotView.subviews[0]
		firstDot.backgroundColor = UIColor.lightGray
		view.addSubview(dotView)

		viewGenerator.genQA(scrollView, page: 0, questions: questions)
		addActionToButtons(0, page: 0)

		prepareAudios()

	}

	func chosen(_ sender: UIButton) {
		getResult(sender)
		disableAndColorButtons(sender)
		currentPage += 1
		currentPage == 10 ? testIsOver() : genJumpButton()
	}

	func getResult(_ sender: UIButton) {

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

	func disableAndColorButtons(_ sender: UIButton) {
		let rightAnswer = questions[currentPage].rightAnswer
		let tags = [sender.tag - 1, sender.tag, sender.tag + 1]

		for tag in tags {

			if let button = scrollView.viewWithTag(tag) as? UIButton {

				if button.titleLabel?.text == rightAnswer {
					button.isUserInteractionEnabled = false
					button.genAnimation(.isRightAnswer, delayTime: 0.0, distance: 0.0)
					button.tintColor = UIColor.white
					button.backgroundColor = UIColor.rightGreen()
				} else {
					button.isEnabled = false
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
		record?(rightCount: rightCount, date: Date())

		delay(seconds: 1.5, completion: { () -> () in
			UIView.animate(withDuration: 0.8, animations: { () -> Void in
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
				let index = finalViews.buttons.index(of: $0)!
				$0.genAnimation(.appear, delayTime: 0.1 * Double(index) , distance: 40 + 30 * CGFloat(index))

				$0.addTarget(self, action: #selector(self.touchDown(_:)), for: .touchDown)
				$0.addTarget(self, action: #selector(self.touchUpOutSide(_:)), for: .touchUpOutside)
				$0.addTarget(self, action: #selector(self.touchUpInside(_:)), for: .touchUpInside)
			})

		})

	}

	func touchDown(_ sender: UIButton) {
		UIView.perform(.delete, on: [], options: [], animations: { 
			sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
			}) { (_) in
		}
	}

	func touchUpOutSide(_ sender: UIButton) {
		UIView.perform(.delete, on: [], options: [], animations: {
			sender.transform = CGAffineTransform.identity
		}) { (_) in
		}
	}

	func touchUpInside(_ sender: UIButton) {
		UIView.perform(.delete, on: [], options: [], animations: {
			sender.transform = CGAffineTransform.identity
		}) { (_) in
			switch (sender.titleLabel?.text)! {
			case "查看题目":
				let answeredQAVC = AnsweredQAViewController()
				answeredQAVC.questions = self.questions
				answeredQAVC.rightOrWrong = self.rightOrWrong
				self.present(NavigationController(viewController: answeredQAVC), animated: true, completion: nil)
			case "答题记录":
				let recordVC = RecordViewController()
				recordVC.beginnerRecords = self.beginnerRecords.records
				recordVC.intermediateRecords = self.intermediateRecords.records
				recordVC.advancedRecords = self.advancedRecords.records
				recordVC.type = self.type
				self.present(NavigationController(viewController: recordVC), animated: true, completion: nil)
			case "返回主页":
				self.quit()
			default:
				break
			}
		}
	}

	func showRightOrWrongView(_ rightOrWrong: String) {
		let view = viewGenerator.genRightOrWrongViewForQA(rightOrWrong, page: currentPage)
		scrollView.addSubview(view)

		delay(seconds: 1.0) {
			view.alpha = 0.0
			view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
			view.frame.origin.y += 30
			self.fakeButton = view
		}

		if currentPage != 9 {

			delay(seconds: 2.0) {
				UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
					view.backgroundColor = UIColor(patternImage: UIImage(named: "下一题")!)
					view.alpha = 1.0
					view.frame.origin.y -= 30
					view.addShadow()
					}, completion: nil)
			}

		}

	}

	func addActionToButtons(_ kind: Int, page: Int) {

		switch kind {
		case 0:
			if let button = scrollView.viewWithTag(page * 2 + 1000) as? UIButton {
				button.addTarget(self, action: #selector(chosen(_:)), for: .touchUpInside)
			}

			if let button = scrollView.viewWithTag(page * 2 + 1001) as? UIButton {
				button.addTarget(self, action: #selector(chosen(_:)), for: .touchUpInside)
			}

		case 1:
			if let button = scrollView.viewWithTag(page + 2333) as? UIButton {
				button.addTarget(self, action: #selector(jump), for: .touchUpInside)
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
			dot.backgroundColor = UIColor.lightGray
		}

		title = "\(currentPage + 1)/10"

	}


	func jumpToPage(_ page: Int) {
//
//		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: { 
//			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
//			}, completion: nil)

		let duration = Double(ScreenWidth / 640)

		UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: nil)

	}


	func quit() {
		let _ = navigationController?.popViewController(animated: true)
	}

	func confirmToQuit() {

		if currentPage != 0 && currentPage != 10 {
			let alert = UIAlertController(title: "提示", message: "答题还没完成，确定退出吗？", preferredStyle: .alert)

			let action = UIAlertAction(title: "确定", style: .default, handler: ({ _ in self.quit() }))
			let action1 = UIAlertAction(title: "取消", style: .default, handler: nil)

			alert.addAction(action)
			alert.addAction(action1)

			present(alert, animated: true, completion: nil)
		} else {
			self.quit()
		}

	}

	// MARK: - Sound Effect

	func prepareAudios() {
		let sound_0 = URL(fileURLWithPath: Bundle.main.path(forResource: "right", ofType: "caf")!)
		try! rightSound = AVAudioPlayer(contentsOf: sound_0)
		let sound_1 = URL(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "caf")!)
		try! wrongSound = AVAudioPlayer(contentsOf: sound_1)
	}


}


