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
let ScreenBounds = UIScreen.main.bounds
let ScreenWidth = ScreenBounds.width
let ScreenHeight = ScreenBounds.height
let ScreenCenter = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2)
let StatusBarHeight = UIApplication.shared.statusBarFrame.height

let CellHeight = ScreenHeight / 12
let globalRadius: CGFloat = 8

let appStoreURLString = "https://itunes.apple.com/cn/app/dian-gong-zhu-shou/id1044537172?l=en&mt=8"
let commentURLString = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1044537172&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"

// 日期和数字格式转换
let dateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "MM/dd/yy, HH:mm"
	return formatter
	}()

var priceFormatter: NumberFormatter = {
	let pf = NumberFormatter()
	pf.formatterBehavior = .behavior10_4
	pf.numberStyle = .currency
	return pf
}()


// 延迟执行
func delay(seconds: Double, completion:()->()) {
	let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
	DispatchQueue.main.asyncAfter(deadline: popTime) {
		completion()
	}
}

