//
//  NGwordAssignLogic.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

public func ngWordAssignMainLogic() {
	initAssignedNGWords()

	// 未割当NGワード初期化
	var unassignedNGWords = ngWordsList

	for i in 0..<joinNumSum {
		let randomIdx = Int.random(in: 0..<unassignedNGWords.count)
		assignedNGWords[i] = unassignedNGWords[randomIdx]
		unassignedNGWords.remove(at: randomIdx)
	}
}
