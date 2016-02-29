//
//  Describe_1CellTableViewCell.swift
//  Questions
//
//  Created by 文川术 on 15/9/5.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import UIKit

class DescribeCell: UITableViewCell {


	@IBOutlet weak var picLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
		picLabel.textColor = UIColor.themeRed()
		picLabel.alpha = 0.8
		selectedBackgroundView = UIView()
		selectedBackgroundView!.backgroundColor = UIColor.lightRedColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

	func configureForDescribeCell(knowledge: Knowledge) {
		titleLabel.text = knowledge.title
		detailLabel.text = knowledge.subtitle
		picLabel.text = knowledge.stringImage
	}

}
