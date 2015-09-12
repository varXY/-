//
//  RecordViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class RecordViewController: UIViewController {
	var tableView = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()

		var titleView = UIView()
		titleView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 64)
		titleView.backgroundColor = UIColor.purpleColor()
		view.addSubview(titleView)

		var backButton = UIButton(frame: CGRect(x: 5, y: 25, width: 30, height: 30))
		backButton.backgroundColor = UIColor.blackColor()
		backButton.addTarget(self, action: "close", forControlEvents: .TouchUpInside)
		titleView.addSubview(backButton)

		tableView.frame = CGRect(x: 0, y: 64, width: view.frame.width, height: view.bounds.height - 64)
		tableView.backgroundColor = UIColor.yellowColor()
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
	}

	func close() {
		dismissViewControllerAnimated(true, completion: nil)
	}
}

extension RecordViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 60
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID = "cellID"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? RecordCell

		if cell == nil {
			cell = RecordCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
		}
		return cell!
	}
}




