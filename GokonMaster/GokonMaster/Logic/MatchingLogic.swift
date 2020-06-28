//
//  MatchingLogic.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/06/27.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

public func matchingMainLogic() {
	var maleList: Array<Int>	= Array<Int>()
	var femaleList: Array<Int>	= Array<Int>()
	for oneMale in maleArray {
		maleList.append(oneMale.index)
	}
	for oneFemale in femaleArray {
		femaleList.append(oneFemale.index)
	}

	// マッチングリスト初期化
	var matchingList = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	initMatchingResult()

	// お気に入り1位同士をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].first == favoriteArray[female].first ) {
				if( matchingList[male]<0 && matchingList[female]<0 ) {
					matchingList[male] = female
					matchingList[female] = male
				}
				print(matchingList)
			}
		}
	}

	// 未マッチの中で女->男：1位、男->女：2位をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].second == favoriteArray[female].first ) {
				if( matchingList[male]<0 && matchingList[female]<0 ) {
					matchingList[male] = female
					matchingList[female] = male
				}
				print(matchingList)
			}
		}
	}

	// 未マッチの中で女->男：1位、男->女：3位をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].third == favoriteArray[female].first ) {
				if( matchingList[male]<0 && matchingList[female]<0 ) {
					matchingList[male] = female
					matchingList[female] = male
				}
				print(matchingList)
			}
		}
	}

	// 未マッチの中で女->男：2位、男->女：1位をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].first == favoriteArray[female].second ) {
				if( matchingList[male]<0 && matchingList[female]<0 ) {
					matchingList[male] = female
					matchingList[female] = male
				}
				print(matchingList)
			}
		}
	}

	// 未マッチの中でお気に入り2位同士をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].second == favoriteArray[female].second ) {
				if( matchingList[male]<0 && matchingList[female]<0 ) {
					matchingList[male] = female
					matchingList[female] = male
				}
				print(matchingList)
			}
		}
	}

	matchingResult = matchingList
	print(matchingResult)
}
