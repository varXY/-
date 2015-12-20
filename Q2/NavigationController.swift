//
//  NavigationViewController.swift
//  电工助手
//
//  Created by 文川术 on 12/20/15.
//  Copyright © 2015 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {

	var global = Global()

	convenience init(viewController: UIViewController) {
		self.init(rootViewController: viewController)
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
	
	func captureScreen() -> UIImage {

		let screen = UIApplication.sharedApplication().windows[0]

		UIGraphicsBeginImageContextWithOptions(screen.frame.size, false, 0)
		self.view.drawViewHierarchyInRect(screen.bounds, afterScreenUpdates: true)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		var rect = CGRect()

		if global.size.height == 736 {
			rect = CGRect(x: 0, y: 20, width: global.size.width * 3, height: global.size.height * 3 - 20)
		} else {
			rect = CGRect(x: 0, y: 20, width: global.size.width * 2, height: global.size.height * 2 - 20)
		}

		let cuttedmage = CGImageCreateWithImageInRect(image.CGImage, rect)
		let resultImage = UIImage(CGImage: cuttedmage!)

		return resultImage
	}
}