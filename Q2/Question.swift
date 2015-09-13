//
//  Question.swift
//  Questions
//
//  Created by 文川术 on 15/9/3.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation

class Question {
	var question: String = ""
	var rightAnswer: String = ""
	var wrongAnswer: String = ""

	func getQestions(numberOfQuestions: Int) -> [Question] {
		var questionMarks = [Int]()
		var questions = [Question]()

		questionMarks = getRandomNumbers(numberOfQuestions, uiform: 24)

		for i in questionMarks {
			questions.append(getQuestion(i)!)
		}

		return questions
	}

	func getRandomNumbers(amount: Int, uiform: UInt32) -> [Int] {
		var result = [Int]()

		do {
			let number = Int(arc4random_uniform(uiform))
			if let sameAtIndex = find(result, number) {
				result.removeAtIndex(sameAtIndex)
			}
			result.append(number)
		} while result.count < amount

		return result
	}

	func getQuestion(number: Int) -> Question? {
		var question = Question()

		switch number {
		case 0:
			question.question = "电气隔离变压器二次侧的导线长度多少合适？"
			question.rightAnswer = "不宜太长"
			question.wrongAnswer = "越长越好"
			return question
		case 1:
			question.question = "电工至少多长时间对漏电保护器用试验按钮试验一次？"
			question.rightAnswer = "每月"
			question.wrongAnswer = "每季度"
			return question
		case 2:
			question.question = "独立避雷针的接地体与其他邻近接地体之间的最小距离为："
			question.rightAnswer = "3m"
			question.wrongAnswer = "1.5m"
			return question
		case 3:
			question.question = "成套开关柜使用的漏电保护器，其动作电流应取："
			question.rightAnswer = "100mA"
			question.wrongAnswer = "150mA"
			return question
		case 4:
			question.question = "漏电保护装置的额定不动作电流不得低于额定动作电流的多少倍？"
			question.rightAnswer = "0.5倍"
			question.wrongAnswer = "0.35倍"
			return question
		case 5:
			question.question = "家用电器回路使用的漏电保护器，其动作电流应取："
			question.rightAnswer = "30mA"
			question.wrongAnswer = "50mA"
			return question
		case 5:
			question.question = "高灵敏度电流型漏电保护装置是指额定漏电动作电流多大及以下的漏电保护装置？"
			question.rightAnswer = "30mA"
			question.wrongAnswer = "60mA"
			return question
		case 6:
			question.question = "为防止电气火灾使用的漏电保护器，其动作电流应取："
			question.rightAnswer = "300mA"
			question.wrongAnswer = "500mA"
			return question
		case 7:
			question.question = "用于防止漏电火灾的漏电报警装置的动作电流约为："
			question.rightAnswer = "200-300mA"
			question.wrongAnswer = "300-400mA"
			return question
		case 8:
			question.question = "装设在烟囱顶端的用圆钢制作的避雷针，圆钢直径不得小于："
			question.rightAnswer = "20mm"
			question.wrongAnswer = "15mm"
			return question
		case 9:
			question.question = "电气隔离安全的实质是："
			question.rightAnswer = "将接地电网转换成不接地电网"
			question.wrongAnswer = "将不接地电网转换成接地电网"
			return question
		case 10:
			question.question = "单相安全隔离变压器的额定容量不应超过："
			question.rightAnswer = "10kVA"
			question.wrongAnswer = "15kVA"
			return question
		case 11:
			question.question = "FS 系列阀型避雷器主要由什么组成？"
			question.rightAnswer = "瓷套、火花间隙、非线性电阻"
			question.wrongAnswer = "瓷套、火花间隙、线性电阻"
			return question
		case 12:
			question.question = "上级漏电保护器的额定漏电流应比下级漏电保护器的额定漏电流大还是小？"
			question.rightAnswer = "大"
			question.wrongAnswer = "小"
			return question
		case 13:
			question.question = "《安全生产法》规定，生产经营单位应当在较大危险因素的生产经营场所和有关设施、设备上，设置明显的："
			question.rightAnswer = "安全警示标志"
			question.wrongAnswer = "正在施工标志"
			return question
		case 14:
			question.question = "安全隔离变压器输入回路与输出回路之间的绝缘电阻不应低于："
			question.rightAnswer = "5MΩ"
			question.wrongAnswer = "3MΩ"
			return question
		case 15:
			question.question = "标准上规定防雷装置的接地电阻一般指什么电阻？"
			question.rightAnswer = "冲击接地电阻"
			question.wrongAnswer = "工频接地电阻"
			return question
		case 16:
			question.question = "电流型漏电保护装置采用什么作为检测元件？"
			question.rightAnswer = "零序电流互感器"
			question.wrongAnswer = "零序电压互感器"
			return question
		case 17:
			question.question = "验电前，宜先在有电设备上进行试验，确认验电器良好；无法在有电设备上进行试验时，可用高压发生器等确证验电器良好。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 18:
			question.question = "电工作业人员包括从事电气装置运行、检修和试验工作的人员，不包括电气安装和装修人员。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 19:
			question.question = "送电操作前应除去或拆除为检修装设的临时安全措施和临时接地线。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 20:
			question.question = "接地体离建筑物墙基之间的地下距离不得小于1 m 。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 21:
			question.question = " PE线不得穿过漏电保护器，但PEN线可以穿过漏电保护器。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 22:
			question.question = "雷雨天气户外巡视应远离接地装置，并应穿绝缘靴。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 23:
			question.question = "宾馆客房内的插座应装设漏电保护装置。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		default:
			break
		}
		return nil
	}
}
