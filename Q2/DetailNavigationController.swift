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

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationBar.barTintColor = UIColor.redColor()
		self.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		self.toolbarHidden = true
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
}
