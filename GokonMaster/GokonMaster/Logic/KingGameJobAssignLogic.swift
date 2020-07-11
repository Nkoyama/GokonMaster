//
//  KingGameJobAssignLogic.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/11.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

public func kingGameJobAssignMainLogic() {
	initAssignedJobs()

	// 未割当役職初期化
	var unassignedCommonJobs	= commonJobList
	var unassignedMaleJobs		= maleJobList
	var unassignedFemaleJobs	= femaleJobList

	for i in 0..<joinNumSum {
		if( memberData[i].sexIndex == 0 ) {
			let random = Int.random(in: 0..<unassignedCommonJobs.count + unassignedMaleJobs.count)
			if( random == unassignedCommonJobs.count + unassignedMaleJobs.count - 1
				&& unassignedMaleJobs.count > 0 ) {
				assignedJobs[i] = unassignedMaleJobs[0]
				unassignedMaleJobs.remove(at: 0)
			} else {
				assignedJobs[i] = unassignedCommonJobs[random]
				unassignedCommonJobs.remove(at: random)
			}
		} else {
			let random = Int.random(in: 0..<unassignedCommonJobs.count + unassignedFemaleJobs.count)
			if( random == unassignedCommonJobs.count + unassignedFemaleJobs.count - 1
				&& unassignedFemaleJobs.count > 0 ) {
				assignedJobs[i] = unassignedFemaleJobs[0]
				unassignedFemaleJobs.remove(at: 0)
			} else {
				assignedJobs[i] = unassignedCommonJobs[random]
				unassignedCommonJobs.remove(at: random)
			}
		}
	}
}
