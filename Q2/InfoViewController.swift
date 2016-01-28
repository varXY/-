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
	var BigButtons = [UIButton]()
	var knowledge = Knowledge()
	var global = Global()


	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = Global.redColor()
		self.navigationItem.title = "常用知识"

        BigButtons = generator.genButtonsForInfo()
        for i in 0..<BigButtons.count {
            BigButtons[i].alpha = 0.0
            BigButtons[i].addTarget(self, action: "open:", forControlEvents: .TouchDown)
            BigButtons[i].addTarget(self, action: "jump:", forControlEvents: .TouchUpInside)
            BigButtons[i].addTarget(self, action: "touchOut:", forControlEvents: .TouchUpOutside)
            self.view.addSubview(BigButtons[i])
        }
        
        BigButtons[2].frame.origin.y -= 78.5

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        
		for i in 0..<3 {
            BigButtons[i].hidden = false
            
            BigButtons[i].backgroundColor = UIColor.whiteColor()
            if let label = BigButtons[i].subviews[0] as? UILabel {
                label.textColor = Global.redColor()
            }
            
            BigButtons[i].alpha = 1.0
			BigButtons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
            BigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
            BigButtons[i].subviews[0].transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
            print(NSStringFromCGAffineTransform(BigButtons[i].transform))
		}
        


	}
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        for i in 0..<3 {
            BigButtons[i].alpha = 0.0
            BigButtons[i].transform = CGAffineTransformIdentity
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
