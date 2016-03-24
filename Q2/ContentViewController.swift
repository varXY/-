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

	convenience init() {
		self.init(style: UITableViewStyle.Grouped)
	}


	var index = 0

	var knowledge = Knowledge()
	var knowledges = [[Knowledge]]()

	var searchBar = UISearchBar(frame: CGRectMake(0, 0, 0, 44))

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

	override func viewDidLoad() {
		super.viewDidLoad()

		if traitCollection.forceTouchCapability == .Available && index != 1 {
			registerForPreviewingWithDelegate(self, sourceView: view)
		}

		tableView.backgroundColor = UIColor.backgroundColor()

		switch index {
		case 0:
			self.title = "单位公式"
			knowledges = knowledge.getAll(0)
		case 1:
			self.title = "符号图标"
			knowledges = knowledge.getAll(1)

			tableView.allowsSelection = false

			searchBar.placeholder = "搜索"
			searchBar.tintColor = UIColor.themeRed()
			searchBar.delegate = self
			tableView.tableHeaderView = searchBar
            tableView.contentOffset.y = searchBar.frame.height
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToCancel))
            view.addGestureRecognizer(tapGesture)
            
		case 2:
			self.title = "工具设备"
			knowledges = knowledge.getAll(2)
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

	func back() {
		self.navigationController?.popViewControllerAnimated(true)
	}
    
    func tapToCancel() {
        self.searchBarCancelButtonClicked(self.searchBar)
        self.searchBar.text = nil
    }



	// MARK: - TableView

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return knowledges.count
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return knowledges[section].count
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

		let all = knowledges[indexPath.section]
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

		let knowledges = self.knowledges[indexPath.section]
		let knowledge = knowledges[indexPath.row]
		let detailVC = DetailViewController()
		detailVC.knowledege = knowledge
		detailVC.hidesBottomBarWhenPushed = true
		self.navigationController?.pushViewController(detailVC, animated: true)
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}

	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let icons = knowledges[section]
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
		knowledges = knowledge.getAll(1)
		tableView.reloadData()
	}

	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		searchBar.resignFirstResponder()

		let searchedIcons = knowledge.getSearchedAll(searchBar.text!)
		if searchedIcons.isEmpty {
			tableView.separatorColor = UIColor.clearColor()
			let hudView = HudView.hudInView(self.view, animated: true)
			hudView.text = "无结果"

			delay(seconds: 0.7, completion: { () -> () in
				hudView.removeFromSuperview()
				self.view.userInteractionEnabled = true
			})
		}

		knowledges = searchedIcons
		tableView.reloadData()
	}

}

extension ContentViewController: UIViewControllerPreviewingDelegate {

	func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
		guard let indexPath = tableView.indexPathForRowAtPoint(location), cell = tableView.cellForRowAtIndexPath(indexPath) else { return nil }

		let knowledges = self.knowledges[indexPath.section]
		let knowledge = knowledges[indexPath.row]
		let detailVC = DetailViewController()
		detailVC.knowledege = knowledge

		detailVC.preferredContentSize = CGSize(width: 0.0, height: 0.0)
		previewingContext.sourceRect = cell.frame

		return detailVC
	}

	func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
		showViewController(viewControllerToCommit, sender: self)
	}
}







