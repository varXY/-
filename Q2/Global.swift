//
//  SizeClass.swift
//  Q2
//
//  Created by 文川术 on 15/9/13.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


// 尺寸信息
let ScreenBounds = UIScreen.mainScreen().bounds
let ScreenWidth = ScreenBounds.width
let ScreenHeight = ScreenBounds.height
let ScreenCenter = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2)
let StatusBarHeight = UIApplication.sharedApplication().statusBarFrame.height

let CellHeight = ScreenHeight / 12
let globalRadius: CGFloat = 8

let appStoreURLString = "https://itunes.apple.com/cn/app/dian-gong-zhu-shou/id1044537172?l=en&mt=8"
let commentURLString = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1044537172&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"

// 日期和数字格式转换
let dateFormatter: NSDateFormatter = {
	let formatter = NSDateFormatter()
	formatter.dateFormat = "MM/dd/yy, HH:mm"
	return formatter
	}()

var priceFormatter: NSNumberFormatter = {
	let pf = NSNumberFormatter()
	pf.formatterBehavior = .Behavior10_4
	pf.numberStyle = .CurrencyStyle
	return pf
}()


// 延迟执行
func delay(seconds seconds: Double, completion:()->()) {
	let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
	dispatch_after(popTime, dispatch_get_main_queue()) {
		completion()
	}
}

