//
//  AnsweredQAViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/13.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class AnsweredQAViewController: UIViewController {
	var tableView = UITableView()
	var questions = [Question]()
	var rightOrWrong = [Int]()
	var global = Global()

	var dismissed: (() -> Void)?

	override func viewDidLoad() {
		super.viewDidLoad()

		var titleView = UIView()
		titleView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 64)
		titleView.backgroundColor = UIColor.purpleColor()
		view.addSubview(titleView)

		var backButton = UIButton(frame: CGRect(x: 270, y: 25, width: 30, height: 30))
		backButton.backgroundColor = UIColor.blackColor()
		backButton.addTarget(self, action: "close", forControlEvents: .TouchUpInside)
		titleView.addSubview(backButton)

		tableView.frame = CGRect(x: 0, y: 64, width: view.frame.width, height: view.bounds.height - 64)
		tableView.backgroundColor = UIColor.yellowColor()
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = true
	}

	func close() {
		self.dismissViewControllerAnimated(true, completion: nil)

	}

	
}

extension AnsweredQAViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let question = questions[indexPath.row]
		var count = 0

		for i in question.question {
			count += 1
		}

		let room = global.size.width / CGFloat(count)
		println(room)

		var high: CGFloat = 0

		if room > 18.0 {
			high = 52
		}

		if room < 18 && room > 9 {
			high = 74
		}

		if room < 9 {
			high = 96
		}
		
		return high
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID = "AnsweredQACell"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? AnsweredQACell

		if cell == nil {
			cell = AnsweredQACell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
		}
		let question = questions[indexPath.row]
		let rightOrWrong = self.rightOrWrong[indexPath.row]
		cell?.configrueForAnsweredQACell(question, rightOrWrong: rightOrWrong)
		return cell!
	}
}

