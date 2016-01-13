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

	override func viewDidLoad() {
		super.viewDidLoad()
        self.view.backgroundColor = Global.backgroundColor()
		self.navigationItem.title = "换算"

		buttons = generator.genButtonsForScale()
		for i in 0..<4 {
			buttons[i].addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
			buttons[i].tag = i + 345
			self.view.addSubview(buttons[i])
		}

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		for button in buttons {
			button.hidden = false
		}

		for i in 0..<4 {
			let button = self.view.viewWithTag(i + 345) as! UIButton
			let j = ( i != 0 && i != 1 ? i - 1 : i)
			button.genAnimation(.Appear, delay: 0.1 * Double(j), distance: 30 + CGFloat(j) * 40)
		}

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
		equationVC.hidesBottomBarWhenPushed = true

		delay(seconds: 0.5) { () -> () in
			self.navigationController?.pushViewController(equationVC, animated: true)
		}
	}
}
