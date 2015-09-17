//
//  EquationViewController.swift
//  Q2
//
//  Created by 文川术 on 15/9/15.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class EquationViewController: UIViewController {

	var index = 0
	var tableView = UITableView()
	var global = Global()
	var firstWords = [String]()
	var lastWords = [String]()
	var sectionTitle = ""
	var tag = 0
	var content = 0
	var A = 0
	var B = 0
	var C = 0
	var calculatedA = true

	override func viewDidLoad() {
		super.viewDidLoad()

		getWords(index)
		self.view.backgroundColor = UIColor.lightGrayColor()

		let rect = CGRect(x: 0, y: 0, width: global.size.width, height: global.size.height / 1.6)
		tableView = UITableView(frame: rect, style: .Grouped)
		tableView.backgroundColor = UIColor.grayColor()
		tableView.scrollEnabled = false
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)

		let textFields = genTextField()
		for textfield in textFields {
			view.addSubview(textfield)
		}

		textFields[0].becomeFirstResponder()
	}

	func genTextField() -> [UITextField] {
		var textFields = [UITextField]()

		let counts = (firstWords.count == 3 ? 3 : 4)

		for i in 0..<counts {
			let textField = UITextField()
			textField.frame = CGRect(x: 45, y: 64 + 32 + CGFloat(44 * i), width: global.size.width - 100, height: 40)
			textField.backgroundColor = UIColor.lightGrayColor()
			textField.placeholder = "请输入"
			textField.delegate = self
			textField.keyboardType = .NumberPad
			textField.textAlignment = .Right
			textField.tag = (i + 1) * 400
			textFields.append(textField)
		}

		return textFields
	}

	func getWords(index: Int) {
		firstWords = Equation(rawValue: index)!.firstWords
		lastWords = Equation(rawValue: index)!.lastWords
		sectionTitle = Equation(rawValue: index)!.sectionTitle
	}

	func calculate_0(tag: Int, content: Int) {

		if tag == 400 {
			A = content
			calculatedA = false

			if let field2 = view.viewWithTag(1200) as? UITextField {
				if B != 0 && A != 0 {
					C = A / B
					field2.text = (C == 0 ? "" : "\(C)")
				}

				if A == 0 {
					field2.text = ""
					calculatedA = true

				}
			}

		}

		if tag == 800 {
			B = content



			if let field0 = view.viewWithTag(400) as? UITextField {
				if calculatedA == true && C != 0 {
					A = C * B
					field0.text = (A == 0 ? "" : "\(A)")
				}
			}

			if let field2 = view.viewWithTag(1200) as? UITextField {
				if B != 0 && A != 0 && calculatedA == false {
					C = A / B
					field2.text = "\(C)"
				}

				if A == 0 || B == 0 {
					C = 0
					field2.text = ""
				}

			}

		}

		if tag == 1200 {
			C = content

			if let field0 = view.viewWithTag(400) as? UITextField {
				if calculatedA == true && B != 0 {
					A = C * B
					field0.text = (A == 0 ? "" : "\(A)")
				}
			}

			if let field1 = view.viewWithTag(800) as? UITextField {
				if C != 0 && A != 0 && calculatedA == false {
					B = A / C
					field1.text = (B == 0 ? "" : "\(B)")
				}
			}
		}


	}


	func calculate_1(tag: Int, content: Int) {

		if tag == 400 {
			A = content
			calculatedA = false

			if let field2 = view.viewWithTag(1200) as? UITextField {
				if B != 0 && A != 0 {
					C = A * B
					if C > 99999 {
						return
					}
					field2.text = (C == 0 ? "" : "\(C)")
				}

				if A == 0 {
					field2.text = ""
					calculatedA = true

				}
			}

		}

		if tag == 800 {
			B = content



			if let field0 = view.viewWithTag(400) as? UITextField {
				if calculatedA == true && C != 0 && B != 0 {
					A = C / B
					field0.text = "\(A)"
				}

			}

			if let field2 = view.viewWithTag(1200) as? UITextField {
				if B != 0 && A != 0 && calculatedA == false {
					C = A * B
					if C > 99999 {
						return
					}
					field2.text = "\(C)"
				}

				if A == 0 || B == 0 {
					C = 0
					field2.text = ""
				}

			}

		}

		if tag == 1200 {
			C = content

			if let field0 = view.viewWithTag(400) as? UITextField {
				if calculatedA == true && B != 0 {
					A = C / B
					field0.text = (A == 0 ? "" : "\(A)")
				}
			}

			if let field1 = view.viewWithTag(800) as? UITextField {
				if A != 0 && calculatedA == false {
					B = C / A
					field1.text = (B == 0 ? "" : "\(B)")
				}
			}
		}
		
		
	}

	func calculate_2(tag: Int, content: Int) {

		if tag == 400 {
			A = content


			if let field1 = view.viewWithTag(800) as? UITextField {
				B = A * 746
				field1.text = "\(B)"
			}

			if let field2 = view.viewWithTag(1200) as? UITextField {
				field2.text = "\(A)"
			}

			if let field3 = view.viewWithTag(1600) as? UITextField {
				field3.text = "\(A * 735)"
			}

		}

		if tag == 800 {
			B = content
			print(B)

			if let field0 = view.viewWithTag(400) as? UITextField {
				A = B / 746
				field0.text = "\(A)"
			}

			if let field2 = view.viewWithTag(1200) as? UITextField {
				field2.text = "\(B / 735)"
			}

			if let field3 = view.viewWithTag(1600) as? UITextField {
				field3.text = "\(B)"
			}

		}
		
		
	}

	func calculateWith(index: Int, tag: Int, content: Int) {
		switch index {
		case 0:
			self.calculate_0(tag, content: content)
		case 1:
			self.calculate_1(tag, content: content)
		case 2:
			self.calculate_1(tag, content: content)
		case 3:
			self.calculate_2(tag, content: content)
		default:
			self.calculate_0(tag, content: content)
		}

	}

}


extension EquationViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return firstWords.count
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 44
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID = "EquationCell"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? EquationCell

		if cell == nil {
			cell = EquationCell(style: .Default, reuseIdentifier: cellID)
		}
		cell!.configureForEquationCell(firstWords[indexPath.row], last: lastWords[indexPath.row])
		return cell!
	}

	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30
	}

	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sectionTitle
	}

}

extension EquationViewController: UITextFieldDelegate {

	func textFieldDidBeginEditing(textField: UITextField) {
		tag = textField.tag
	}

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		let oldText: NSString = textField.text!
		let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
		content = newText.integerValue
		if content > 999999 {
			return false
		}
		
		print(content)
		calculateWith(self.index, tag: self.tag, content: content)
		return true
	}
}


