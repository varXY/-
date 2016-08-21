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
		self.init(style: UITableViewStyle.grouped)
	}


	var index = 0

	let knowledge = Knowledge()
	var knowledges = [[Knowledge]]()

	var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
	
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.backgroundColor = UIColor.backgroundColor()

		if traitCollection.forceTouchCapability == .available && index != 1 {
			registerForPreviewing(with: self, sourceView: view)
		}

		var cellNib = UINib(nibName: "DescribeCell", bundle: nil)

		switch index {
		case 0:
			title = "单位公式"
			knowledges = knowledge.getAll(0)
			tableView.register(cellNib, forCellReuseIdentifier: "DescribeCell")

		case 1:
			title = "符号图标"
			knowledges = knowledge.getAll(1)

			tableView.allowsSelection = false

			searchBar.placeholder = "搜索"
			searchBar.tintColor = UIColor.themeRed()
			searchBar.delegate = self
			tableView.tableHeaderView = searchBar
            tableView.contentOffset.y = searchBar.frame.height

			cellNib = UINib(nibName: "ImageCell", bundle: nil)
			tableView.register(cellNib, forCellReuseIdentifier: "ImageCell")

			let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToCancel))
			view.addGestureRecognizer(tapGesture)

		case 2:
			self.title = "工具设备"
			knowledges = knowledge.getAll(2)

			cellNib = UINib(nibName: "IntroCell", bundle: nil)
			tableView.register(cellNib, forCellReuseIdentifier: "IntroCell")

		default:
			break
		}

	}

	func back() {
		let _ = navigationController?.popViewController(animated: true)
	}
    
    func tapToCancel() {
        searchBarCancelButtonClicked(self.searchBar)
        searchBar.text = nil
    }


	// MARK: - TableView

	override func numberOfSections(in tableView: UITableView) -> Int {
		return knowledges.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return knowledges[section].count
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch index {
		case 0: return 78
		case 1: return 60
		default: return 60
		}
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return knowledges[section][0].sectionTitle
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let knowledge = knowledges[indexPath.section][indexPath.row]

		switch index {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "DescribeCell", for: indexPath) as! DescribeCell
			cell.configureForDescribeCell(knowledge)
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
			cell.configureForImageCell(knowledge)
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "IntroCell", for: indexPath) as! IntroCell
			cell.configureForIntroCell(knowledge)
			return cell
		}

	}

	override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		switch index {
		case 0: return indexPath
		case 1: return nil
		default: return indexPath
		}
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let knowledge = knowledges[indexPath.section][indexPath.row]
		let detailVC = DetailViewController()
		detailVC.knowledege = knowledge
		detailVC.hidesBottomBarWhenPushed = true
		navigationController?.pushViewController(detailVC, animated: true)
		tableView.deselectRow(at: indexPath, animated: true)
	}

}


extension ContentViewController: UISearchBarDelegate {

	func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
		tableView.separatorColor = UIColor(red: 0.783922, green: 0.780392, blue: 0.8, alpha: 1.0)
		tableView.reloadData()
		searchBar.setShowsCancelButton(true, animated: true)
		return true
	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		searchBar.setShowsCancelButton(false, animated: true)
		tableView.separatorColor = UIColor(red: 0.783922, green: 0.780392, blue: 0.8, alpha: 1.0)
		knowledges = knowledge.getAll(1)
		tableView.reloadData()
	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()

		let searchedIcons = knowledge.getSearchedAll(searchBar.text!)
		if searchedIcons.isEmpty {
			tableView.separatorColor = UIColor.clear
			let hudView = HudView.hudInView(self.view, animated: true)
			hudView.text = "无结果"

			delay(seconds: 0.7, completion: { () -> () in
				hudView.removeFromSuperview()
				self.view.isUserInteractionEnabled = true
			})
		}

		knowledges = searchedIcons
		tableView.reloadData()
	}

}

extension ContentViewController: UIViewControllerPreviewingDelegate {

	func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
		guard let indexPath = tableView.indexPathForRow(at: location), let cell = tableView.cellForRow(at: indexPath) else { return nil }
		let knowledge = knowledges[indexPath.section][indexPath.row]
		let detailVC = DetailViewController()
		detailVC.knowledege = knowledge

		detailVC.preferredContentSize = CGSize(width: 0.0, height: 0.0)
		previewingContext.sourceRect = cell.frame

		return detailVC
	}

	func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
		show(viewControllerToCommit, sender: self)
	}
}







