//
//  HomepageViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {

	var prismatic: Primatic!
	var bigButtons = [UIButton]()
	var infoButton = UIButton()

	var beginnerRecords = Records(type: 0)
	var intermediateRecords = Records(type: 1)
	var advancedRecords = Records(type: 2)

	var sound: Bool!
	var vibration: Bool!

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.lightRedColor()
		title = " "

		prismatic = Primatic(VC: self)
		bigButtons = prismatic.buttons

		bigButtons.forEach({
			$0.addTarget(self, action: #selector(touchDown(_:)), forControlEvents: .TouchDown)
			$0.addTarget(self, action: #selector(touchUpOutside(_:)), forControlEvents: .TouchUpOutside)
			$0.addTarget(self, action: #selector(touchUpInside(_:)), forControlEvents: .TouchUpInside)
		})

        infoButton = UIButton(type: .System)
        infoButton.setImage(UIImage(named: "电工试题"), forState: .Normal)
        infoButton.tintColor = UIColor.whiteColor()
        infoButton.frame = CGRectMake(self.view.frame.width - 50, self.view.frame.height - 50, 30, 30)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), forControlEvents: .TouchUpInside)
        infoButton.exclusiveTouch = true
        view.addSubview(infoButton)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

		bigButtons.forEach { (button) in
			button.userInteractionEnabled = true
			guard let titleLabel = button.subviews[0] as? UILabel else { return }
			titleLabel.textColor = UIColor.blackColor()
			button.genAnimation(.Bigger, delayTime: 0.0, distance: 0.0)
		}

		infoButton.userInteractionEnabled = true
		infoButton.genAnimation(.Bigger, delayTime: 0.5, distance: 0.0)

	}


	func touchDown(sender: UIButton) {
		guard let titleLabel = sender.subviews[0] as? UILabel else { return }

		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: { 
			sender.transform = CGAffineTransformScale(sender.transform, 0.8, 0.8)
			titleLabel.textColor = UIColor.themeRed()
			}, completion:  nil)
	}

    func touchUpOutside(sender: UIButton) {
		guard let titleLabel = sender.subviews[0] as? UILabel else { return }

		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: {
			sender.transform = CGAffineTransformScale(sender.transform, (1.0 / 0.8), (1.0 / 0.8))
			titleLabel.textColor = UIColor.blackColor()
			}, completion:  nil)
    }

	func touchUpInside(sender: UIButton) {
		bigButtons.forEach({ $0.userInteractionEnabled = false })
		infoButton.userInteractionEnabled = false

		UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: {
			sender.transform = CGAffineTransformScale(sender.transform, (1.0 / 0.8), (1.0 / 0.8))
			}, completion:  { (_) in
				let index = sender.tag - 100
				self.gotoVCBaseOnIndex(index)
		})
	}

	func gotoVCBaseOnIndex(index: Int) {
		switch index {
		case 0, 1, 2:
			setSoundAndVibration()

			let type = index == 0 ? 2 : index - 1
			let questionVC = QuestionViewController()
			questionVC.type = type
			questionVC.sound = sound
			questionVC.vibration = vibration

			questionVC.beginnerRecords = beginnerRecords
			questionVC.intermediateRecords = intermediateRecords
			questionVC.advancedRecords = advancedRecords

			questionVC.record = { [weak self] rightCount, date in
				let record = Record(record: rightCount, date: date)
				switch questionVC.type {
				case 0:
					self!.beginnerRecords.records.insert(record, atIndex: 0)
					questionVC.beginnerRecords = self!.beginnerRecords
				case 1:
					self!.intermediateRecords.records.insert(record, atIndex: 0)
					questionVC.intermediateRecords = self!.intermediateRecords
				case 2:
					self!.advancedRecords.records.insert(record, atIndex: 0)
					questionVC.advancedRecords = self!.advancedRecords
				default:
					break
				}

			}

			questionVC.hidesBottomBarWhenPushed = true
			navigationController?.pushViewController(questionVC, animated: true)

		case 3, 4, 5, 6:
			let equationVC = EquationViewController()
			equationVC.index = index - 3
			equationVC.hidesBottomBarWhenPushed = true
			navigationController?.pushViewController(equationVC, animated: true)

		case 7, 8, 9:
			let contentVC = ContentViewController()
			contentVC.index = index - 7
			contentVC.hidesBottomBarWhenPushed = true
			navigationController?.pushViewController(contentVC, animated: true)

		default:
			break

		}
	}

	func setSoundAndVibration() {
		let defaults = NSUserDefaults.standardUserDefaults()

		if let sound = defaults.valueForKey(SettingDefault.sound) as? Bool {
			self.sound = sound
		} else {
			self.sound = true
			defaults.setBool(true, forKey: SettingDefault.sound)
		}

		if let vibration = defaults.valueForKey(SettingDefault.vibration) as? Bool {
			self.vibration = vibration
		} else {
			self.vibration = true
			defaults.setBool(true, forKey: SettingDefault.vibration)
		}

		defaults.synchronize()
	}


    func infoButtonTapped() {
		bigButtons.forEach({ $0.userInteractionEnabled = false })

		let settingVC = SettingTableViewController()
		let settingNavi = NavigationController(rootViewController: settingVC)
		presentViewController(settingNavi, animated: true, completion: nil)
    }

}
