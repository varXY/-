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
	var global = Global()

	var label = UILabel()
	var textView = UITextView()


	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()
		self.title = knowledege.title
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "share")
        self.navigationItem.rightBarButtonItem = shareButton

		label.frame = CGRect(x: 0, y: 0, width: global.size.width - 10, height: global.size.height - 64)
		label.font = UIFont.systemFontOfSize(18)
		label.numberOfLines = 0
		label.text = knowledege.textBody
		label.sizeToFit()

		textView.frame = CGRect(x: 0, y: 0, width: global.size.width, height: global.size.height - 64)
		textView.contentSize = CGSize(width: label.frame.width, height: label.frame.height)
		textView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 10, right: 5)
		textView.text = knowledege.textBody
		textView.font = UIFont.systemFontOfSize(18)
		textView.editable = false
		textView.contentOffset = CGPoint(x: 0.0, y: 0.0)
		view.addSubview(textView)

	}
    
    func share() {
        
    }

	func back() {
		self.navigationController?.popViewControllerAnimated(true)
	}
}