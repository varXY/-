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

		questionMarks = getRandomNumbers(numberOfQuestions, uiform: 4)

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
			question.question = "how old are you?"
			question.rightAnswer = "19"
			question.wrongAnswer = "18"
			return question
		case 1:
			question.question = "what's you name?"
			question.rightAnswer = "xiao"
			question.wrongAnswer = "yao"
			return question
		case 2:
			question.question = "where do you live?"
			question.rightAnswer = "here"
			question.wrongAnswer = "there"
			return question
		case 3:
			question.question = "what's next question?"
			question.rightAnswer = "I don't know"
			question.wrongAnswer = "just next it"
			return question
		default:
			break
		}
		return nil
	}
}
