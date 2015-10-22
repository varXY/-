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
	var global = Global()

	var sectionTitle = ""
	var firstWords = [String]()
	var lastWords = [String]()

	var tag = 0
	var content: Double = 0
	var A: Double = 0
	var B: Double = 0
	var C: Double = 0
	var D: Double = 0
	var calculatedA = true
	var allowInput = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",  "."]

	var tableView = UITableView()


	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = Equation(rawValue: index)?.navigationTitle
		self.view.backgroundColor = Global.backgroundColor()

		getWords(index)

		let rect = CGRect(x: 0, y: 0, width: global.size.width, height: global.size.height)
		tableView = UITableView(frame: rect, style: .Grouped)
		tableView.backgroundColor = Global.backgroundColor()
		tableView.scrollEnabled = true
		tableView.allowsSelection = false
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)

		let textFields = genTextField()
		for textfield in textFields {
			tableView.addSubview(textfield)
		}

		customTextField(index)
		textFields[0].becomeFirstResponder()
	}

	func back() {
		self.navigationController?.popViewControllerAnimated(true)
	}



	func getWords(index: Int) {
		sectionTitle = Equation(rawValue: index)!.sectionTitle
		firstWords = Equation(rawValue: index)!.firstWords
		lastWords = Equation(rawValue: index)!.lastWords
	}


	func genTextField() -> [UITextField] {
		var textFields = [UITextField]()
		let counts = firstWords.count

		for i in 0..<counts {
			let numberTextField = NumberTextfield()
			let rect = CGRect(x: 75, y: 30 + (global.rowHeight) * CGFloat(i) + 3, width: global.size.width - 150, height: global.rowHeight - 6)
			let textField = numberTextField.getTextFields(rect)
			textField.delegate = self
			textField.tag = (i + 1) * 400
			textFields.append(textField)
		}

		return textFields
	}


	func customTextField(index: Int) {

		if index == 1 {
			let field4 = view.viewWithTag(2000) as! UITextField
			let field5 = view.viewWithTag(2400) as! UITextField
			let lightGrayColor = UIColor.lightGrayColor().CGColor

			field4.layer.borderColor = lightGrayColor
			field5.layer.borderColor = lightGrayColor

			field4.placeholder = ""
			field5.placeholder = ""

			field4.userInteractionEnabled = false
			field5.userInteractionEnabled = false
		}

		if index == 3 {
			let field2 = view.viewWithTag(1200) as! UITextField
			let field3 = view.viewWithTag(1600) as! UITextField
			let lightGrayColor = UIColor.lightGrayColor().CGColor

			field2.layer.borderColor = lightGrayColor
			field3.layer.borderColor = lightGrayColor

			field2.placeholder = ""
			field3.placeholder = ""

			field2.userInteractionEnabled = false
			field3.userInteractionEnabled = false
		}

	}


	func showAlert() {
		let alert = UIAlertController(title: "输入有误", message: "功率因素在0到1之间", preferredStyle: .Alert)
		let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
		alert.addAction(action)
		presentViewController(alert, animated: true, completion: nil)
	}


}



// MARK: - TableView

extension EquationViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return firstWords.count
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return global.rowHeight
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



// MARK: - TextFieldDelegate

extension EquationViewController: UITextFieldDelegate {

	func textFieldDidBeginEditing(textField: UITextField) {
		tag = textField.tag
	}

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

		if allowInput.indexOf(string) == nil && !string.isEmpty {
			return false
		}

		let oldText: NSString = textField.text!
		let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
		
		content = newText.doubleValue
		calculateWith(self.index, tag: self.tag, content: content)
		
		return true

	}

	
}



// MARK: - Calculation

extension EquationViewController {

	func calculateWith(index: Int, tag: Int, content: Double) {
		switch index {
		case 0:
			self.calculate_0(tag, content: content)
		case 1:
			self.calculate_1(tag, content: content)
		case 2:
			self.calculate_2(tag, content: content)
		case 3:
			self.calculate_3(tag, content: content)
		default:
			break
		}

	}


	func calculate_0(tag: Int, content: Double) {
		let field0 = view.viewWithTag(400) as! UITextField
		let field1 = view.viewWithTag(800) as! UITextField
		let field2 = view.viewWithTag(1200) as! UITextField

		switch tag {
		case 400:
			A = content
			calculatedA = (A == 0 ? true : false)
			C = (B == 0 ? 0 : A / B)

			field2.text = (C == 0 ? "" : sv(C))

		case 800:
			B = content

			if calculatedA == true {
				A = B * C
			} else {
				C = (B == 0 ? 0 : A / B)
			}

			field0.text = (A == 0 ? "" : sv(A))
			field2.text = (C == 0 ? "" : sv(C))

		case 1200:
			C = content

			if calculatedA == true {
				A = B * C
			} else {
				B = (C == 0 ? 0 : A / C)
			}

			field0.text = (A == 0 ? "" : sv(A))
			field1.text = (B == 0 ? "" : sv(B))

		default:
			break
		}


	}


	func calculate_1(tag: Int, content: Double) {
		let field0 = view.viewWithTag(400) as! UITextField
		let field1 = view.viewWithTag(800) as! UITextField
		let field2 = view.viewWithTag(1200) as! UITextField
		let field4 = view.viewWithTag(2000) as! UITextField
		let field5 = view.viewWithTag(2400) as! UITextField

		switch tag {
		case 400:
			A = content
			calculatedA = (A == 0 ? true : false)
			C = A * B

			if D >= 0 && D <= 1 && C != 0 {
				field4.text = (D == 0 ? "" : sv(C * D))
				field5.text = (D == 0 ? "" : sv(C - C * D))
			}

			field2.text = (C == 0 ? "" : "\(C)")

		case 800:
			B = content

			if calculatedA == true {
				A = (B == 0 ? 0 : C / B)
			} else {
				C = A * B

				if D >= 0 && D <= 1 && C != 0 {
					field4.text = (D == 0 ? "" : sv(C * D))
					field5.text = (D == 0 ? "" : sv(C - C * D))
				}
			}

			field0.text = (A == 0 ? "" : sv(A))
			field2.text = (C == 0 ? "" : sv(C))

		case 1200:
			C = content

			if calculatedA == true {
				A = (B == 0 ? 0 : C / B)
			} else {
				B = C / A
			}

			if D != 0 {
				field4.text = (C == 0 ? "" : sv(C * D))
				field5.text = (C == 0 ? "" : sv(C - C * D))
			}

			field0.text = (A == 0 ? "" : sv(A))
			field1.text = (B == 0 ? "" : sv(B))

		case 1600:
			D = content

			if D >= 0 && D <= 1 {
				if C != 0 {
					field4.text = (D == 0 ? "" : sv(C * D))
					field5.text = (D == 0 ? "" : sv(C - C * D))
				}
			} else {
				showAlert()
			}

		default:
			break
		}

	}

	func calculate_2(tag: Int, content: Double) {
		let field0 = view.viewWithTag(400) as! UITextField
		let field1 = view.viewWithTag(800) as! UITextField
		let field2 = view.viewWithTag(1200) as! UITextField

		switch tag {
		case 400:
			A = content
			calculatedA = (A == 0 ? true : false)
			C = A * B / 1000

			field2.text = (C == 0 ? "" : sv(C))

		case 800:
			B = content

			if calculatedA == true {
				A = (B == 0 ? 0 : C * 1000 / B)
			} else {
				C = A * B / 1000
			}

			field0.text = (A == 0 ? "" : sv(A))
			field2.text = (C == 0 ? "" : sv(C))

		case 1200:
			C = content

			if calculatedA == true {
				A = (B == 0 ? 0 : C * 1000 / B)
			} else {
				B = (A == 0 ? 0 : C * 1000 / A)
			}

			field0.text = (A == 0 ? "" : sv(A))
			field1.text = (B == 0 ? "" : sv(B))

		default:
			break
		}
	}

	func calculate_3(tag: Int, content: Double) {
		let field0 = view.viewWithTag(400) as! UITextField
		let field1 = view.viewWithTag(800) as! UITextField
		let field2 = view.viewWithTag(1200) as! UITextField
		let field3 = view.viewWithTag(1600) as! UITextField

		switch tag {
		case 400:
			A = content
			field1.text = (A == 0 ? "" : sv(A * 735.49875))
			field2.text = (A == 0 ? "" : sv(A * 735.49875 / 745.699872))
			field3.text = (A == 0 ? "" : sv(A * 735.49875))

		case 800:
			B = content
			field0.text = (B == 0 ? "" : sv(B / 735.49875))
			field2.text = (B == 0 ? "" : sv(B / 745.699872))
			field3.text = (B == 0 ? "" : sv(B))

		default:
			break
		}
	}

	// Get string value

	func sv(x: Double) -> String {
		let afterCut: Double = floor(x)

		if afterCut == x {
			var string = "\(afterCut)"
			string = String(string.characters.dropLast())
			string = String(string.characters.dropLast())
			return string
		} else {
			return "\(x)"
		}

	}


}


