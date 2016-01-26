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
		self.view.backgroundColor = Global.backgroundColor()
		self.navigationItem.title = "常用知识"

		

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        
        BigButtons = generator.genButtonsForInfo()
        for i in 0..<BigButtons.count {
            BigButtons[i].addTarget(self, action: "open:", forControlEvents: .TouchDown)
            self.view.addSubview(BigButtons[i])
            //            BigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
        }
        
        BigButtons[2].frame.origin.y -= 77
//        BigButtons[2].setTitle("hello", forState: .Normal)
//        BigButtons[2].titleLabel?.backgroundColor = UIColor.lightGrayColor()
//        BigButtons[2].titleLabel?.sizeToFit()
//        BigButtons[2].clipsToBounds = false
//        BigButtons[2].titleLabel?.transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))

		
		for i in 0..<3 {
			self.BigButtons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
            BigButtons[i].transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
            print(NSStringFromCGAffineTransform(BigButtons[i].transform))
		}
        
        for button in BigButtons {
            button.hidden = false
            
            let titleLabel = UILabel()
            titleLabel.frame.size = CGSize(width: button.frame.size.width, height: 40)
            titleLabel.center = CGPoint(x: button.frame.width / 2, y: button.frame.height / 2 - 10)
            titleLabel.font = UIFont.systemFontOfSize(18)
            titleLabel.text = "this is a test"
            titleLabel.textColor = UIColor.redColor()
            titleLabel.textAlignment = .Center
            titleLabel.sizeToFit()
            titleLabel.transform = CGAffineTransformMakeRotation(CGFloat(-45 * M_PI / 180))
            button.addSubview(titleLabel)
        }

	}


	func open(sender: UIButton) {
		showCatalog(sender.tag - 93456)
	}

	func showCatalog(index: Int) {

		for button in BigButtons {
			if index == BigButtons.indexOf(button) {
                button.transform = CGAffineTransformScale(button.transform, 0.8, 0.8)
                print(NSStringFromCGAffineTransform(button.transform))
//				button.genAnimation(.Touched, delay: 0.0, distance: 0.0)
			} else {
//				button.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
			}
		}

//		delay(seconds: 0.5) { () -> () in
//			let contentVC = ContentViewController()
//			contentVC.index = index
//			contentVC.hidesBottomBarWhenPushed = true
//			self.navigationController?.pushViewController(contentVC, animated: true)
//		}
	}
}
