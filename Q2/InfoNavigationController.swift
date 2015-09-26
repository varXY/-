//
//  InfoNavigationController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class InfoNavigationController: UINavigationController {

	convenience init() {
		let infoVC = InfoViewController()
		self.init(rootViewController: infoVC)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationBar.barTintColor = Global.redColor()
		self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		self.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationBar.translucent = true
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}


}
