//
//  IntroCell.swift
//  Questions
//
//  Created by 文川术 on 15/9/10.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

class IntroCell: UITableViewCell {

	@IBOutlet weak var titlelabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		selectedBackgroundView = UIView()
		selectedBackgroundView!.backgroundColor = Global.redColor()
	}

	func configureForIntroCell(knowledge: Knowledge) {
		titlelabel.text = knowledge.title

	}
}
