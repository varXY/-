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
//		self.navigationItem.title = "常用知识"

        bigButtons = generator.allMainButtons()
		self.view.addSubview(bigButtons[0])

        for i in 1..<bigButtons.count {
            bigButtons[i].alpha = 0.0
            bigButtons[i].addTarget(self, action: "open:", forControlEvents: .TouchDown)
            bigButtons[i].addTarget(self, action: "jump:", forControlEvents: .TouchUpInside)
            bigButtons[i].addTarget(self, action: "touchOut:", forControlEvents: .TouchUpOutside)
            self.view.addSubview(bigButtons[i])
        }

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		bigButtons[0].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
        
		for i in 1..<bigButtons.count {
            bigButtons[i].hidden = false
            
            bigButtons[i].backgroundColor = UIColor.whiteColor()
            if let label = bigButtons[i].subviews[0] as? UILabel {
                label.textColor = Global.redColor()
            }
            
            bigButtons[i].alpha = 1.0
			bigButtons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
            bigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
            bigButtons[i].subviews[0].transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
            print(NSStringFromCGAffineTransform(bigButtons[i].transform))
		}
        


	}
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        for i in 1..<3 {
            bigButtons[i].alpha = 0.0
            bigButtons[i].transform = CGAffineTransformIdentity
        }
    }


	func open(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, 0.8, 0.8)
            sender.backgroundColor = Global.redColor()
            if let label = sender.subviews[0] as? UILabel {
                label.textColor = UIColor.yellowColor()
            }
            }, completion: nil)
        
//        UIView.animateWithDuration(0.3) { () -> Void in
//            sender.transform = CGAffineTransformScale(sender.transform, 0.8, 0.8)
//            sender.backgroundColor = Global.redColor()
//            if let label = sender.subviews[0] as? UILabel {
//                label.textColor = UIColor.yellowColor()
//            }
//        }
        
        print(NSStringFromCGAffineTransform(sender.transform))
	}
    
    func jump(sender: UIButton) {
        showCatalog(sender.tag - 93456)
    }
    
    func touchOut(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            sender.transform = CGAffineTransformScale(sender.transform, 1.25, 1.25)
            sender.backgroundColor = UIColor.whiteColor()
            if let label = sender.subviews[0] as? UILabel {
                label.textColor = Global.redColor()
            }
            }, completion: nil)
        
//        UIView.animateWithDuration(0.3) { () -> Void in
//            sender.transform = CGAffineTransformScale(sender.transform, 1.25, 1.25)
//            sender.backgroundColor = UIColor.whiteColor()
//            if let label = sender.subviews[0] as? UILabel {
//                label.textColor = Global.redColor()
//            }
//        }
        
    }

	func showCatalog(index: Int) {

		delay(seconds: 0.3) { () -> () in
			let contentVC = ContentViewController()
			contentVC.index = index
			contentVC.hidesBottomBarWhenPushed = true
			self.navigationController?.pushViewController(contentVC, animated: true)
		}
	}
}
