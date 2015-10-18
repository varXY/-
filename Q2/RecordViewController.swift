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

	var records = [Record]()
	var global = Global()

	var tableView = UITableView()


	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "答题纪录"
		self.view.backgroundColor = Global.backgroundColor()
		
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "close")
		self.navigationItem.rightBarButtonItem = quitButton

		tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: global.size.height)
		tableView.backgroundColor = Global.backgroundColor()
		tableView.separatorColor = Global.backgroundColor()
		tableView.allowsSelection = false
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
		if records.count != 0 {
			return records.count
		} else {
			return 1
		}
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 60
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID = "RecordCell"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? RecordCell

		if cell == nil {
			cell = RecordCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
		}

		if records.count != 0 {
			cell?.configureForRecordCell(records[indexPath.row])
		} else {
			cell?.showNoRecord()
		}
		
		return cell!
	}

}




