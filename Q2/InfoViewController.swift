//
//  InfoViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class InfoViewController: UIViewController {

	var generator = Generator()
	var bigButtons = [UIButton]()
	var infoButton = UIButton()

	var global = Global()

	var beginnerRecords = Records(type: 0)
	var intermediateRecords = Records(type: 1)


	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = Global.redColor()
		self.title = " "

        bigButtons = generator.allMainButtons()

        for i in 0..<bigButtons.count {
            bigButtons[i].alpha = 0.0
            bigButtons[i].addTarget(self, action: "touchDown:", forControlEvents: .TouchDown)
            bigButtons[i].addTarget(self, action: "touchUpOutside:", forControlEvents: .TouchUpOutside)
            bigButtons[i].addTarget(self, action: "touchUpInside:", forControlEvents: .TouchUpInside)
            self.view.addSubview(bigButtons[i])
        }
        
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
        infoButton.addTarget(self, action: "infoButtonTapped", forControlEvents: .TouchUpInside)
        infoButton.exclusiveTouch = true
        self.view.addSubview(infoButton)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: true)

        infoButton.genAnimation(.Bigger, delay: 0.5, distance: 0.0)
		infoButton.userInteractionEnabled = true
		
		for i in 0..<bigButtons.count {
            bigButtons[i].alpha = 1.0
			bigButtons[i].genAnimation(.Appear, delay: 0.03 * Double(delayTime(i)), distance: 30 + CGFloat(delayTime(i)) * 20.0)
            bigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
            bigButtons[i].subviews[0].transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))

			bigButtons[i].userInteractionEnabled = true

//			if let label = bigButtons[i].subviews[0] as? UILabel {
//				label.font = UIFont.boldSystemFontOfSize(18)
//			}
		}
        
	}
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        UIView.animateWithDuration(0.3, animations: { () -> Void in
            for i in 0..<self.bigButtons.count {
                self.bigButtons[i].alpha = 0.0

            }
            }) { (_) -> Void in
                for i in 0..<self.bigButtons.count {
                    self.bigButtons[i].transform = CGAffineTransformIdentity
					self.bigButtons[i].backgroundColor = UIColor.whiteColor()
					if let titleLabel = self.bigButtons[i].subviews[0] as? UILabel {
						titleLabel.textColor = UIColor.blackColor()
					}
                }
        }

    }

	func delayTime(index: Int) -> Int {

		switch index {
		case 0:
			return 1
		case 1, 2:
			return 2
		case 3:
			return 3
		case 4, 5:
			return 4
		case 6:
			return 5
		case 7, 8:
			return 6
		case 9:
			return 7
		default:
			return 8
		}

	}


	func touchDown(sender: UIButton) {

        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.225, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, 0.9, 0.9)

			sender.backgroundColor = UIColor.whiteColor()
			if let titleLabel = sender.subviews[0] as? UILabel {
				titleLabel.textColor = Global.redColor()
			}

			}, completion: nil)

	}

    
    func touchUpOutside(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.225, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, (1.0 / 0.9), (1.0 / 0.9))

			sender.backgroundColor = UIColor.whiteColor()
			if let titleLabel = sender.subviews[0] as? UILabel {
				titleLabel.textColor = UIColor.blackColor()
			}

            }, completion: nil)
        
    }

	func touchUpInside(sender: UIButton) {

		for button in bigButtons {
			button.userInteractionEnabled = false
		}

		infoButton.userInteractionEnabled = false

        let index = sender.tag - 100
		gotoVCBaseOnIndex(index)

	}

	func gotoVCBaseOnIndex(index: Int) {

		switch index {
		case 0:
			let recordVC = RecordViewController()
			recordVC.beginnerRecords = self.beginnerRecords.records
			recordVC.intermediateRecords = self.intermediateRecords.records
			let detailNavi = NavigationController(viewController: recordVC)

			delay(seconds: 0.2, completion: { () -> () in
				self.presentViewController(detailNavi, animated: true, completion: nil)
			})

		case 1, 2:
			let QuestionVC = QuestionViewController()
			QuestionVC.type = index - 1
			QuestionVC.record = {(rightCount: Int, date: NSDate) in
				let record = Record(record: rightCount, date: date)
				if index == 0 {
					self.beginnerRecords.records.insert(record, atIndex: 0)
				} else {
					self.intermediateRecords.records.insert(record, atIndex: 0)
				}
			}

			QuestionVC.hidesBottomBarWhenPushed = true
			delay(seconds: 0.2) { () -> () in
				self.navigationController?.pushViewController(QuestionVC, animated: true)
			}

		case 3, 4, 5, 6:
			let equationVC = EquationViewController()
			equationVC.index = index - 3
			equationVC.hidesBottomBarWhenPushed = true

			delay(seconds: 0.2) { () -> () in
				self.navigationController?.pushViewController(equationVC, animated: true)
			}

		case 7, 8, 9:
			let contentVC = ContentViewController()
			contentVC.index = index - 7
			contentVC.hidesBottomBarWhenPushed = true

			delay(seconds: 0.2) { () -> () in
				self.navigationController?.pushViewController(contentVC, animated: true)
			}

		default:
			break

		}

	}


    func infoButtonTapped() {

		for button in bigButtons {
			button.userInteractionEnabled = false
		}

        delay(seconds: 0.2) { () -> () in
            let settingVC = SettingTableViewController()
            let settingNavi = NavigationController(rootViewController: settingVC)
            self.presentViewController(settingNavi, animated: true, completion: nil)
        }

    }

}
