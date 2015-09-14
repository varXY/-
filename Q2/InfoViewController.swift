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
	var buttons = [UIButton]()
	var knowledge = Knowledge()
	var global = Global()

	override func viewDidLoad() {
		super.viewDidLoad()
		global.size = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
		self.view.backgroundColor = UIColor.grayColor()

		self.title = "常用知识"

		buttons = generator.genButtons()

		for button in buttons {
			self.view.addSubview(button)
		}

		for i in 0..<3 {
			let methodName = String(format: "open_%@", "\(i)")
			buttons[i].addTarget(self, action: Selector(methodName), forControlEvents: .TouchUpInside)
		}

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		hidesBottomBarWhenPushed = false

		for i in 0..<3 {
			self.buttons[i].genAnimation(.appear, delay: 0.2)
		}

		delay(seconds: 1.0) { () -> () in
			for i in 3..<13 {
				self.buttons[i].genAnimation(.movingAround, delay: 0.0)
			}
		}

		for button in buttons {
			button.hidden = false
		}

		self.navigationController?.delegate?.navigationController!(self.navigationController!, willShowViewController: self, animated: true)

	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		hidesBottomBarWhenPushed = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		hidesBottomBarWhenPushed = false

	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "ShowDetail" {
			let controller = segue.destinationViewController as! ContentViewController
			controller.index = sender as! Int
		}
	}

	func open_0() {
		showCatalog(0)
	}

	func open_1() {
		showCatalog(1)
	}

	func open_2() {
		showCatalog(2)
	}

	func showCatalog(index: Int) {

		buttons[index].genAnimation(.touched, delay: 0.0)
		for i in 0..<13 {
			if i != index {
				buttons[i].genAnimation(.disappear, delay: 0.0)
			}
		}
		delay(seconds: 0.5) { () -> () in
			let contentVC = ContentViewController()
			contentVC.index = index
			self.navigationController?.pushViewController(contentVC, animated: true)
		}
	}
}
