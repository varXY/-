//
//  HomepageViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class HomepageViewController: UIViewController {

	var generator = Generator()

	var bigButtons = [UIButton]()
	var infoButton = UIButton()

	var beginnerRecords = Records(type: 0)
	var intermediateRecords = Records(type: 1)

	var sound: Bool!
	var vibration: Bool!

	var prismatic: Primatic!

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.lightRedColor()
		self.title = " "

		prismatic = Primatic(VC: self)
		bigButtons = prismatic.buttons

		bigButtons.forEach({
			$0.addTarget(self, action: #selector(touchDown(_:)), forControlEvents: .TouchDown)
			$0.addTarget(self, action: #selector(touchUpOutside(_:)), forControlEvents: .TouchUpOutside)
			$0.addTarget(self, action: #selector(touchUpInside(_:)), forControlEvents: .TouchUpInside)
		})

        
        let descriptions = ["考试题目", "换算工具", "常用知识"]
        for i in 0..<3 {
            let point = CGPoint(x: 35, y: 30 + 20 * CGFloat(i))
            let label = UILabel(frame: CGRect(origin: point, size: CGSizeMake(100, 20)))
            label.text = descriptions[i]
            label.font = UIFont.boldSystemFontOfSize(12)
            label.textColor = UIColor.whiteColor()
            label.sizeToFit()
            self.view.addSubview(label)
        }

		let topPoint = CGPoint(x: 20, y: 30)
		let describeButtons = generator.describeButtons(topPoint)
		for i in 0..<describeButtons.count {
			self.view.addSubview(describeButtons[i])
			describeButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
		}

        infoButton = UIButton(type: .System)
        infoButton.setImage(UIImage(named: "电工试题"), forState: .Normal)
        infoButton.tintColor = UIColor.whiteColor()
        infoButton.frame = CGRectMake(self.view.frame.width - 60, self.view.frame.height - 60, 30, 30)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), forControlEvents: .TouchUpInside)
        infoButton.exclusiveTouch = true
        self.view.addSubview(infoButton)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

		infoButton.userInteractionEnabled = true
        infoButton.genAnimation(.Bigger, delayTime: 0.5, distance: 0.0)

		bigButtons.forEach { (button) in
			button.userInteractionEnabled = true
			guard let titleLabel = button.subviews[0] as? UILabel else { return }
			titleLabel.textColor = UIColor.blackColor()
			button.genAnimation(.Bigger, delayTime: 0.0, distance: 0.0)
		}

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
		case 0:
			let recordVC = RecordViewController()
			recordVC.beginnerRecords = self.beginnerRecords.records
			recordVC.intermediateRecords = self.intermediateRecords.records
			let detailNavi = NavigationController(viewController: recordVC)
			presentViewController(detailNavi, animated: true, completion: nil)

		case 1, 2:
			setSoundAndVibration()

			let type = index - 1
			let questionVC = QuestionViewController()
			questionVC.type = type
			questionVC.sound = sound
			questionVC.vibration = vibration
			questionVC.record = { [weak self] rightCount, date in
				let record = Record(record: rightCount, date: date)
				if type == 0 {
					self!.beginnerRecords.records.insert(record, atIndex: 0)
				} else {
					self!.intermediateRecords.records.insert(record, atIndex: 0)
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
