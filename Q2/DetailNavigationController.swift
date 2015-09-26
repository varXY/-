//
//  DetailNavigationController.swift
//  Q2
//
//  Created by 文川术 on 15/9/19.
//  Copyright © 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class DetailNavigationController: UINavigationController {

	var global = Global()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationBar.barTintColor = Global.redColor()
		self.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationBar.translucent = true
		self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
}
