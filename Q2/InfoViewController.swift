//
//  InfoViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {

	var generator = Generator()
	var BigButtons = [UIButton]()
	var knowledge = Knowledge()
	var global = Global()


	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = Global.backgroundColor()
		self.navigationItem.title = "常用知识"

		BigButtons = generator.genButtonsForInfo()
		for i in 0..<BigButtons.count {
			BigButtons[i].addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
			self.view.addSubview(BigButtons[i])
		}

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		for button in BigButtons {
			button.hidden = false
		}

		for i in 0..<3 {
			self.BigButtons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
		}

	}


	func open(sender: UIButton) {
		showCatalog(sender.tag - 93456)
	}

	func showCatalog(index: Int) {

		for button in BigButtons {
			if index == BigButtons.indexOf(button) {
				button.genAnimation(.Touched, delay: 0.0, distance: 0.0)
			} else {
				button.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
			}
		}

		delay(seconds: 0.5) { () -> () in
			let contentVC = ContentViewController()
			contentVC.index = index
			contentVC.hidesBottomBarWhenPushed = true
			self.navigationController?.pushViewController(contentVC, animated: true)
		}
	}
}
