//
//  Record.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation

class Record: NSObject {
	
	var record: Int = 0
	var date = NSDate()

	init(record: Int, date: NSDate) {
		self.record = record
		self.date = date
	}

	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encode(record, forKey: "Record")
		aCoder.encode(date, forKey: "Date")
	}

	required init?(coder aDecoder: NSCoder) {
		record = aDecoder.decodeObject(forKey: "Record") as? Int ?? 0
        print(record)
        print(aDecoder.decodeObject(forKey: "Record"))
        
		date = aDecoder.decodeObject(forKey: "Date") as! NSDate
        print(date)
        print("-----------")
		super.init()
	}
}
