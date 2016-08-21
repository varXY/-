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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.lightRedColor()
		title = " "

		prismatic = Primatic(VC: self)
		bigButtons = prismatic.buttons

		bigButtons.forEach({
			$0.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
			$0.addTarget(self, action: #selector(touchUpOutside(_:)), for: .touchUpOutside)
			$0.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
		})

        infoButton = UIButton(type: .system)
        infoButton.setImage(UIImage(named: "电工试题"), for: UIControlState())
        infoButton.tintColor = UIColor.white
        infoButton.frame = CGRect(x: self.view.frame.width - 50, y: self.view.frame.height - 50, width: 30, height: 30)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        infoButton.isExclusiveTouch = true
        view.addSubview(infoButton)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

		bigButtons.forEach { (button) in
			button.isUserInteractionEnabled = true
			guard let titleLabel = button.subviews[0] as? UILabel else { return }
			titleLabel.textColor = UIColor.black
			button.genAnimation(.bigger, delayTime: 0.0, distance: 0.0)
		}

		infoButton.isUserInteractionEnabled = true
		infoButton.genAnimation(.bigger, delayTime: 0.5, distance: 0.0)

	}


	func touchDown(_ sender: UIButton) {
		guard let titleLabel = sender.subviews[0] as? UILabel else { return }

		UIView.perform(.delete, on: [], options: [], animations: { 
			sender.transform = sender.transform.scaledBy(x: 0.8, y: 0.8)
			titleLabel.textColor = UIColor.themeRed()
			}, completion:  nil)
	}

    func touchUpOutside(_ sender: UIButton) {
		guard let titleLabel = sender.subviews[0] as? UILabel else { return }

		UIView.perform(.delete, on: [], options: [], animations: {
			sender.transform = sender.transform.scaledBy(x: (1.0 / 0.8), y: (1.0 / 0.8))
			titleLabel.textColor = UIColor.black
			}, completion:  nil)
    }

	func touchUpInside(_ sender: UIButton) {
		bigButtons.forEach({ $0.isUserInteractionEnabled = false })
		infoButton.isUserInteractionEnabled = false

		UIView.perform(.delete, on: [], options: [], animations: {
			sender.transform = sender.transform.scaledBy(x: (1.0 / 0.8), y: (1.0 / 0.8))
			}, completion:  { (_) in
				let index = sender.tag - 100
				self.gotoVCBaseOnIndex(index)
		})
	}

	func gotoVCBaseOnIndex(_ index: Int) {
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
					self!.beginnerRecords.records.insert(record, at: 0)
					questionVC.beginnerRecords = self!.beginnerRecords
				case 1:
					self!.intermediateRecords.records.insert(record, at: 0)
					questionVC.intermediateRecords = self!.intermediateRecords
				case 2:
					self!.advancedRecords.records.insert(record, at: 0)
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
		let defaults = UserDefaults.standard

		if let sound = defaults.value(forKey: SettingDefault.sound) as? Bool {
			self.sound = sound
		} else {
			self.sound = true
			defaults.set(true, forKey: SettingDefault.sound)
		}

		if let vibration = defaults.value(forKey: SettingDefault.vibration) as? Bool {
			self.vibration = vibration
		} else {
			self.vibration = true
			defaults.set(true, forKey: SettingDefault.vibration)
		}

		defaults.synchronize()
	}


    func infoButtonTapped() {
		bigButtons.forEach({ $0.isUserInteractionEnabled = false })

		let settingVC = SettingTableViewController()
		let settingNavi = NavigationController(rootViewController: settingVC)
		present(settingNavi, animated: true, completion: nil)
    }

}
