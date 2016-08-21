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
		for i in 0..<3 { segmentControl.setWidth(70, forSegmentAt: i) }
		segmentControl.selectedSegmentIndex = type
        segmentControl.addTarget(self, action: #selector(segmentSelected(_:)), for: UIControlEvents.valueChanged)
		navigationItem.titleView = segmentControl

		let quitButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
		navigationItem.rightBarButtonItem = quitButton

		scrollView.frame = view.bounds
		scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 0)
		scrollView.isPagingEnabled = true
		scrollView.delegate = self
		scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width * CGFloat(type), y: 0.0)
		view.addSubview(scrollView)

		tableView0 = getTableView(CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 64))
		scrollView.addSubview(tableView0)

		tableView1 = getTableView(CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: view.frame.height - 64))
		scrollView.addSubview(tableView1)

		tableView2 = getTableView(CGRect(x: view.frame.width * 2, y: 0, width: view.frame.width, height: view.frame.height - 64))
		scrollView.addSubview(tableView2)

	}

	func getTableView(_ rect: CGRect) -> UITableView {
		let tableView = UITableView()
		tableView.frame = rect
		tableView.backgroundColor = UIColor.backgroundColor()
		tableView.separatorStyle = .none
		tableView.allowsSelection = false
		tableView.delegate = self
		tableView.dataSource = self

		let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 5))
		footer.backgroundColor = UIColor.clear
		tableView.tableFooterView = footer

		return tableView
	}
    
    func segmentSelected(_ sender: UISegmentedControl) {
        segmentWay = true
        jumpToPage(sender.selectedSegmentIndex)
    }

	func jumpToPage(_ page: Int) {
//		let duration = Double(ScreenWidth / 640)

		UIView.perform(.delete, on: [], options: [], animations: { 
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
		dismiss(animated: true, completion: nil)
	}

}

extension RecordViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellID = "RecordCell"
		var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? RecordCell
		if cell == nil { cell = RecordCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID) }

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

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
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


