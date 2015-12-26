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

	var questions = [Question]()
	var global = Global()
	var generator = Generator()
	var rightOrWrong = [Int]()

	var tableView = UITableView()


	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "题目及答案"
		self.view.backgroundColor = Global.backgroundColor()
		
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "close")
		self.navigationItem.rightBarButtonItem = quitButton

		tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 64)
		tableView.allowsSelection = false
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
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
		return label.frame.height + 45
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

