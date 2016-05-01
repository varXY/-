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
	var advancedRecords = [Record]()

	var type: Int!

	var scrollView = UIScrollView()
	var tableView0 = UITableView()
	var tableView1 = UITableView()
	var tableView2 = UITableView()

	var segmentControl = UISegmentedControl()
	var segmentWay = false

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.backgroundColor()
		automaticallyAdjustsScrollViewInsets = true

		segmentControl = UISegmentedControl(items: ["初级", "中级", "高级"])
		for i in 0..<3 { segmentControl.setWidth(70, forSegmentAtIndex: i) }
		segmentControl.selectedSegmentIndex = type
        segmentControl.addTarget(self, action: #selector(segmentSelected(_:)), forControlEvents: UIControlEvents.ValueChanged)
		navigationItem.titleView = segmentControl

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(close))
		navigationItem.rightBarButtonItem = quitButton

		scrollView.frame = view.bounds
		scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 0)
		scrollView.pagingEnabled = true
		scrollView.delegate = self
		scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width * CGFloat(type), y: 0.0)
		view.addSubview(scrollView)

		tableView0 = getTableView(CGRectMake(0, 0, view.frame.width, view.frame.height - 64))
		scrollView.addSubview(tableView0)

		tableView1 = getTableView(CGRectMake(view.frame.width, 0, view.frame.width, view.frame.height - 64))
		scrollView.addSubview(tableView1)

		tableView2 = getTableView(CGRectMake(view.frame.width * 2, 0, view.frame.width, view.frame.height - 64))
		scrollView.addSubview(tableView2)

	}

	func getTableView(rect: CGRect) -> UITableView {
		let tableView = UITableView()
		tableView.frame = rect
		tableView.backgroundColor = UIColor.backgroundColor()
		tableView.separatorStyle = .None
		tableView.allowsSelection = false
		tableView.delegate = self
		tableView.dataSource = self

		let footer = UIView(frame: CGRectMake(0, 0, view.frame.width, 5))
		footer.backgroundColor = UIColor.clearColor()
		tableView.tableFooterView = footer

		return tableView
	}
    
    func segmentSelected(sender: UISegmentedControl) {
        segmentWay = true
        jumpToPage(sender.selectedSegmentIndex)
    }

	func jumpToPage(page: Int) {
//		let duration = Double(ScreenWidth / 640)

		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: { 
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}) { (_) in
				self.segmentWay = false
		}

//		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
//			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
//			}, completion: { (_) in
//				self.segmentWay = false
//			})

	}

	func close() {
		dismissViewControllerAnimated(true, completion: nil)
	}

}

extension RecordViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch tableView {
		case tableView0:
			return beginnerRecords.count != 0 ? beginnerRecords.count : 1
		case tableView1:
			return intermediateRecords.count != 0 ? intermediateRecords.count : 1
		case tableView2:
			return advancedRecords.count != 0 ? advancedRecords.count : 1
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
		if cell == nil { cell = RecordCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID) }

		switch tableView {
		case tableView0:
			beginnerRecords.count != 0 ? cell?.configureForRecordCell(beginnerRecords[indexPath.row]) : cell?.showNoRecord()
		case tableView1:
			intermediateRecords.count != 0 ? cell?.configureForRecordCell(intermediateRecords[indexPath.row]) : cell?.showNoRecord()
		case tableView2:
			advancedRecords.count != 0 ? cell?.configureForRecordCell(advancedRecords[indexPath.row]) : cell?.showNoRecord()
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
			}

			if scrollView.contentOffset.x == scrollView.bounds.size.width {
				segmentControl.selectedSegmentIndex = 1
			}

			if scrollView.contentOffset.x == scrollView.bounds.size.width * 2 {
				segmentControl.selectedSegmentIndex = 2
			}

		}
	}

}


