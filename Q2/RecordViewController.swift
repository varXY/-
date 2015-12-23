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

	var beginnerRecords = [Record]()
	var intermediateRecords = [Record]()
	var global = Global()
	var generator = Generator()

	var segmentControl = UISegmentedControl()

	var scrollView = UIScrollView()
	var tableView0 = UITableView()
	var tableView1 = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()

		automaticallyAdjustsScrollViewInsets = true

		segmentControl = UISegmentedControl(items: ["初级", "中级"])
		segmentControl.frame = CGRectMake(0, 0, 140, 29)
		segmentControl.selectedSegmentIndex = 0
		segmentControl.addTarget(self, action: "segmentSelected:", forControlEvents: UIControlEvents.AllEvents)
		navigationItem.titleView = segmentControl
		self.view.backgroundColor = Global.backgroundColor()
		
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "close")
		self.navigationItem.leftBarButtonItem = quitButton

		let shareButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "share")
		self.navigationItem.rightBarButtonItem = shareButton

		scrollView.frame = view.bounds
		scrollView.contentSize = CGSize(width: view.frame.width * 2, height: 0)
		scrollView.pagingEnabled = true
		scrollView.delegate = self
		view.addSubview(scrollView)

		tableView0 = getTableView(CGRectMake(0, 0, view.frame.width, view.frame.height - 64))
		tableView1 = getTableView(CGRectMake(view.frame.width, 0, view.frame.width, view.frame.height - 64))
		scrollView.addSubview(tableView0)
		scrollView.addSubview(tableView1)

//		let shareButton = generator.genShareButton(CGPointMake(20, global.size.height - 60), tag: 160)
//		shareButton.addTarget(self, action: "share", forControlEvents: .TouchUpInside)
//		view.addSubview(shareButton)
	}



	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
//		let button = view.viewWithTag(160) as! UIButton
//
//		if beginnerRecords.count == 0 && intermediateRecords.count == 0 {
//			button.hidden = true
//			return
//		}
//
//		button.hidden = false
//		button.genAnimation(.Appear, delay: 0.5, distance: 60)
	}

	func getTableView(rect: CGRect) -> UITableView {
		let tableView = UITableView()

		tableView.frame = rect
		tableView.backgroundColor = Global.backgroundColor()
		tableView.separatorColor = Global.backgroundColor()
		tableView.allowsSelection = false
		tableView.delegate = self
		tableView.dataSource = self

		return tableView
	}

	func segmentSelected(sender: UISegmentedControl) {
		jumpToPage(sender.selectedSegmentIndex)
	}

	func jumpToPage(page: Int) {
		let duration = Double(global.size.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: -64.0)
			}, completion: nil)


	}

	

	func share() {

		tableView0.layoutIfNeeded()
		tableView1.layoutIfNeeded()

//		let indicator = UIActivityIndicatorView()
//		let indicatorItem = UIBarButtonItem(customView: indicator)
//		self.navigationItem.rightBarButtonItem = indicatorItem
//		indicator.startAnimating()


		var record = Record(record: 0, date: NSDate())

		if self.segmentControl.selectedSegmentIndex == 0 {
			record = self.beginnerRecords[0]
		} else {
			record = self.intermediateRecords[0]
		}

		let text: String = "我最近一次电工试题问答，10道题答对了\(record.record)道。"
		let link = NSURL(string: "https://itunes.apple.com/cn/app/dian-gong-zhu-shou/id1044537172?l=en&mt=8")!

		guard let navi = self.navigationController as? NavigationController else { return }
		let image = navi.captureScreen()

		let arr: [AnyObject] = [text, link, image]

		let share1 = UIActivityViewController(activityItems: arr, applicationActivities: [])
//			share1.completionWithItemsHandler = { (type:String?, complete:Bool, arr:[AnyObject]?, error:NSError?) -> Void in
//				indicator.stopAnimating()
//				let shareButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "share")
//				self.navigationItem.rightBarButtonItem = shareButton
//
//		}
		self.presentViewController(share1, animated: true, completion: nil)


	}

	func close() {
		dismissViewControllerAnimated(true, completion: nil)
	}

}

extension RecordViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch tableView {
		case tableView0:
			if beginnerRecords.count != 0 {
				return beginnerRecords.count
			} else {
				return 1
			}
		case tableView1:
			if intermediateRecords.count != 0 {
				return intermediateRecords.count
			} else {
				return 1
			}
		default:
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

		switch tableView {
		case tableView0:
			if beginnerRecords.count != 0 {
				cell?.configureForRecordCell(beginnerRecords[indexPath.row])
			} else {
				cell?.showNoRecord()
			}
		case tableView1:
			if intermediateRecords.count != 0 {
				cell?.configureForRecordCell(intermediateRecords[indexPath.row])
			} else {
				cell?.showNoRecord()
			}
		default:
			break
		}
		
		return cell!
	}

}


extension RecordViewController: UIScrollViewDelegate {

	func scrollViewDidScroll(scrollView: UIScrollView) {

		if let _ = scrollView as? UITableView {

		} else {
			let width = scrollView.bounds.size.width
			segmentControl.selectedSegmentIndex = Int((scrollView.contentOffset.x + width / 2) / width)
		}


	}
}



