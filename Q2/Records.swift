//
//  Records.swift
//  Q2
//
//  Created by 文川术 on 15/9/14.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation

class Records {
	var records = [Record]()
	var showTimes: Int32 = 1

	let type: Int

	init(type: Int) {
		self.type = type
		loadRecords()
	}

	func documentDiretory() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		return paths[0]
	}

	func dataFilePath() -> String {
		switch type {
		case 0: return "\(documentDiretory())/Records.plist"
		case 1: return "\(documentDiretory())/Records1.plist"
		case 2: return "\(documentDiretory())/Records2.plist"
		default: return "\(documentDiretory())/Error.plist"
		}
	}

	func saveRecords() {
		let data = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
		archiver.encodeObject(records, forKey: "Records")
		archiver.encodeInt32(showTimes, forKey: "ShowTimes")
		archiver.finishEncoding()
		data.writeToFile(dataFilePath(), atomically: true)
	}

	func loadRecords() {
		let path = dataFilePath()

		if NSFileManager.defaultManager().fileExistsAtPath(path) {
			if let data = NSData(contentsOfFile: path) {
				let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
				records = unarchiver.decodeObjectForKey("Records") as! [Record]
				showTimes = unarchiver.decodeInt32ForKey("ShowTimes")
				unarchiver.finishDecoding()
			}
		}
	}
}