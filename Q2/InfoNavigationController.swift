//
//  InfoNavigationController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class InfoNavigationController: UINavigationController, UINavigationControllerDelegate {

	convenience init() {
		let infoVC = InfoViewController()
		self.init(rootViewController: infoVC)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.delegate = self
		colorForViewController("type1")
	}

	func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
		// println(navigationController.viewControllers.count)

		if let controller = viewController as? InfoViewController {
			colorForViewController("type1")
		}

		if let controller = viewController as? ContentViewController {
			colorForViewController("type2")
		}

		if let controller = viewController as? DetailViewController {
			colorForViewController("type2")
		}

	}

	func colorForViewController(type: String) {
		switch type {
		case "type1":

			UIView.animateWithDuration(1.0, animations: { () -> Void in
				self.navigationBar.barTintColor = UIColor.redColor()
				self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
				self.navigationBar.tintColor = UIColor.whiteColor()
			})

		case "type2":

			UIView.animateWithDuration(1.0, animations: { () -> Void in
				self.navigationBar.barTintColor = UIColor.whiteColor()
				self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
				self.navigationBar.tintColor = UIColor.redColor()
			})

		default:
			break
		}
		
	}
}
