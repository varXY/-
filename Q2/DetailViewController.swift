//
//  DetailViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

	var knowledege = Knowledge()
	var textView = UITextView()

	override func viewDidLoad() {
		super.viewDidLoad()

		textView.frame = view.bounds
		textView.textContainer.size = CGSize(width: textView.frame.width - 10, height: textView.frame.height)
		textView.font = UIFont.systemFontOfSize(18)
		self.view.addSubview(textView)
		
		self.title = knowledege.title
		textView.text = knowledege.textBody

	}
}