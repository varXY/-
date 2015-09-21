//
//  ScaleNavigationController.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class ScaleNavigationController: UINavigationController, UINavigationControllerDelegate {


	var statusBarStyle = UIStatusBarStyle.LightContent
	var statusBarHidden = false

	convenience init() {
		let scaleVC = ScaleViewController()
		self.init(rootViewController: scaleVC)
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		self.delegate = self
		self.navigationBar.translucent = true
		colorForViewController("type1")
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return statusBarStyle
	}

	override func prefersStatusBarHidden() -> Bool {
		return statusBarHidden
	}

	func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {

		if let _ = viewController as? InfoViewController {
			self.statusBarStyle = UIStatusBarStyle.LightContent
			super.setNeedsStatusBarAppearanceUpdate()
			colorForViewController("type1")

		}

		if let _ = viewController as? ContentViewController {
			colorForViewController("type2")

		}

		if let _ = viewController as? DetailViewController {
			colorForViewController("type2")
		}

	}

	func colorForViewController(type: String) {
		switch type {
		case "type1":

			UIView.animateWithDuration(1.0, animations: { () -> Void in
				self.navigationBar.barTintColor = Global.redColor()
				self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
				self.navigationBar.tintColor = UIColor.whiteColor()
			})

		case "type2":

			UIView.animateWithDuration(1.0, animations: { () -> Void in
				self.navigationBar.barTintColor = UIColor.whiteColor()
				self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
				self.navigationBar.tintColor = Global.redColor()
				self.statusBarStyle = UIStatusBarStyle.Default
				super.setNeedsStatusBarAppearanceUpdate()
			})

		default:
			break
		}
		
	}
}