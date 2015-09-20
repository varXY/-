//
//  AppDelegate.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	let records = Records()

	func saveRecord() {
		records.saveRecords()
	}

	func customizeAppearance() {
		let tintColor = UIColor.redColor()
		UITabBar.appearance().tintColor = tintColor
	}


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
		self.window!.backgroundColor = UIColor.whiteColor()

		let infoNavi = InfoNavigationController()
		infoNavi.tabBarItem = UITabBarItem(title: "常用知识", image: nil, tag: 0)

		let testNavi = TestNavigationController()
		testNavi.tabBarItem = UITabBarItem(title: "电工试题", image: nil, tag: 1)
		let controller = testNavi.viewControllers[0] as! TestViewController
		controller.records = records

		let scaleNavi = ScaleNavigationController()
		scaleNavi.tabBarItem = UITabBarItem(title: "公式换算", image: nil, tag: 2)

		let tabbarController = TabBarController()
		tabbarController.viewControllers = [infoNavi, testNavi, scaleNavi]
		tabbarController.selectedIndex = 1

		self.window?.rootViewController = tabbarController
		customizeAppearance()

		self.window?.makeKeyAndVisible()

		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		saveRecord()
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		saveRecord()
	}


}

