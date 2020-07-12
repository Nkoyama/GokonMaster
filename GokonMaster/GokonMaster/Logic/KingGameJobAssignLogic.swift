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
	var unassignedCommonJobs	= commonJobList
	var unassignedMaleJobs		= maleJobList
	var unassignedFemaleJobs	= femaleJobList

	// 最初に王様を決定
	let kingIdx = decideKing()

	for i in 0..<joinNumSum {
		if( i == kingIdx ) { continue }
		if( memberData[i].sexIndex == 0 ) {
			let random = Int.random(in: 0...unassignedCommonJobs.count + unassignedMaleJobs.count - 1)
			if( random >= unassignedCommonJobs.count ) {
				assignedJobs[i] = unassignedMaleJobs[0]
				unassignedMaleJobs.remove(at: 0)
			} else {
				assignedJobs[i] = unassignedCommonJobs[random]
				unassignedCommonJobs.remove(at: random)
			}
		} else {
			let random = Int.random(in: 0...unassignedCommonJobs.count + unassignedFemaleJobs.count - 1)
			if( random >= unassignedCommonJobs.count ) {
				assignedJobs[i] = unassignedFemaleJobs[0]
				unassignedFemaleJobs.remove(at: 0)
			} else {
				assignedJobs[i] = unassignedCommonJobs[random]
				unassignedCommonJobs.remove(at: random)
			}
		}
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
