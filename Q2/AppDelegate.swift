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
			guard let last = fullType.components(separatedBy: ".").last else { return nil }
			self.init(rawValue: last)
		}

		var type: String {
			return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
		}
	}

	static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"

	var launchedShortcutItem: UIApplicationShortcutItem?

	func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
		var handled = false

		guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }
		guard let shortCutType = shortcutItem.type as String? else { return false }
		guard let controller = window!.rootViewController as! NavigationController? else { return false }
		guard let topVC = controller.topViewController as? HomepageViewController else { return false }

		switch (shortCutType) {
		case ShortcutIdentifier.First.type:
			topVC.gotoVCBaseOnIndex(5)
			handled = true
			break
		case ShortcutIdentifier.Second.type:
			topVC.gotoVCBaseOnIndex(4)
			handled = true
			break
		case ShortcutIdentifier.Third.type:
			topVC.gotoVCBaseOnIndex(6)
			handled = true
			break
		default:
			break
		}

		return handled
	}

	// MARK: Application Life Cycle


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window!.backgroundColor = UIColor.white

		// MARK: Shortcut

		var shouldPerformAdditionalDelegateHandling = true

		if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
			launchedShortcutItem = shortcutItem
			shouldPerformAdditionalDelegateHandling = false
		}

		if let shortcutItems = application.shortcutItems , shortcutItems.isEmpty {
            let icon = UIApplicationShortcutIcon(templateImageName: "公式换算")
            
			let shortcut1 = UIApplicationShortcutItem(type: ShortcutIdentifier.First.type, localizedTitle: "算电量", localizedSubtitle: nil, icon: icon, userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
				])
			let shortcut2 = UIApplicationShortcutItem(type: ShortcutIdentifier.Second.type, localizedTitle: "算功率", localizedSubtitle: nil, icon: icon, userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
				])
			let shortcut3 = UIApplicationShortcutItem(type: ShortcutIdentifier.Third.type, localizedTitle: "算电阻", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "公式换算"), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
				])

			application.shortcutItems = [shortcut1, shortcut2, shortcut3]
		}

		// MARK: Base

		let infoVC = HomepageViewController()
		infoVC.beginnerRecords = beginnerRecords
		infoVC.intermediateRecords = intermediateRecords
		infoVC.advancedRecords = advancedRecords
        
//        let mainVC = MainViewController()
//        mainVC.beginnerRecords = beginnerRecords
//        mainVC.intermediateRecords = intermediateRecords
//        mainVC.advancedRecords = advancedRecords

        let testInfoNavi = NavigationController(rootViewController: infoVC)
        testInfoNavi.setNavigationBarHidden(true, animated: true)
		window?.rootViewController = testInfoNavi
		window?.makeKeyAndVisible()

		try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)

		return shouldPerformAdditionalDelegateHandling
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		guard let shortcut = launchedShortcutItem else { return }
		let _ = handleShortCutItem(shortcut)
		launchedShortcutItem = nil
	}

	func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
		let handledShortCutItem = handleShortCutItem(shortcutItem)
		completionHandler(handledShortCutItem)
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		saveRecord()
	}

	func applicationWillTerminate(_ application: UIApplication) {
		saveRecord()
	}

}

