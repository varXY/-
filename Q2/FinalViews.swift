//
//  FinalViews.swift
//  电工助手
//
//  Created by 文川术 on 5/1/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


struct FinalViews {
	let finalLabel: UILabel
	let buttons: [UIButton]

	init(rightCount: Int) {
		let labelLength = ScreenHeight / 2 - 20
		finalLabel = UILabel(frame: CGRect(x: (ScreenWidth - labelLength) / 2, y: (ScreenHeight / 2 - labelLength) / 2, width: labelLength, height: labelLength))
		finalLabel.numberOfLines = 0
		finalLabel.textAlignment = .center
		finalLabel.textColor = UIColor.white
		finalLabel.font = UIFont.boldSystemFont(ofSize: 22)
		finalLabel.backgroundColor = UIColor.lightRedColor()
		finalLabel.layer.cornerRadius = labelLength / 2
		finalLabel.clipsToBounds = true

		if rightCount < 5 {
			finalLabel.text = "只答对了\(rightCount)题，再接再厉！"
		}

		if rightCount == 5 {
			finalLabel.text = "答对了\(rightCount)题，还行。"
		}

		if rightCount > 5 && rightCount < 10 {
			finalLabel.text = "答对了\(rightCount)题，很棒！"
		}

		if rightCount == 10 {
			finalLabel.text = "竟然全答对了！太棒了！"
		}

		let height: CGFloat = ScreenHeight == 480 ? 40 : 60
		let buttonSize = CGSize(width: ScreenWidth - 60, height: height)
		let buttonFrames = [
			CGRect(x: 30, y: ScreenHeight * 0.45, width: buttonSize.width, height: buttonSize.height),
			CGRect(x: 30, y: ScreenHeight * 0.45 + (height + ScreenHeight * 0.013), width: buttonSize.width, height: buttonSize.height),
			CGRect(x: 30, y: ScreenHeight * 0.45 + (height + ScreenHeight * 0.013) * 2, width: buttonSize.width, height: buttonSize.height)
		]
		let buttonTitles = ["查看题目", "答题记录", "返回主页"]
		buttons = buttonFrames.map({
			let button = UIButton(type: .system)
			button.frame = $0
			button.setTitle(buttonTitles[buttonFrames.index(of: $0)!], for: UIControlState())
			button.titleLabel!.font = UIFont.systemFont(ofSize: 17)
			button.tintColor = UIColor.themeRed()
			button.backgroundColor = UIColor.white
			button.layer.cornerRadius = globalRadius
			button.addShadow()
			button.alpha = 0.7
			return button
		})
	}

}
