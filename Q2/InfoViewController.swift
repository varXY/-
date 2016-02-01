//
//  InfoViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {

	var generator = Generator()
	var bigButtons = [UIButton]()
	var knowledge = Knowledge()
	var global = Global()

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = Global.redColor()

        bigButtons = generator.allMainButtons()
		self.view.addSubview(bigButtons[0])

        for i in 1..<bigButtons.count {
            bigButtons[i].alpha = 0.0
            bigButtons[i].addTarget(self, action: "touchDown:", forControlEvents: .TouchDown)
            bigButtons[i].addTarget(self, action: "touchUpOutside:", forControlEvents: .TouchUpOutside)
            bigButtons[i].addTarget(self, action: "touchUpInside:", forControlEvents: .TouchUpInside)
            self.view.addSubview(bigButtons[i])
        }
        
        let descriptions = ["考试题目", "换算工具", "常用知识"]
        for i in 0..<3 {
            let point = CGPoint(x: 30, y: 30 + 20 * CGFloat(i))
            let label = UILabel(frame: CGRect(origin: point, size: CGSizeMake(100, 20)))
            label.text = descriptions[i]
            label.font = UIFont.systemFontOfSize(12)
            label.textColor = UIColor.whiteColor()
            label.sizeToFit()
            self.view.addSubview(label)
        }
        
//        let imageView = UIImageView(image: UIImage(named: "电工试题"))
//        imageView.tintColor = UIColor.whiteColor()
//        imageView.frame = CGRectMake(self.view.frame.width - 50, 30, 30, 30)
//        self.view.addSubview(imageView)
        
//        let infoButton = UIButton(type: .InfoLight)
        let infoButton = UIButton(type: .Custom)
        infoButton.setImage(UIImage(named: "电工试题"), forState: .Normal)
        infoButton.tintColor = UIColor.whiteColor()
        infoButton.frame = CGRectMake(self.view.frame.width - 50, self.view.frame.height - 50, 30, 30)
        infoButton.addTarget(self, action: "infoButtonTapped", forControlEvents: .TouchUpInside)
        infoButton.exclusiveTouch = true
        self.view.addSubview(infoButton)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        print(__FUNCTION__)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)

		bigButtons[0].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
        
		for i in 1..<bigButtons.count {
            bigButtons[i].hidden = false
            
            bigButtons[i].alpha = 1.0
			bigButtons[i].genAnimation(.Appear, delay: 0.03 * Double(i), distance: 30 + CGFloat(i) * 20.0)
            bigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
            bigButtons[i].subviews[0].transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
		}
        


	}
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print(__FUNCTION__)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            for i in 1..<self.bigButtons.count {
                self.bigButtons[i].alpha = 0.0
            }
            }) { (_) -> Void in
                for i in 1..<self.bigButtons.count {
                    self.bigButtons[i].transform = CGAffineTransformIdentity
                }
        }

    }


	func touchDown(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, 0.8, 0.8)
            }, completion: nil)
	}
    
    
    func touchUpOutside(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, 1.25, 1.25)
            }, completion: nil)
        
    }

	func touchUpInside(sender: UIButton) {
        let index = sender.tag - 100

		delay(seconds: 0.2) { () -> () in
			let contentVC = ContentViewController()
            contentVC.index = index < 3 ? index : 2
			contentVC.hidesBottomBarWhenPushed = true
			self.navigationController?.pushViewController(contentVC, animated: true)
		}
	}
    
    func infoButtonTapped() {
        delay(seconds: 0.2) { () -> () in
            let settingVC = SettingTableViewController()
            let settingNavi = NavigationController(rootViewController: settingVC)
            self.presentViewController(settingNavi, animated: true, completion: nil)
        }
    }
}
