//
//  ImageCell.swift
//  Questions
//
//  Created by 文川术 on 15/9/8.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

	@IBOutlet weak var iconView: UIImageView!
	@IBOutlet weak var meanLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		selectedBackgroundView = UIView()
		selectedBackgroundView!.backgroundColor = UIColor.redColor()
	}

	func configureForImageCell(knowledge: Knowledge) {
		iconView.image = knowledge.Image
		meanLabel.text = knowledge.title
	}
	
}
