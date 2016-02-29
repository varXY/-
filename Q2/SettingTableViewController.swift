//
//  SettingTableViewController.swift
//  电工助手
//
//  Created by Bobo on 2/1/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit
import MessageUI


class SettingTableViewController: UITableViewController {

	let titles = ["声音", "意见建议", "评分"]
	let switchControl = UISwitch()

	let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.backgroundColor()
        self.title = "设置&反馈"
        
        let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "close")
        self.navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .Grouped)
		tableView.backgroundColor = UIColor.backgroundColor()
		tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
		tableView.dataSource = self
		tableView.delegate = self

		switchControl.frame.origin = CGPoint(x: tableView.frame.width - 60, y: 7)
		switchControl.onTintColor = UIColor.themeRed()

		if let soundOn = userDefaults.valueForKey("Sound") as? Bool {
			switchControl.setOn(soundOn, animated: true)
		} else {
			switchControl.setOn(true, animated: true)
			userDefaults.setBool(true, forKey: "Sound")
		}

		switchControl.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)

    }

	override func viewWillDisappear(animated: Bool) {
		super.viewWillAppear(animated)
		userDefaults.synchronize()
	}


	func menuViewControllerSendSupportEmail() {

		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
			controller.navigationBar.tintColor = UIColor.themeRed()
			controller.mailComposeDelegate = self
			controller.setSubject("反馈：电工助手")
			controller.setToRecipients(["pmlcfwcs@foxmail.com"])
			self.presentViewController(controller, animated: true, completion: nil)
		}

	}

	func switched(sender: UISwitch) {
		userDefaults.setBool(sender.on, forKey: "Sound")
	}

    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }


	//MARK: -TableView DataSource, Delegate

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 2
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return section == 0 ? 1 : 2
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
		let bgView = UIView()
		bgView.backgroundColor = UIColor.lightRedColor()
		bgView.layer.masksToBounds = true
		cell.selectedBackgroundView = bgView

		if indexPath.section == 0 {
			cell.textLabel?.text = titles[0]
			cell.addSubview(switchControl)
		}

		if indexPath.section == 1 {
			cell.textLabel?.text = titles[indexPath.row + 1]
			cell.textLabel?.textAlignment = .Center
		}

		return cell
	}


	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		if indexPath.section == 0 && indexPath.row == 0 {
			switchControl.on ? switchControl.setOn(false, animated: true) : switchControl.setOn(true, animated: true)
			userDefaults.setBool(switchControl.on, forKey: "Sound")
		}

		if indexPath.section == 1 {

			if indexPath.row == 0 {
				menuViewControllerSendSupportEmail()
			}

			if indexPath.row == 1 {
				UIApplication.sharedApplication().openURL(NSURL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1044537172&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8")!)
			}
		}

		tableView.deselectRowAtIndexPath(indexPath, animated: true)

	}
}


extension SettingTableViewController: MFMailComposeViewControllerDelegate {

	func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}
}















