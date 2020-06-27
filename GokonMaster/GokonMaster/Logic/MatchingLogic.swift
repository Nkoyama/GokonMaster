//
//  MatchingLogic.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/06/27.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

public func matchingMainLogic() -> Array<Int> {
	// マッチングリスト・未マッチリスト初期化
	var matchingList: Array<Int>		= Array<Int>()
	var noMatchMaleList: Array<Int>		= Array<Int>()
	var noMatchFemaleList: Array<Int>	= Array<Int>()
	for oneMale in maleArray {
		noMatchMaleList.append(oneMale.index)
		matchingList.append(-1)
	}
	for oneFemale in femaleArray {
		noMatchFemaleList.append(oneFemale.index)
	}

	// お気に入り1位同士をマッチング
	var i = 0
	var j = 0
	for noMatchMale in noMatchMaleList {
		j = 0
		for noMatchFemale in noMatchFemaleList {
			if( favoriteArray[noMatchMale].first == favoriteArray[noMatchFemale].first ) {
				matchingList[i] = noMatchFemale
				noMatchMaleList.remove(at: i)
				noMatchFemaleList.remove(at: j)
			}
			j += 1
		}
		i += 1
	}

	// 未マッチの中で女->男：1位、男->女：2位をマッチング
	i = 0
	for noMatchMale in noMatchMaleList {
		j = 0
		for noMatchFemale in noMatchFemaleList {
			if( favoriteArray[noMatchMale].second == favoriteArray[noMatchFemale].first ) {
				matchingList[i] = noMatchFemale
				noMatchMaleList.remove(at: i)
				noMatchFemaleList.remove(at: j)
			}
		}
		i += 1
	}

	// 未マッチの中で女->男：2位、男->女：1位をマッチング
	i = 0
	for noMatchMale in noMatchMaleList {
		j = 0
		for noMatchFemale in noMatchFemaleList {
			if( favoriteArray[noMatchMale].first == favoriteArray[noMatchFemale].second ) {
				matchingList[i] = noMatchFemale
				noMatchMaleList.remove(at: i)
				noMatchFemaleList.remove(at: j)
			}
		}
		i += 1
	}

	// 未マッチの中でお気に入り2位同士をマッチング
	i = 0
	for noMatchMale in noMatchMaleList {
		j = 0
		for noMatchFemale in noMatchFemaleList {
			if( favoriteArray[noMatchMale].second == favoriteArray[noMatchFemale].second ) {
				matchingList[i] = noMatchFemale
				noMatchMaleList.remove(at: i)
				noMatchFemaleList.remove(at: j)
			}
		}
		i += 1
	}

	return matchingList
}
