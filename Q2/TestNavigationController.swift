//
//  TestNavigationController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class TestNavigationController: UINavigationController {

	convenience init() {
		let testVC = TestViewController()
		self.init(rootViewController: testVC)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.delegate = self
		self.navigationBar.tintColor = UIColor.redColor()
	}
}

extension TestNavigationController: UINavigationControllerDelegate {

	func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {

		if let controller = viewController as? TestViewController {
		}
		
		if let controller = viewController as? QuestionViewController {
			self.navigationBar.barTintColor = UIColor.blueColor()

		}
	}
}
