//
//  Question+NumberInStack.swift
//  电工助手
//
//  Created by Bobo on 1/27/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


extension Question {
    
    func getQestions(_ numberOfQuestions: Int, type: Int) -> [Question] {
        var questionMarks = [Int]()
        var questions = [Question]()
		let lastTimeNumbers = testedNumbersInStack(type)

        switch type {
        case 0:
            questionMarks = getRandomNumbers(numberOfQuestions, uiform: 301, without: lastTimeNumbers)
            saveNumbersIntoStack(type, numbers: questionMarks)
			questionMarks.forEach({
				!lastTimeNumbers.contains($0) ? questions.append(getBeginnerQuestion($0)!) : print("get same question within 3 times")
			})
        case 1:
            questionMarks = getRandomNumbers(numberOfQuestions, uiform: 233, without: lastTimeNumbers)
            saveNumbersIntoStack(type, numbers: questionMarks)
			questionMarks.forEach({
				!lastTimeNumbers.contains($0) ? questions.append(getIntermediateQuestions($0)!) : print("get same question within 3 times")
			})
		case 2:
			questionMarks = getRandomNumbers(numberOfQuestions, uiform: 251, without: lastTimeNumbers)
			saveNumbersIntoStack(type, numbers: questionMarks)
			questionMarks.forEach({
				!lastTimeNumbers.contains($0) ? questions.append(getAdvancedQuestion($0)!) : print("get same question within 3 times")
			})
        default:
            break
        }

        return questions
    }
    
    func getRandomNumbers(_ amount: Int, uiform: UInt32, without: [Int]) -> [Int] {
        var result = [Int]()
        
        repeat {
            let number = Int(arc4random_uniform(uiform))
            result.append(number)
            result = uniq(result)
			result = result.filter({ !without.contains($0) })
        } while result.count < amount

        return result
    }
    
    func saveNumbersIntoStack(_ type: Int, numbers: [Int]) {
        let userDefaults = UserDefaults.standard
        
        switch type {
        case 0:
            let tested_0_0 = userDefaults.object(forKey: "Tested_0_0") as? [Int] ?? [-1]
            userDefaults.set(tested_0_0, forKey: "Tested_0_1")
            userDefaults.set(numbers, forKey: "Tested_0_0")
        case 1:
            let tested_1_0 = userDefaults.object(forKey: "Tested_1_0") as? [Int] ?? [-1]
            userDefaults.set(tested_1_0, forKey: "Tested_1_1")
            userDefaults.set(numbers, forKey: "Tested_1_0")
		case 2:
			let tested_1_0 = userDefaults.object(forKey: "Tested_2_0") as? [Int] ?? [-1]
			userDefaults.set(tested_1_0, forKey: "Tested_2_1")
			userDefaults.set(numbers, forKey: "Tested_2_0")
        default:
            break
        }

		userDefaults.synchronize()
    }
    
    func testedNumbersInStack(_ type: Int) -> [Int] {
        let userDefaults = UserDefaults.standard
        var numbers = [Int]()

		switch type {
		case 0:
			numbers = userDefaults.object(forKey: "Tested_0_0") as? [Int] ?? [-1]
			numbers += userDefaults.object(forKey: "Tested_0_1") as? [Int] ?? [-1]
		case 1:
			numbers = userDefaults.object(forKey: "Tested_1_0") as? [Int] ?? [-1]
			numbers += userDefaults.object(forKey: "Tested_1_1") as? [Int] ?? [-1]
		case 2:
			numbers = userDefaults.object(forKey: "Tested_2_0") as? [Int] ?? [-1]
			numbers += userDefaults.object(forKey: "Tested_2_1") as? [Int] ?? [-1]
		default:
			break
		}

        return numbers
    }
}
