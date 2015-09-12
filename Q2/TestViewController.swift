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

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.grayColor()
		self.navigationItem.hidesBackButton = true

		genStartButton()
		genRecordButton()

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
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
		var buttonWidth: CGFloat = 150
		var buttonHeight:CGFloat = 150

		var startButton = UIButton.buttonWithType(.System) as! UIButton
		startButton.frame = CGRect(x: self.view.center.x - buttonWidth / 2, y: self.view.center.y - buttonHeight / 2 - 49, width: buttonWidth, height: buttonHeight)
		startButton.layer.cornerRadius = 75
		startButton.clipsToBounds = true
		startButton.backgroundColor = UIColor.whiteColor()
		startButton.setTitle("start", forState: .Normal)
		startButton.addTarget(self, action: "start", forControlEvents: .TouchUpInside)
		self.view.addSubview(startButton)
	}

	func genRecordButton() {
		var buttonWidth: CGFloat = 100
		var buttonHeight:CGFloat = 100

		var recordButton = UIButton.buttonWithType(.System) as! UIButton
		recordButton.frame = CGRect(x: self.view.center.x - buttonWidth / 2, y: self.view.center.y - buttonHeight / 2 - 49 + 200, width: buttonWidth, height: buttonHeight)
		recordButton.layer.cornerRadius = 50
		recordButton.clipsToBounds = true
		recordButton.backgroundColor = UIColor.whiteColor()
		recordButton.setTitle("Record", forState: .Normal)
		recordButton.addTarget(self, action: "seeRecord", forControlEvents: .TouchUpInside)
		self.view.addSubview(recordButton)
	}


	func start() {
		// self.navigationItem.hidesBackButton = true
		self.navigationController?.pushViewController(QuestionViewController(), animated: true)
	}

	func seeRecord() {
		self.presentViewController(RecordViewController(), animated: true, completion: nil)
	}

}

extension TestViewController: RecordDelegate {

	func getRecord(record: Record) {
		self.record.record = record.record
		self.record.date = record.date
	}
}





