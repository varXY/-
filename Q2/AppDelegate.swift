//
//  AppDelegate.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	var beginnerRecords = Records(type: 0)
	var intermediateRecords = Records(type: 1)

	func saveRecord() {
		beginnerRecords.saveRecords()
		intermediateRecords.saveRecords()
	}

	func customizeAppearance() {
		let tintColor = Global.redColor()
		UITabBar.appearance().tintColor = tintColor
	}

	// MARK: Shortcut

	enum ShortcutIdentifier: String {
		case First
		case Second
		case Third

		init?(fullType: String) {
			guard let last = fullType.componentsSeparatedByString(".").last else { return nil }

			self.init(rawValue: last)
		}

		var type: String {
			return NSBundle.mainBundle().bundleIdentifier! + ".\(self.rawValue)"
		}
	}

	static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"

	var launchedShortcutItem: UIApplicationShortcutItem?

	func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
		var handled = false

		guard let controller = window!.rootViewController as! TabBarController? else { return false }

		guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }

		guard let shortCutType = shortcutItem.type as String? else { return false }

		switch (shortCutType) {
		case ShortcutIdentifier.First.type:
			controller.selectedIndex = 1
			guard let naviTestVC = controller.selectedViewController as! NavigationController? else { return false }
			let topVC = naviTestVC.topViewController

			if topVC!.isKindOfClass(TestViewController) {
				let testVC = topVC as! TestViewController
				testVC.pushOrPresent(0)
			}

			handled = true
			break
		case ShortcutIdentifier.Second.type:
			controller.selectedIndex = 1
			guard let naviTestVC = controller.selectedViewController as! NavigationController? else { return false }
			let topVC = naviTestVC.topViewController

			if topVC!.isKindOfClass(TestViewController) {
				let testVC = topVC as! TestViewController
				testVC.pushOrPresent(1)
			}
			handled = true
			break
		case ShortcutIdentifier.Third.type:
			controller.selectedIndex = 2
			handled = true
			break
		default:
			break
		}



		return handled
	}

	// MARK: Application Life Cycle


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
		self.window!.backgroundColor = UIColor.whiteColor()

		// MARK: Shortcut

		var shouldPerformAdditionalDelegateHandling = true

		if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {

			launchedShortcutItem = shortcutItem

			shouldPerformAdditionalDelegateHandling = false
		}

		if let shortcutItems = application.shortcutItems where shortcutItems.isEmpty {

			let shortcut1 = UIApplicationShortcutItem(type: ShortcutIdentifier.First.type, localizedTitle: "初级试题", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			let shortcut2 = UIApplicationShortcutItem(type: ShortcutIdentifier.Second.type, localizedTitle: "中级试题", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			let shortcut3 = UIApplicationShortcutItem(type: ShortcutIdentifier.Third.type, localizedTitle: "公式换算", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "公式换算"), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			application.shortcutItems = [shortcut1, shortcut2, shortcut3]
		}

		// MARK: Base
		let infoVC = InfoViewController()
		let infoNavi = NavigationController(viewController: infoVC)
		infoNavi.tabBarItem = UITabBarItem(title: "常用知识", image: UIImage(named: "常用知识"), tag: 0)

		let testVC = TestViewController()
		let testNavi = NavigationController(viewController: testVC)
        testNavi.fd_fullscreenPopGestureRecognizer.enabled = false
		testNavi.tabBarItem = UITabBarItem(title: "电工试题", image: UIImage(named: "电工试题"), tag: 1)
		let controller = testNavi.viewControllers[0] as! TestViewController
		controller.beginnerRecords = beginnerRecords
		controller.intermediateRecords = intermediateRecords

		let scaleVC = ScaleViewController()
		let scaleNavi = NavigationController(viewController: scaleVC)
		scaleNavi.tabBarItem = UITabBarItem(title: "公式换算", image: UIImage(named: "公式换算"), tag: 2)

		let tabbarController = TabBarController()
		tabbarController.viewControllers = [infoNavi, testNavi, scaleNavi]
		tabbarController.selectedIndex = 1

		let testInfo = InfoViewController()
		self.window?.rootViewController = testInfo

		customizeAppearance()

		try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)

		self.window?.makeKeyAndVisible()

		return shouldPerformAdditionalDelegateHandling
	}

	func applicationDidBecomeActive(application: UIApplication) {
		guard let shortcut = launchedShortcutItem else { return }

		handleShortCutItem(shortcut)

		launchedShortcutItem = nil
	}

	func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
		let handledShortCutItem = handleShortCutItem(shortcutItem)

		completionHandler(handledShortCutItem)
	}

	func applicationDidEnterBackground(application: UIApplication) {
		saveRecord()
	}

	func applicationWillTerminate(application: UIApplication) {
		saveRecord()
	}


}

