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
			if( favoriteArray[male].first>=0 && favoriteArray[female].first>=0 ) {
				if( femaleArray[favoriteArray[male].first].index == female &&
					maleArray[favoriteArray[female].first].index == male ) {
					if( matchingList[male]<0 && matchingList[female]<0 ) {
						matchingList[male] = female
						matchingList[female] = male
					}
				}
			}
		}
	}

	// 未マッチの中で女->男：1位、男->女：2位をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].second>=0 && favoriteArray[female].first>=0 ) {
				if( femaleArray[favoriteArray[male].second].index == female &&
					maleArray[favoriteArray[female].first].index == male ) {
					if( matchingList[male]<0 && matchingList[female]<0 ) {
						matchingList[male] = female
						matchingList[female] = male
					}
				}
			}
		}
	}

	// 未マッチの中で女->男：1位、男->女：3位をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].third>=0 && favoriteArray[female].first>=0 ) {
				if( femaleArray[favoriteArray[male].third].index == female &&
					maleArray[favoriteArray[female].first].index == male ) {
					if( matchingList[male]<0 && matchingList[female]<0 ) {
						matchingList[male] = female
						matchingList[female] = male
					}
				}
			}
		}
	}

	// 未マッチの中で女->男：2位、男->女：1位をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].first>=0 && favoriteArray[female].second>=0 ) {
				if( femaleArray[favoriteArray[male].first].index == female &&
					maleArray[favoriteArray[female].second].index == male ) {
					if( matchingList[male]<0 && matchingList[female]<0 ) {
						matchingList[male] = female
						matchingList[female] = male
					}
				}
			}
		}
	}

	// 未マッチの中でお気に入り2位同士をマッチング
	for male in maleList {
		for female in femaleList {
			if( favoriteArray[male].second>=0 && favoriteArray[female].second>=0 ) {
				if( favoriteArray[male].second == female &&
					favoriteArray[female].second == male ) {
					if( matchingList[male]<0 && matchingList[female]<0 ) {
						matchingList[male] = female
						matchingList[female] = male
					}
				}
			}
		}
	}

	matchingResult = matchingList
}
