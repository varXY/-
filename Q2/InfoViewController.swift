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
	var littleButtons = [UIButton]()
	var littleButtons_2 = [UIButton]()
	var knowledge = Knowledge()
	var global = Global()


	override func viewDidLoad() {
		super.viewDidLoad()
		global.size = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
		self.view.backgroundColor = UIColor.grayColor()

		self.title = "常用知识"

		littleButtons = generator.genLitteButtons()
		BigButtons = generator.genButtonsForInfo()

		for button in littleButtons {
			self.view.addSubview(button)
		}

		for i in 0..<BigButtons.count {
			BigButtons[i].addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
			self.view.addSubview(BigButtons[i])
		}

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = false

		for button in BigButtons {
			button.hidden = false
		}

		for i in 0..<3 {
			self.BigButtons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
		}

		for button in self.littleButtons {
			let delay = arc4random_uniform(4)
			button.genAnimation(.MovingAround, delay: Double(delay), distance: 0.0)
		}

		// self.navigationController?.delegate?.navigationController!(self.navigationController!, willShowViewController: self, animated: true)

	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = false

	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "ShowDetail" {
			let controller = segue.destinationViewController as! ContentViewController
			controller.index = sender as! Int
		}
	}

	func open(sender: UIButton) {
		showCatalog(sender.tag - 93456)
	}

	func showCatalog(index: Int) {

		for button in BigButtons {
			if index == BigButtons.indexOf(button) {
				button.genAnimation(.Touched, delay: 0.0, distance: 0.0)
			} else {
				button.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
			}
		}

		delay(seconds: 0.5) { () -> () in
			let contentVC = ContentViewController()
			contentVC.index = index
			self.navigationController?.pushViewController(contentVC, animated: true)
		}
	}
}
