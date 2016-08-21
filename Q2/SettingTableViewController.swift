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
import StoreKit


struct SettingDefault {
	static let sound = "Sound"
	static let vibration = "Vibration"
}

class SettingTableViewController: UITableViewController {

	let titles = [["声音", "振动"], ["评分留言", "分享"], ["意见建议"]]
	var switchControl_S: UISwitch!
	var switchControl_V: UISwitch!
	let userDefaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.backgroundColor()
        self.title = "设置&反馈"
        
		let quitButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
        self.navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .grouped)
		tableView.backgroundColor = UIColor.backgroundColor()
		tableView.dataSource = self
		tableView.delegate = self

		switchControl_S = initialSwitchControl()
		switchControl_V = initialSwitchControl()

		getSettings()

    }

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillAppear(animated)
		userDefaults.synchronize()
	}

	func initialSwitchControl() -> UISwitch {
		let switchControl = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl.onTintColor = UIColor.themeRed()
		switchControl.addTarget(self, action: #selector(switched(_:)), for: UIControlEvents.valueChanged)
		return switchControl
	}

	func getSettings() {
		let sound = userDefaults.bool(forKey: SettingDefault.sound)
		switchControl_S.setOn(sound, animated: false)

		let vibration = userDefaults.bool(forKey: SettingDefault.vibration)
		switchControl_V.setOn(vibration, animated: false)

	}

	func shareContent() {
		let text: String = "App Store: 电工助手"
		let link = URL(string: appStoreURLString)!
		let image = UIImage(named: "Screen Shot")!

		let arr: [AnyObject] = [text, link, image]

		let shareVC = UIActivityViewController(activityItems: arr, applicationActivities: [])

		present(shareVC, animated: true, completion: nil)
	}

	func menuViewControllerSendSupportEmail() {
		let appInfoDict = Bundle.main.infoDictionary
		let appName = appInfoDict!["CFBundleName"] as! String
		let appVersion = appInfoDict!["CFBundleShortVersionString"] as! String

		let deviceName = UIDevice.current.model
		let iOSVersion = UIDevice.current.systemVersion

		let messageBody = "\n\n\n" + appName + "_" + appVersion + "\n" + deviceName + "_" + iOSVersion

		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
			controller.navigationBar.tintColor = UIColor.themeRed()
			controller.mailComposeDelegate = self
			controller.setSubject("反馈：电工助手")
			controller.setMessageBody(messageBody, isHTML: false)
			controller.setToRecipients(["pmlcfwcs@foxmail.com"])
			present(controller, animated: true, completion: nil)
		} else {
			let alertController = UIAlertController(title: "无法发送邮件", message: "你的设备无法发送邮件，请检测你的设置。", preferredStyle: .alert)
			let action = UIAlertAction(title: "确定", style: .default, handler: nil)
			alertController.addAction(action)
			present(alertController, animated: true, completion: nil)
		}

	}

	func switched(_ sender: UISwitch) {
		switch sender {
		case switchControl_S: userDefaults.set(sender.isOn, forKey: SettingDefault.sound)
		case switchControl_V: userDefaults.set(sender.isOn, forKey: SettingDefault.vibration)
		default: break
		}
	}

    func close() {
        dismiss(animated: true, completion: nil)
    }


	// MARK: - Purchase

	func connectToStore() {

		let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
		indicator.startAnimating()
		indicator.frame = self.view.bounds
		indicator.frame.size.height += 64
		indicator.frame.origin.y -= 64
		UIView.animate(withDuration: 0.3, animations: { indicator.backgroundColor = UIColor(red: 45/255, green: 47/255, blue: 56/255, alpha: 0.45) })
		tableView.addSubview(indicator)
		tableView.isUserInteractionEnabled = false

		SupportProducts.store.requestProductsWithCompletionHandler({ (success, products) -> () in
			indicator.removeFromSuperview()
			self.tableView.isUserInteractionEnabled = true
			if success {
				priceFormatter.locale = products[0].priceLocale

				let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

				let action_0 = UIAlertAction(title: priceFormatter.string(from: products[0].price), style: .default, handler: { (_) -> () in self.purchaseProduct(products[0]) })
				let action_1 = UIAlertAction(title: priceFormatter.string(from: products[1].price), style: .default, handler: { (_) -> () in self.purchaseProduct(products[1]) })
				let action_2 = UIAlertAction(title: priceFormatter.string(from: products[2].price), style: .default, handler: { (_) -> () in self.purchaseProduct(products[2]) })

				let action_cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: "SettingVC"), style: .cancel, handler: nil)

				alertSheet.addAction(action_0)
				alertSheet.addAction(action_2)
				alertSheet.addAction(action_1)
				alertSheet.addAction(action_cancel)
				self.present(alertSheet, animated: true, completion: nil)

			} else {
				let title = NSLocalizedString("连接失败", comment: "SettingVC")
				let message = NSLocalizedString("请检查你的网络连接后重试", comment: "SettingVC")
				let ok = NSLocalizedString("确定", comment: "SettingVC")
				let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
				let action = UIAlertAction(title: ok, style: .default, handler: nil)
				alertController.addAction(action)
				self.present(alertController, animated: true, completion: nil)
			}
		})
	}

	func purchaseProduct(_ product: SKProduct) {
		SupportProducts.store.purchaseProduct(product)
		let hudView = HudView_1.hudInView(self.view, animated: true)
		hudView.text = "    谢  谢 ！"
	}

	func productPurchased(_ notification: Notification) {
		_ = notification.object as! String
	}


	//MARK: -TableView DataSource, Delegate

	override func numberOfSections(in tableView: UITableView) -> Int {
		return IAPHelper.canMakePayments() ? 3 : 2
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return titles[section].count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
		let bgView = UIView()
		bgView.backgroundColor = UIColor.lightRedColor()
		bgView.layer.masksToBounds = true
		cell.selectedBackgroundView = bgView
		cell.textLabel!.text = titles[indexPath.section][indexPath.row]

		switch indexPath.section {
		case 0:
			let switchControl = indexPath.row == 0 ? switchControl_S : switchControl_V
			cell.addSubview(switchControl!)
		default:
			cell.textLabel?.textAlignment = .center
			cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
		}

		return cell
	}


	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		switch indexPath.section {
		case 0:
			let switchControl = indexPath.row == 0 ? switchControl_S : switchControl_V
			let key = indexPath.row == 0 ? SettingDefault.sound : SettingDefault.vibration
			(switchControl?.isOn)! ? switchControl?.setOn(false, animated: true) : switchControl?.setOn(true, animated: true)
			userDefaults.set(switchControl?.isOn, forKey: key)

		case 1:
			switch indexPath.row {
			case 0: UIApplication.shared.openURL(URL(string: commentURLString)!)
			case 1: shareContent()
			default: break
			}

		case 2:
			menuViewControllerSendSupportEmail()

		default: break
		}

		tableView.deselectRow(at: indexPath, animated: true)

	}
}


extension SettingTableViewController: MFMailComposeViewControllerDelegate {

	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
	}
}















