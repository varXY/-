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

	var record = Record()
	var global = Global()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.grayColor()
		self.navigationItem.hidesBackButton = true

		genStartButton()
		genRecordButton()

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = false

		if let startButton = view.viewWithTag(333) as? UIButton {
			startButton.genAnimation(.appear, delay: 0.0)
		}

		if let recordButton = view.viewWithTag(444) as? UIButton {
			recordButton.genAnimation(.appear, delay: 0.0)
		}
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = false
	}

	func genStartButton() {
		var buttonWidth: CGFloat = global.testBigButtonSize().width
		var buttonHeight:CGFloat = global.testBigButtonSize().height

		var startButton = UIButton.buttonWithType(.System) as! UIButton
		startButton.frame = CGRect(x: (global.size.width - buttonWidth) / 2, y: (global.size.height - buttonHeight) / 2 - 49 , width: buttonWidth, height: buttonHeight)
		startButton.layer.cornerRadius = global.testBigButtonSize().width / 2
		startButton.clipsToBounds = true
		startButton.backgroundColor = UIColor.whiteColor()
		startButton.setTitle("start", forState: .Normal)
		startButton.addTarget(self, action: "start", forControlEvents: .TouchUpInside)
		startButton.tag = 333
		self.view.addSubview(startButton)
	}

	func genRecordButton() {
		var buttonWidth: CGFloat = global.testSmallButtonSize().width
		var buttonHeight:CGFloat = global.testSmallButtonSize().height

		var recordButton = UIButton.buttonWithType(.System) as! UIButton
		recordButton.frame = CGRect(x: (global.size.width - buttonWidth) / 2, y: (global.size.height - buttonHeight) / 2 + 200, width: buttonWidth, height: buttonHeight)
		recordButton.layer.cornerRadius = global.testSmallButtonSize().width / 2
		recordButton.clipsToBounds = true
		recordButton.backgroundColor = UIColor.whiteColor()
		recordButton.setTitle("Record", forState: .Normal)
		recordButton.addTarget(self, action: "seeRecord", forControlEvents: .TouchUpInside)
		recordButton.tag = 444
		self.view.addSubview(recordButton)
	}


	func start() {
		// self.navigationItem.hidesBackButton = true
		let QuestionVC = QuestionViewController()
		QuestionVC.record = {(rightCount: Int, date: NSDate) in
			self.record.record = rightCount
			self.record.date = date
			println("testVC's recoed is" +  "\(self.record.record), date is \(self.record.date)")
		}
		self.navigationController?.pushViewController(QuestionVC, animated: true)
	}

	func seeRecord() {
		let recordVC = RecordViewController()
		recordVC.record = self.record
		self.presentViewController(recordVC, animated: true, completion: nil)
	}

}

extension TestViewController: RecordDelegate {

	func getRecord(record: Record) {
		self.record.record = record.record
		self.record.date = record.date
	}
}





