//
//  ScaleNavigationController.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class ScaleNavigationController: UINavigationController {

	convenience init() {
		let scaleVC = ScaleViewController()
		self.init(rootViewController: scaleVC)
	}


	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationBar.barTintColor = Global.redColor()
		self.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		self.navigationBar.translucent = true
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}


}