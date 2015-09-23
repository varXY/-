//
//  ScaleViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class ScaleViewController: UIViewController {

	var generator = Generator()
	var buttons = [UIButton]()
	var littleButtons = [UIButton]()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "公式换算"
		self.view.backgroundColor = Global.grayColor()

		buttons = generator.genButtonsForScale()
		littleButtons = generator.genLitteButtons(2)

		/*
		for button in littleButtons {
			self.view.addSubview(button)
		}
		*/
		
		for i in 0..<4 {
			buttons[i].addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
			buttons[i].tag = i + 345
			self.view.addSubview(buttons[i])
		}

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		hidesBottomBarWhenPushed = false

		for button in buttons {
			button.hidden = false
		}

		for i in 0..<4 {
			let button = self.view.viewWithTag(i + 345) as! UIButton
			let j = ( i != 0 && i != 1 ? i - 1 : i)
			button.genAnimation(.Appear, delay: 0.1 * Double(j), distance: 30 + CGFloat(j) * 40)
		}

		for button in littleButtons {
			let delay = arc4random_uniform(4)
			button.genAnimation(.MovingAround, delay: Double(delay), distance: 0.0)
		}
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = false
	}

	func open(sender: UIButton) {
		let index = sender.tag - 345

		for button in buttons {
			if index == buttons.indexOf(button) {
				button.genAnimation(.Touched, delay: 0.0, distance: 0.0)
			} else {
				button.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
			}
		}

		let equationVC = EquationViewController()
		equationVC.index = index

		delay(seconds: 0.5) { () -> () in
			self.navigationController?.pushViewController(equationVC, animated: true)
		}
	}
}
