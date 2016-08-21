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
	var date = Date()

	init(record: Int, date: Date) {
		self.record = record
		self.date = date
	}

	func encode(with aCoder: NSCoder) {
		aCoder.encode(record, forKey: "Record")
		aCoder.encode(date, forKey: "Date")
	}

	required init?(coder aDecoder: NSCoder) {
		record = aDecoder.decodeObject(forKey: "Record") as! Int
		date = aDecoder.decodeObject(forKey: "Date") as! Date
		super.init()
	}
}
