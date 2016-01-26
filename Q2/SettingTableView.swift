//
//  SettingTableView.swift
//  电工助手
//
//  Created by 文川术 on 1/23/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import UIKit
import MessageUI

typealias SendMail = (MFMailComposeViewController) -> Void
typealias DoneWithMail = (MFMailComposeViewController) -> Void

class SettingTableView: UITableView {

	let titles = ["声音", "意见建议", "评分"]
	let switchControl = UISwitch()

	var sendMail: SendMail?
	var doneWithMail: DoneWithMail?

	override init(frame: CGRect, style: UITableViewStyle) {
		super.init(frame: frame, style: style)

		self.backgroundColor = Global.backgroundColor()
		self.allowsSelection = true
		self.userInteractionEnabled = true
		self.dataSource = self
		self.delegate = self
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)

		switchControl.frame.origin = CGPoint(x: self.frame.width - 60, y: 7)
//		switchControl.tintColor = Global.lightRedColor()
		switchControl.onTintColor = Global.redColor()

		let userDefaults = NSUserDefaults.standardUserDefaults()
		if let soundOn = userDefaults.valueForKey("Sound") as? Bool {
			switchControl.setOn(soundOn, animated: true)
		} else {
			switchControl.setOn(true, animated: true)
		}

		switchControl.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	func switched(sender: UISwitch) {

		let userDefaults = NSUserDefaults.standardUserDefaults()
		userDefaults.setBool(sender.on, forKey: "Sound")
	}

	func menuViewControllerSendSupportEmail() {

		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
            controller.navigationBar.tintColor = Global.redColor()
            
			controller.mailComposeDelegate = self
			controller.setSubject("反馈：电工助手")
			controller.setToRecipients(["xiaoyao901010@icloud.com"])
			self.sendMail!(controller)
		}

	}
}


extension SettingTableView: UITableViewDataSource, UITableViewDelegate {

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 2
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return section == 0 ? 1 : 2
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
		let bgView = UIView()
		bgView.backgroundColor = Global.lightRedColor()
		bgView.layer.masksToBounds = true
		cell.selectedBackgroundView = bgView

		if indexPath.section == 0 {
			cell.textLabel?.text = titles[0]
			cell.addSubview(switchControl)
            cell.selectionStyle = .None
		}

		if indexPath.section == 1 {
			cell.textLabel?.text = titles[indexPath.row + 1]
            cell.textLabel?.textAlignment = .Center
//			cell.textLabel?.textColor = Global.lightRedColor()
		}

		return cell
	}

	func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		return indexPath.section == 1 ? indexPath : nil
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

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


extension SettingTableView: MFMailComposeViewControllerDelegate {

	func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
		self.doneWithMail!(controller)
	}

}








