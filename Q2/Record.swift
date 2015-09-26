//
//  Record.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation

class Record: NSObject, NSCoding {
	
	var record: Int = 0
	var date = NSDate()

	init(record: Int, date: NSDate) {
		self.record = record
		self.date = date
	}

	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(record, forKey: "Record")
		aCoder.encodeObject(date, forKey: "Date")
	}

	required init?(coder aDecoder: NSCoder) {
		record = aDecoder.decodeObjectForKey("Record") as! Int
		date = aDecoder.decodeObjectForKey("Date") as! NSDate
		super.init()
	}
}
