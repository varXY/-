//
//  UIView+.swift
//  电工助手
//
//  Created by 文川术 on 5/1/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

	func addShadow() {
		self.layer.masksToBounds = false
		self.layer.shadowRadius = 3
		self.layer.shadowOpacity = 0.3
		self.layer.shadowColor = UIColor.lightGray.cgColor
		self.layer.shadowOffset = CGSize(width: 0, height: 0)
	}
    
}
