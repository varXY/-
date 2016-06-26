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
	var advancedRecords = Records(type: 2)

	func saveRecord() {
		beginnerRecords.saveRecords()
		intermediateRecords.saveRecords()
		advancedRecords.saveRecords()
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

		guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }
		guard let shortCutType = shortcutItem.type as String? else { return false }
		guard let controller = window!.rootViewController as! NavigationController? else { return false }
		guard let topVC = controller.topViewController as? HomepageViewController else { return false }

		switch (shortCutType) {
		case ShortcutIdentifier.First.type:
			topVC.gotoVCBaseOnIndex(1)
			handled = true
			break
		case ShortcutIdentifier.Second.type:
			topVC.gotoVCBaseOnIndex(2)
			handled = true
			break
		case ShortcutIdentifier.Third.type:
			topVC.gotoVCBaseOnIndex(5)
			handled = true
			break
		default:
			break
		}

		return handled
	}

	// MARK: Application Life Cycle


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window!.backgroundColor = UIColor.whiteColor()

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
			let shortcut3 = UIApplicationShortcutItem(type: ShortcutIdentifier.Third.type, localizedTitle: "算电量", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "公式换算"), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			application.shortcutItems = [shortcut1, shortcut2, shortcut3]
		}

		// MARK: Base

//		let infoVC = HomepageViewController()
//		infoVC.beginnerRecords = beginnerRecords
//		infoVC.intermediateRecords = intermediateRecords
//		infoVC.advancedRecords = advancedRecords
        
        let mainVC = MainViewController()
        mainVC.beginnerRecords = beginnerRecords
        mainVC.intermediateRecords = intermediateRecords
        mainVC.advancedRecords = advancedRecords

        let testInfoNavi = NavigationController(rootViewController: mainVC)
//        testInfoNavi.setNavigationBarHidden(true, animated: true)
		window?.rootViewController = testInfoNavi
		window?.makeKeyAndVisible()

		try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)

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

