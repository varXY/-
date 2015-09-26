//
//  Knowledge.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class Knowledge {

	var sectionTitle = ""
	var title: String = ""
	var subtitle: String = ""
	var stringImage: String = ""
	var Image = UIImage()
	var textBody: String = ""


	func getAll(number: Int) -> [[Knowledge]] {
		var allIcons = [[Knowledge]]()

		switch number {
		case 0:
			for i in 0..<3 {
				var icons = [Knowledge]()
				let rows = titlesInSection.index(0, i).titles.count
				for j in 0..<rows {
					let icon = unitAtIndex((i, j))
					icons.append(icon)
				}
				allIcons.append(icons)
			}
			return allIcons

		case 1:
			for i in 0..<10 {
				var icons = [Knowledge]()
				let rows = titlesInSection.index(1, i).titles.count
				for j in 0..<rows {
					let icon = iconAtIndex((i, j))
					icons.append(icon)
				}
				allIcons.append(icons)
			}
			return allIcons

		case 2:
			for i in 0..<5 {
				var icons = [Knowledge]()
				let rows = titlesInSection.index(2, i).titles.count
				for j in 0..<rows {
					let icon = introAtIndex((i, j))
					icons.append(icon)
				}
				allIcons.append(icons)
			}
			return allIcons

		default:
			return [[Knowledge]]()
		}

	}
	

	func getSearchedAll(searchText: String) -> [[Knowledge]] {
		let all = getAll(1)
		var searchedAll = [[Knowledge]]()
		var i = 0

		for icons in all {

			++i

			let result = icons.filter({ (icon) -> Bool in
				let text = icon.title
				if text.rangeOfString(searchText) != nil {
					return true
				}
				return false
			})

			if !result.isEmpty {
				searchedAll.append(result)
			}

			if i == all.count {
				break
			}
		}

		return searchedAll

	}


	//MARK: - Individual

	func unitAtIndex(index: (Int, Int)) -> Knowledge {
		let knowledge = Knowledge()

		knowledge.sectionTitle = SectionTitle.zero.titles[index.0]
		knowledge.title = titlesInSection.index(0, index.0).titles[index.1]
		knowledge.subtitle = Unit.index(0, index.0).unitSubtitles[index.1]
		knowledge.stringImage = Unit.index(0, index.0).stringImage[index.1]
		knowledge.textBody = textBodies.index(index.0, index.1).unitBody

		return knowledge
	}

	func iconAtIndex(index: (Int, Int)) -> Knowledge {
		let knowledge = Knowledge()

		let name = titlesInSection.index(1, index.0).titles[index.1]
		knowledge.sectionTitle = SectionTitle.one.titles[index.0]
		knowledge.title = name
		knowledge.Image = UIImage(named: name)!

		return knowledge
	}

	func introAtIndex(index: (Int, Int)) -> Knowledge {
		let knowledge = Knowledge()

		knowledge.sectionTitle = SectionTitle.two.titles[index.0]
		knowledge.title = titlesInSection.index(2, index.0).titles[index.1]
		knowledge.textBody = textBodies.index(index.0, index.1).introBody
		
		return knowledge
	}
	
}
