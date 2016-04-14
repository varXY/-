//
//  Question+NumberInStack.swift
//  电工助手
//
//  Created by Bobo on 1/27/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


extension Question {
    
    func getQestions(numberOfQuestions: Int, type: Int) -> [Question] {
        var questionMarks = [Int]()
        var questions = [Question]()
        
        switch type {
        case 0:
            let lastTimeNumbers = testedNumbersInStack(0)
            questionMarks = getRandomNumbers(numberOfQuestions, uiform: 301, without: lastTimeNumbers)
            saveNumbersIntoStack(0, numbers: questionMarks)
            for i in questionMarks {
                if let _ = lastTimeNumbers.indexOf(i) {
                    fatalError("get same question within 3 times")
                }
            }
            for i in questionMarks { questions.append(getBeginnerQuestion(i)!) }
            
        case 1:
            let lastTimeNumbers = testedNumbersInStack(1)
            questionMarks = getRandomNumbers(numberOfQuestions, uiform: 233, without: lastTimeNumbers)
            saveNumbersIntoStack(1, numbers: questionMarks)
            for i in questionMarks {
                if let _ = lastTimeNumbers.indexOf(i) {
                    fatalError("get same question within 3 times")
                }
            }
            for i in questionMarks { questions.append(getIntermediateQuestions(i)!) }
            
        default:
            break
            
        }
        
        return questions
    }
    
    func getRandomNumbers(amount: Int, uiform: UInt32, without: [Int]) -> [Int] {
        var result = [Int]()
        
        repeat {
            let number = Int(arc4random_uniform(uiform))
            
            if let sameAtIndex = result.indexOf(number) {
                result.removeAtIndex(sameAtIndex)
            }
            
            result.append(number)
            
            for tested in without {
                if let index = result.indexOf(tested) {
                    result.removeAtIndex(index)
                }
            }
            
        } while result.count < amount
        
        
        return result
    }
    
    func saveNumbersIntoStack(type: Int, numbers: [Int]) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        switch type {
        case 0:
            let tested_0_0 = userDefaults.objectForKey("Tested_0_0") as? [Int] ?? [-1]
            userDefaults.setObject(tested_0_0, forKey: "Tested_0_1")
            userDefaults.setObject(numbers, forKey: "Tested_0_0")
        case 1:
            let tested_1_0 = userDefaults.objectForKey("Tested_1_0") as? [Int] ?? [-1]
            userDefaults.setObject(tested_1_0, forKey: "Tested_1_1")
            userDefaults.setObject(numbers, forKey: "Tested_1_0")
        default:
            break
        }

		userDefaults.synchronize()
    }
    
    func testedNumbersInStack(type: Int) -> [Int] {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var numbers = [Int]()
        
        if type == 0 {
            numbers = userDefaults.objectForKey("Tested_0_0") as? [Int] ?? [-1]
            numbers += userDefaults.objectForKey("Tested_0_1") as? [Int] ?? [-1]
        } else {
            numbers = userDefaults.objectForKey("Tested_1_0") as? [Int] ?? [-1]
            numbers += userDefaults.objectForKey("Tested_1_1") as? [Int] ?? [-1]
        }
        
        return numbers
    }
}