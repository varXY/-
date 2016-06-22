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

	convenience init(viewController: UIViewController) {
		self.init(rootViewController: viewController)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationBar.barTintColor = UIColor.themeRed()
		navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		navigationBar.tintColor = UIColor.whiteColor()
		navigationBar.translucent = false
        
		delegate = self
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	func captureScreen() -> UIImage {

		let screen = UIApplication.sharedApplication().windows[0]

		UIGraphicsBeginImageContextWithOptions(screen.frame.size, false, 0)
		view.drawViewHierarchyInRect(screen.bounds, afterScreenUpdates: true)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		var rect = CGRect()

		if ScreenHeight == 736 {
			rect = CGRect(x: 0, y: 20, width: ScreenWidth * 3, height: ScreenHeight * 3 - 20)
		} else {
			rect = CGRect(x: 0, y: 20, width: ScreenWidth * 2, height: ScreenHeight * 2 - 20)
		}

		let cuttedmage = CGImageCreateWithImageInRect(image.CGImage, rect)
		let resultImage = UIImage(CGImage: cuttedmage!)

		return resultImage
	}
}

extension NavigationController: UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        
//        if viewController.isKindOfClass(HomepageViewController) {
//            self.setNavigationBarHidden(true, animated: true)
//            let rect = CGRectMake(0, 0, self.view.frame.width, 64)
//            self.navigationBar.setBackgroundImage(UIImage.imageWithColor(Global.redColor(), rect: rect), forBarMetrics: UIBarMetrics.Default)
//            self.navigationBar.shadowImage = UIImage.imageWithColor(UIColor.clearColor(), rect: CGRectMake(0, 0, 10, 10))
//		} else {
//			self.navigationBar.barTintColor = UIColor(red: 60/255, green: 65/255, blue: 80/255, alpha: 1.0)
//		}


    }
}

