//
//  KingGameJobAssignLogic.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/11.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

/// main logic for job assignment
/// - Authors: Nozomi Koyama
public func kingGameJobAssignMainLogic() {
	initAssignedJobs()

	// 未割当役職初期化
	var unassignedJobs	= jobList

	// 最初に王様を決定
	let kingIdx = decideKing()
	// 女王を決定
	let queenIdx = decideQueen(kingIdx: kingIdx)
	// 王子を決定
	let princeIdx = decidePrince(kingIdx: kingIdx)

	for i in 0..<joinNumSum {
		if( i == kingIdx || i == queenIdx || i == princeIdx ) {
			continue
		}
		let random = Int.random(in: 0..<unassignedJobs.count)
		assignedJobs[i] = unassignedJobs[random]
		unassignedJobs.remove(at: random)
	}
}

/// decide king
/// - Returns: king index (Int)
/// - Authors: NozomiKoyama
func decideKing() -> Int {
	let kingIdx = Int.random(in: 0..<joinNumSum)
	assignedJobs[kingIdx] = "王様"
	return kingIdx
}


/// decide queen
/// - Returns: king index (Int)
/// - Authors: NozomiKoyama
func decideQueen(kingIdx: Int) -> Int {
	var queenIdx = Int.random(in: 0..<femaleNum)
	while femaleArray[queenIdx].index == kingIdx {
		queenIdx = Int.random(in: 0..<femaleNum)
	}
	assignedJobs[femaleArray[queenIdx].index] = "女王"
	return femaleArray[queenIdx].index
}


/// decide prince
/// - Returns: king index (Int)
/// - Authors: NozomiKoyama
func decidePrince(kingIdx: Int) -> Int {
	var princeIdx = Int.random(in: 0..<maleNum)
	while maleArray[princeIdx].index == kingIdx {
		princeIdx = Int.random(in: 0..<maleNum)
	}
	assignedJobs[maleArray[princeIdx].index] = "王子"
	return maleArray[princeIdx].index
}
