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
	var generator = Generator()

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

		let shareButton = generator.genShareButton(CGPointMake(20, global.size.height - 60), tag: 160)
		shareButton.addTarget(self, action: "share", forControlEvents: .TouchUpInside)
		view.addSubview(shareButton)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		let button = view.viewWithTag(160) as! UIButton

		if records.count == 0 {
			button.hidden = true
			return
		}

		button.hidden = false
		button.genAnimation(.Appear, delay: 0.5, distance: 60)
	}

	func share() {

		tableView.layoutIfNeeded()

		let button = view.viewWithTag(160) as! UIButton
		UIView.animateWithDuration(0.3) { () -> Void in
			button.transform = CGAffineTransformMakeTranslation(0.0, 60)
		}

		delay(seconds: 0.3) { () -> () in
			let text: String = "我最近一次电工试题问答，10道题答对了\(self.records[0].record)道。"
			let link = NSURL(string: "https://itunes.apple.com/cn/app/dian-gong-zhu-shou/id1044537172?l=en&mt=8")!

			guard let navi = self.navigationController as? NavigationController else { return }
			let image = navi.captureScreen()

			let arr: [AnyObject] = [text, link, image]

			let share1 = UIActivityViewController(activityItems: arr, applicationActivities: [])
			share1.completionWithItemsHandler = { (type:String?, complete:Bool, arr:[AnyObject]?, error:NSError?) -> Void in
				let button = self.view.viewWithTag(160) as! UIButton
				delay(seconds: 0.0, completion: { () -> () in
					UIView.animateWithDuration(0.5) { () -> Void in
						button.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
					}
				})

			}
			self.presentViewController(share1, animated: true, completion: nil)
		}

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




