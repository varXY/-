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

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "换算"
		self.view.backgroundColor = UIColor.grayColor()

		let buttons = generator.genButtonsForScale()
		var tag = -1
		for i in buttons {
			tag++
			i.addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
			i.tag = tag
			self.view.addSubview(i)
		}
		
	}

	func open(sender: UIButton) {
		let equationVC = EquationViewController()
		equationVC.index = sender.tag
		self.navigationController?.pushViewController(equationVC, animated: true)
	}
}
