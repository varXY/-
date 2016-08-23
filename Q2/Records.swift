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
        loadRecords(type: type)
	}

	func documentDiretory() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		return paths[0]
	}

    func dataFilePath(type: Int) -> String {
		switch type {
		case 0: return "\(documentDiretory())/Records.plist"
		case 1: return "\(documentDiretory())/Records1.plist"
		case 2: return "\(documentDiretory())/Records2.plist"
		default: return "\(documentDiretory())/Error.plist"
		}
	}

	func saveRecords() {
		let data = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWith: data)
		archiver.encode(records, forKey: "Records")
        archiver.encode(showTimes, forKey: "ShowTimes")
		archiver.finishEncoding()
		data.write(toFile: dataFilePath(type: type), atomically: true)
	}

    func loadRecords(type: Int) {
		let path = dataFilePath(type: type)

		if FileManager.default.fileExists(atPath: path) {
			if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
				let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
				records = unarchiver.decodeObject(forKey: "Records") as! [Record]
				showTimes = unarchiver.decodeInt32(forKey: "ShowTimes")
				unarchiver.finishDecoding()
			}
		}
	}
}
