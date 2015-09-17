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

	init() {
		loadRecords()
	}

	func documentDiretory() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) 
		return paths[0]
	}

	func dataFilePath() -> String {
		let fileURl = NSURL(fileURLWithPath: documentDiretory(), isDirectory: true)
		fileURl.URLByAppendingPathComponent("Records.plist", isDirectory: true)
		return fileURl.path!
		// documentDiretory().stringByAppendingPathComponent("Records.plist")
	}

	func saveRecords() {
		let data = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
		archiver.encodeObject(records, forKey: "Records")
		archiver.finishEncoding()
		data.writeToFile(dataFilePath(), atomically: true)
	}

	func loadRecords() {
		let path = dataFilePath()
		if NSFileManager.defaultManager().fileExistsAtPath(path) {
			if let data = NSData(contentsOfFile: path) {
				let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
				records = unarchiver.decodeObjectForKey("Records") as! [Record]
				unarchiver.finishDecoding()
			}
		}
	}
}