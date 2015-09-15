//
//  EquationViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class EquationViewController: UIViewController {

	var index = 0
	var tableView = UITableView()
	var global = Global()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.lightGrayColor()

		let rect = CGRect(x: 0, y: -20, width: global.size.width, height: global.size.height / 1.6)
		tableView = UITableView(frame: rect, style: .Grouped)
		tableView.backgroundColor = UIColor.lightGrayColor()
		tableView.scrollEnabled = false
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)
	}

}


extension EquationViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 44
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID = "EquationCell"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? EquationCell

		if cell == nil {
			cell = EquationCell(style: .Default, reuseIdentifier: cellID)
		}
		cell!.configureForEquationCell()
		return cell!
	}

	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "电压U，电流I，电阻R"
	}
}


