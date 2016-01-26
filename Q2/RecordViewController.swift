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
	var tableView2: SettingTableView!
	var shareButton = UIButton()

	var tapGesture: UITapGestureRecognizer!

	var segmentWay = false

	override func viewDidLoad() {
		super.viewDidLoad()

		automaticallyAdjustsScrollViewInsets = true

		segmentControl = UISegmentedControl(items: ["初级", "中级", "更多"])
		for i in 0..<3 { segmentControl.setWidth(70, forSegmentAtIndex: i) }
		segmentControl.selectedSegmentIndex = 0
//		segmentControl.addTarget(self, action: "segmentSelected:", forControlEvents: UIControlEvents.AllEvents)
        segmentControl.addTarget(self, action: "test:", forControlEvents: UIControlEvents.ValueChanged)
		navigationItem.titleView = segmentControl
		self.view.backgroundColor = Global.backgroundColor()
		
		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "close")
		self.navigationItem.rightBarButtonItem = quitButton

		scrollView.frame = view.bounds
		scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 0)
		scrollView.pagingEnabled = true
		scrollView.delegate = self
		view.addSubview(scrollView)

		tableView0 = getTableView(CGRectMake(0, 0, view.frame.width, view.frame.height - 64))
		scrollView.addSubview(tableView0)

		tableView1 = getTableView(CGRectMake(view.frame.width, 0, view.frame.width, view.frame.height - 64))
		scrollView.addSubview(tableView1)

		tableView2 = SettingTableView(frame: CGRectMake(view.frame.width * 2, 0, view.frame.width, view.frame.height - 64), style: .Grouped)
		tableView2.sendMail = { (controller) -> Void in
			self.presentViewController(controller, animated: true, completion: nil)
		}
		tableView2.doneWithMail = { (controller) -> Void in
			controller.dismissViewControllerAnimated(true, completion: nil)
		}
		scrollView.addSubview(tableView2)

		shareButton = generator.genShareButton(CGPointMake(20, global.size.height - 64), tag: 160)
		shareButton.addTarget(self, action: "share", forControlEvents: .TouchUpInside)
		view.addSubview(shareButton)

		tapGesture = UITapGestureRecognizer(target: self, action: "tapped")
        tapGesture.delegate = self

	}



	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		if self.segmentControl.selectedSegmentIndex == 2 {
			self.checkRecordsCountForShareButton(self.segmentControl.selectedSegmentIndex)
		} else {
			delay(seconds: 0.5) { () -> () in
				self.checkRecordsCountForShareButton(self.segmentControl.selectedSegmentIndex)
			}
		}

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
    
    func test(sender: UISegmentedControl) {
        segmentWay = true
        jumpToPage(sender.selectedSegmentIndex)
    }

//	func segmentSelected(sender: UISegmentedControl) {
//		segmentWay = true
//		jumpToPage(sender.selectedSegmentIndex)
//	}

	func checkRecordsCountForShareButton(index: Int) {

		self.view.addGestureRecognizer(tapGesture)
		let records = index == 0 ? beginnerRecords : intermediateRecords
		shareButton.enabled = records.count != 0

		if index == 2 {
			self.view.removeGestureRecognizer(tapGesture)
			shareButton.enabled = false
		}

		hideOrShowShareButton()
	}

	func jumpToPage(page: Int) {
		let duration = Double(global.size.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: nil)

		delay(seconds: duration) { () -> () in
			self.checkRecordsCountForShareButton(page)
			self.segmentWay = false
		}

	}

	func hideOrShowShareButton() {
		let hidden = shareButton.frame.origin == CGPointMake(20, global.size.height - 64)
		if hidden && shareButton.enabled == true {
			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.shareButton.transform = CGAffineTransformMakeTranslation(0.0, -60)
			})
		}

		if !hidden && shareButton.enabled == false {
			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.shareButton.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
			})
		}

	}

	func tapped() {
		if shareButton.enabled == true {
			let hidden = shareButton.frame.origin == CGPointMake(20, global.size.height - 64)
			let distance: CGFloat = hidden ? -60 : 0.0
			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.shareButton.transform = CGAffineTransformMakeTranslation(0.0, distance)
			})
		}
	}

	

	func share() {

		UIView.animateWithDuration(0.5) { () -> Void in
			self.shareButton.transform = CGAffineTransformMakeTranslation(0.0, 60)
		}


		delay(seconds: 0.5) { () -> () in
			self.shareContent()
		}

	}

	func shareContent() {
		let record = segmentControl.selectedSegmentIndex == 0 ? beginnerRecords[0] : intermediateRecords[0]

		let text: String = "我最近一次电工试题问答，10道题答对了\(record.record)道。"
		let link = NSURL(string: "https://itunes.apple.com/cn/app/dian-gong-zhu-shou/id1044537172?l=en&mt=8")!

		guard let navi = self.navigationController as? NavigationController else { return }
		let image = navi.captureScreen()

		let arr: [AnyObject] = [text, link, image]

		let share1 = UIActivityViewController(activityItems: arr, applicationActivities: [])
		share1.completionWithItemsHandler = { (type:String?, complete:Bool, arr:[AnyObject]?, error:NSError?) -> Void in

			delay(seconds: 0.0, completion: { () -> () in
				UIView.animateWithDuration(0.5) { () -> Void in
					self.shareButton.transform = CGAffineTransformMakeTranslation(0.0, -60)
				}
			})


		}
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
		if scrollView == self.scrollView && segmentWay == false {
			
			if scrollView.contentOffset.x == 0 {
				segmentControl.selectedSegmentIndex = 0
				checkRecordsCountForShareButton(segmentControl.selectedSegmentIndex)
			}

			if scrollView.contentOffset.x == scrollView.bounds.size.width {
				segmentControl.selectedSegmentIndex = 1
				checkRecordsCountForShareButton(segmentControl.selectedSegmentIndex)

			}

			if scrollView.contentOffset.x == scrollView.bounds.size.width * 2 {
				segmentControl.selectedSegmentIndex = 2
				checkRecordsCountForShareButton(segmentControl.selectedSegmentIndex)

			}
		}
	}

}


extension RecordViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if ((touch.view?.isKindOfClass(UISegmentedControl)) != nil) {
            return false
        } else {
            return true
        }
    }
}

