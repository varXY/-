//
//  TestViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


class TestViewController: UIViewController {

	var beginnerRecords = Records(type: 0)
	var intermediateRecords = Records(type: 1)

	var generator = Generator()
	var global = Global()

	var buttons = [UIButton]()
	var littleButtons = [UIButton]()

	let defaults = NSUserDefaults.standardUserDefaults()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "电工试题"
		self.view.backgroundColor = Global.backgroundColor()

		buttons = generator.genButtonsForTest()
		for button in buttons {
			button.addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
			self.view.addSubview(button)
		}

//		let label = generator.genLabelForTest()
//		view.addSubview(label)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		let time1 = (intermediateRecords.records.count == 8 && intermediateRecords.showTimes == 1)
		let time2 = (intermediateRecords.records.count == 16 && intermediateRecords.showTimes == 2)
		let time3 = (intermediateRecords.records.count == 24 && intermediateRecords.showTimes == 3)
		let time4 = (intermediateRecords.records.count == 32 && intermediateRecords.showTimes == 4)

		if time1 || time2 || time3 || time4 {
			askForComment()
			intermediateRecords.showTimes += 1
			intermediateRecords.saveRecords()
		}

		for i in 0..<3 {
			buttons[i].hidden = false
			if i != 2 {
				buttons[i].genAnimation(.Appear, delay: 0.0, distance: 30)
			} else {
				buttons[i].genAnimation(.Appear, delay: 0.2, distance: 38)
			}
		}

	}


	func askForComment() {
		let alertVC = UIAlertController(title: "希望得到你的反馈", message: "去评分提建议或者分享一下吧！", preferredStyle: .Alert)

		let action0 = UIAlertAction(title: "评分留言", style: .Default, handler: { (action) -> Void in
			UIApplication.sharedApplication().openURL(NSURL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1044537172&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8")!)
		})

		let action1 = UIAlertAction(title: "分享", style: .Default, handler: { (_) -> Void in
			let text: String = "电工助手：电工的最爱，学习电学知识的好伙伴！"
			let link = NSURL(string: "https://itunes.apple.com/cn/app/dian-gong-zhu-shou/id1044537172?l=en&mt=8")!
			let image: UIImage = UIImage(named: "Screen Shot")!
			let arr: [AnyObject] = [text, link, image]

			let share1 = UIActivityViewController(activityItems: arr, applicationActivities: nil)
			self.presentViewController(share1, animated: true, completion: nil)
		})

		let action2 = UIAlertAction(title: "取消", style: .Default, handler: nil)

		alertVC.addAction(action0)
		alertVC.addAction(action1)
		alertVC.addAction(action2)

		self.presentViewController(alertVC, animated: true, completion: nil)
	}



	func open(sender: UIButton) {
		let index = sender.tag - 33890

		for button in buttons {
			if index == buttons.indexOf(button) {
				button.genAnimation(.Touched, delay: 0.0, distance: 0.0)
			} else {
				button.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
			}
		}

		pushOrPresent(index)
	}

	func pushOrPresent(index: Int) {
		switch index {
		case 0, 1:
			let QuestionVC = QuestionViewController()
			QuestionVC.type = index
			QuestionVC.record = {(rightCount: Int, date: NSDate) in
				let record = Record(record: rightCount, date: date)
				if index == 0 {
					self.beginnerRecords.records.insert(record, atIndex: 0)
				} else {
					self.intermediateRecords.records.insert(record, atIndex: 0)
				}
			}

			QuestionVC.hidesBottomBarWhenPushed = true

			delay(seconds: 0.5, completion: { () -> () in
				self.navigationController?.pushViewController(QuestionVC, animated: true)
			})

		case 2:
			let recordVC = RecordViewController()
			recordVC.beginnerRecords = self.beginnerRecords.records
			recordVC.intermediateRecords = self.intermediateRecords.records
			let detailNavi = NavigationController(viewController: recordVC)

			delay(seconds: 0.5, completion: { () -> () in
				self.presentViewController(detailNavi, animated: true, completion: nil)
			})

		default:
			break
		}
	}


}






