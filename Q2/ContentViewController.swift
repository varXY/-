//
//  ContentViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: UITableViewController {

	var mainTitle = ""
	var index = 0
	var knowledge = Knowledge()

	var iconsToDisplay = [[Knowledge]]()

	var searchBar = UISearchBar(frame: CGRectMake(0, 0, 0, 44))

	convenience init() {
		self.init(style: UITableViewStyle.Grouped)
	}


	override func viewDidLoad() {
		super.viewDidLoad()

		switch index {
		case 0:
			self.title = "单位公式"
			iconsToDisplay = knowledge.getAll(0)
		case 1:
			self.title = "符号图标"
			iconsToDisplay = knowledge.getAll(1)
			// tableView.separatorColor = Global.redColor()
			searchBar.placeholder = "搜索"
			searchBar.tintColor = Global.redColor()
			searchBar.delegate = self
			tableView.allowsSelection = false
			tableView.tableHeaderView = searchBar
		case 2:
			self.title = "工具设备"
			iconsToDisplay = knowledge.getAll(2)
		default:
			break
		}

		var cellNib = UINib(nibName: "DescribeCell", bundle: nil)
		tableView.registerNib(cellNib, forCellReuseIdentifier: "DescribeCell")

		cellNib = UINib(nibName: "ImageCell", bundle: nil)
		tableView.registerNib(cellNib, forCellReuseIdentifier: "ImageCell")

		cellNib = UINib(nibName: "IntroCell", bundle: nil)
		tableView.registerNib(cellNib, forCellReuseIdentifier: "IntroCell")
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = true

		tableView.layoutIfNeeded()


		let label = UILabel(frame: CGRect(x: 0, y: tableView.contentSize.height + 20, width: self.view.bounds.width, height: 20))
		label.backgroundColor = UIColor.clearColor()
		label.text = "部分内容源自网络"
		label.textColor = Global.lightRedColor()
		label.font = UIFont.systemFontOfSize(13)
		label.textAlignment = .Center
		// label.sizeToFit()
		tableView.addSubview(label)

		// self.navigationController?.delegate?.navigationController!(self.navigationController!, willShowViewController: self, animated: true)
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = true
	}

	// MARK: - TableView

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return iconsToDisplay.count
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return iconsToDisplay[section].count
	}

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		switch index {
		case 0:
			return 78
		case 1:
			return 60
		default:
			return 60
		}
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let all = iconsToDisplay[indexPath.section]
		knowledge = all[indexPath.row]

		switch index {
		case 0:
			let cell = tableView.dequeueReusableCellWithIdentifier("DescribeCell", forIndexPath: indexPath) as! DescribeCell
			cell.configureForDescribeCell(knowledge)
			return cell
		case 1:
			let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCell
			cell.configureForImageCell(knowledge)
			return cell
		default:
			let cell = tableView.dequeueReusableCellWithIdentifier("IntroCell", forIndexPath: indexPath) as! IntroCell
			cell.configureForIntroCell(knowledge)
			return cell
		}



	}

	override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		switch index {
		case 0:
			return indexPath
		case 1:
			return nil
		default:
			return indexPath
		}
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		let knowledges = iconsToDisplay[indexPath.section]
		let knowledge = knowledges[indexPath.row]
		let detailVC = DetailViewController()
		detailVC.knowledege = knowledge
		self.navigationController?.pushViewController(detailVC, animated: true)
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}

	/*
	override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30
	}
	*/

	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let icons = iconsToDisplay[section]
		return icons[0].sectionTitle
	}

}

extension ContentViewController: UISearchBarDelegate {


	func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
		tableView.separatorColor = UIColor(red: 0.783922, green: 0.780392, blue: 0.8, alpha: 1.0)
		tableView.reloadData()
		searchBar.setShowsCancelButton(true, animated: true)
		return true
	}

	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		searchBar.setShowsCancelButton(false, animated: true)
		tableView.separatorColor = UIColor(red: 0.783922, green: 0.780392, blue: 0.8, alpha: 1.0)
		iconsToDisplay = knowledge.getAll(1)
		tableView.reloadData()
	}

	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		// tableView.separatorColor = Global.redColor()
		let searchedIcons = knowledge.getSearchedIcons(searchBar.text!)

		if searchedIcons.isEmpty {
			tableView.separatorColor = UIColor.clearColor()
			let hudView = HudView.hudInView(self.view, animated: true)
			hudView.text = "无结果"

			delay(seconds: 0.5, completion: { () -> () in
				hudView.removeFromSuperview()
				self.view.userInteractionEnabled = true
			})
		}
		iconsToDisplay = searchedIcons
		tableView.reloadData()
	}
	
	
	
}
