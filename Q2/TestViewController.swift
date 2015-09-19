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

	var records = Records()
	var generator = Generator()
	var global = Global()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.grayColor()
		self.navigationItem.hidesBackButton = true

		let startButton = generator.genStartButtonForTest()
		startButton.addTarget(self, action: "start", forControlEvents: .TouchUpInside)
		view.addSubview(startButton)

		let recordButton = generator.genRecordButtonForTest()
		recordButton.addTarget(self, action: "seeRecord", forControlEvents: .TouchUpInside)
		view.addSubview(recordButton)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = false

		if let startButton = view.viewWithTag(333) as? UIButton {
			startButton.genAnimation(.Appear, delay: 0.0, distance: 30)
		}

		if let recordButton = view.viewWithTag(444) as? UIButton {
			recordButton.genAnimation(.Appear, delay: 0.1, distance: 70)
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

	func start() {
		// self.navigationItem.hidesBackButton = true
		let QuestionVC = QuestionViewController()
		QuestionVC.record = {(rightCount: Int, date: NSDate) in
			let record = Record(record: rightCount, date: date)
			self.records.records.insert(record, atIndex: 0)
		}
		self.navigationController?.pushViewController(QuestionVC, animated: true)
	}

	func seeRecord() {
		let recordVC = RecordViewController()
		recordVC.records = self.records.records
		self.presentViewController(recordVC, animated: true, completion: nil)
	}

}






