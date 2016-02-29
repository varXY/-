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

	var blurView = UIView()
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
		self.view.backgroundColor = UIColor.themeRed()
		self.title = " "

//		黑青 UIColor(red: 50/255, green: 55/255, blue: 70/255, alpha: 1.0)
//		黑 UIColor(red: 42/255, green: 41/255, blue: 42/255, alpha: 1.0)
//		深灰 UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
//		蓝 UIColor(red: 21/255, green: 108/255, blue: 195/255, alpha: 1.0)
//		blurView = UIView(frame: self.view.bounds)
//		blurView.backgroundColor = UIColor(red: 234/255, green: 93/255, blue: 73/255, alpha: 1.0)
//		blurView.alpha = 1.0
//		self.view.addSubview(blurView)

//		blurView = GradientView(frame: self.view.bounds)
//		self.view.addSubview(blurView)

//		let gap_0: CGFloat = sqrt(50)
//		//		let gap_1: CGFloat = sqrt(325)
//		let gap_1: CGFloat = sqrt(200)
//
//		let allGapLength = gap_0 * 2 + gap_1 * 2 + sqrt(200)
//		let diagonalLength = (global.size.height - 20 - allGapLength - 20) / 4
////		let sideLength = diagonalLength / sqrt(2)
//		let centerDistance = diagonalLength / 2


//		let x_0 = global.center.x - gap_0 - centerDistance
////		let x_1 = global.center.x
//		let x_2 = global.center.x + gap_0 + centerDistance

//		let line = UIView(frame: CGRectMake(view.frame.width / 2 - 1, 0, 2, view.frame.height))
//		line.backgroundColor = UIColor.whiteColor()
////		line.alpha = 0.3
//		view.addSubview(line)

//		let line1 = UIView(frame: CGRectMake(x_0 - 1, 0, 2, view.frame.height))
//		line1.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
////		line1.alpha = 0.3
//		view.addSubview(line1)
//
//		let line2 = UIView(frame: CGRectMake(x_2 - 1, 0, 2, view.frame.height))
//		line2.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
////		line2.alpha = 0.3
//		view.addSubview(line2)
//
//		let point_0 = CGPoint(x: 0, y: 20 + gap_0 + centerDistance)
//		let point_1 = CGPoint(x: 0, y: point_0.y + gap_0 + centerDistance - 1)
//		let point_3 = CGPoint(x: 0, y: point_0.y + gap_1 + centerDistance * 2)
//		let point_4 = CGPoint(x: 0, y: point_3.y + gap_0 + centerDistance - 1)
//		let point_5 = CGPoint(x: 0, y: point_3.y + gap_0 + centerDistance)
//		let point_6 = CGPoint(x: 0, y: point_5.y + gap_0 + centerDistance)
//		let point_9 = CGPoint(x: 0, y: point_6.y + gap_1 + centerDistance * 2)
//		let point_7 = CGPoint(x: 0, y: point_9.y - gap_0 - centerDistance - 1)
//
//		let points = [point_1, point_4, point_7]
//
//		for i in 0..<3 {
//			let line = UIView(frame: CGRect(origin: points[i], size: CGSize(width: view.frame.width, height: 2)))
//			line.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
//			//		line2.alpha = 0.3
//			view.addSubview(line)
//		}

//		fakeNavigationBar = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 64))
//		fakeNavigationBar.backgroundColor = UIColor.clearColor()
//		self.view.addSubview(fakeNavigationBar)

//		let effect = UIBlurEffect(style: .ExtraLight)
//		let blurView = UIVisualEffectView(effect: effect)
//		blurView.frame = self.view.bounds
//		self.view.addSubview(blurView)

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

//		UIView.animateWithDuration(0.5) { () -> Void in
//			self.blurView.alpha = 1.0
//		}



        infoButton.genAnimation(.Bigger, delay: 0.5, distance: 0.0)
		infoButton.userInteractionEnabled = true
		
		for i in 0..<bigButtons.count {
            bigButtons[i].alpha = 1.0
			bigButtons[i].genAnimation(.Appear, delay: 0.03 * Double(delayTime(i)), distance: 30 + CGFloat(delayTime(i)) * 20.0)
            bigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
            bigButtons[i].subviews[0].transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))

			bigButtons[i].userInteractionEnabled = true

		}
        
	}
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        UIView.animateWithDuration(0.3, animations: { () -> Void in
            for i in 0..<self.bigButtons.count {
                self.bigButtons[i].alpha = 0.0

//				self.fakeNavigationBar.backgroundColor = Global.redColor()
            }
            }) { (_) -> Void in
                for i in 0..<self.bigButtons.count {
                    self.bigButtons[i].transform = CGAffineTransformIdentity
					self.bigButtons[i].backgroundColor = UIColor.whiteColor()
					if let titleLabel = self.bigButtons[i].subviews[0] as? UILabel {
						titleLabel.textColor = UIColor.blackColor()
					}

//					self.fakeNavigationBar.backgroundColor = UIColor.clearColor()
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
				titleLabel.textColor = UIColor.themeRed()
			}

//			self.blurView.alpha = 0.0

			}, completion: nil)

	}

    
    func touchUpOutside(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.225, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, (1.0 / 0.9), (1.0 / 0.9))

			sender.backgroundColor = UIColor.whiteColor()
			if let titleLabel = sender.subviews[0] as? UILabel {
				titleLabel.textColor = UIColor.blackColor()
			}

//			self.blurView.alpha = 1.0

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
			let type = index - 1
			let QuestionVC = QuestionViewController()
			QuestionVC.type = type
			QuestionVC.record = {(rightCount: Int, date: NSDate) in
				let record = Record(record: rightCount, date: date)
				if type == 0 {
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

//		UIView.animateWithDuration(0.3) { () -> Void in
//			self.blurView.alpha = 0.0
//		}

        delay(seconds: 0.2) { () -> () in
            let settingVC = SettingTableViewController()
            let settingNavi = NavigationController(rootViewController: settingVC)
            self.presentViewController(settingNavi, animated: true, completion: nil)
        }

    }

}
