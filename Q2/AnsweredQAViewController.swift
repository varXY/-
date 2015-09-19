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
	var generator = Generator()

	override func viewDidLoad() {
		super.viewDidLoad()

		let titleView = UIView()
		titleView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 64)
		titleView.backgroundColor = UIColor.purpleColor()
		view.addSubview(titleView)

		let backButton = UIButton(frame: CGRect(x: global.size.width - 40, y: 30, width: 30, height: 30))
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
		let label = generator.genQLabelForAnsweredCell(questions[indexPath.row])
		return label.frame.height + 60
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID = "AnsweredQACell"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? AnsweredQACell

		if cell == nil {
			cell = AnsweredQACell(style: .Default, reuseIdentifier: cellID)
		}

		let label = generator.genQLabelForAnsweredCell(questions[indexPath.row])
		let rightOrWrong = self.rightOrWrong[indexPath.row]
		let rowForShow = indexPath.row + 1
		let rightAnswer = questions[indexPath.row].rightAnswer

		cell?.configureForAnsweredQACell(label, rightOrWrong: rightOrWrong, row: rowForShow, rightAnswer: rightAnswer)
		return cell!
	}
}

