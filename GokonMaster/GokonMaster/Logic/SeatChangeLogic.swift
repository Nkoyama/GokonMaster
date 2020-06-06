//
//  SeatChangeLogic.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/31.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

public func seatChangeMainLogic() -> Bool {
	var bestTmpSeatPositionArray : Array<Int> = Array<Int>()
	var bestEvaluationPoint = 0.0

	if( tableTypeIndex == 0 && maleNum == 1 && femaleNum == 1 ) {
		
	} else if( tableTypeIndex == 1 && maleNum == 1 && femaleNum == 1 ) {
		
	} else if( tableTypeIndex == 1 && maleNum == 1 && femaleNum == 2 ) {
		
	} else if( tableTypeIndex == 1 && maleNum == 2 && femaleNum == 1 ) {
		
	} else {
		let tmpSeatPositionPatterns = makeTmpSeatPositionPatterns()
		var evaluationPoint = 0.0
		for tmpSeatPositionArray in tmpSeatPositionPatterns {
			evaluationPoint = calcSeatEvaluation(tmpSeatPositionArray: tmpSeatPositionArray)
			if(evaluationPoint > bestEvaluationPoint) {
				bestEvaluationPoint = evaluationPoint
				bestTmpSeatPositionArray = tmpSeatPositionArray
			}
		}
	}

	seatPositionArray = bestTmpSeatPositionArray
	return true
}


/// make temporary seatPositionArray patterns
/// - Returns: temporary seatPositionArray Patterns(Array<Array<Int>>)
/// - Authors: Nozomi Koyama
public func makeTmpSeatPositionPatterns() -> Array<Array<Int>> {
	var tmpSeatPositionPatterns : Array<Array<Int>> = Array<Array<Int>>()

	var maleMembersIndexArray : Array<Int> = Array<Int>()
	var femaleMembersIndexArray : Array<Int> = Array<Int>()
	var i = 0
	for oneMember in memberData {
		if( oneMember.sexIndex == 0 ) {
			maleMembersIndexArray.append(i)
		} else {
			femaleMembersIndexArray.append(i)
		}
		i += 1
	}

	if( tableTypeIndex == 0 ) {
		if( maleNum==5 && femaleNum==5 ) {
			
		} else if( maleNum==5 && femaleNum==4 ) {
			
		} else if( maleNum==5 && femaleNum==3 ) {
			
		} else if( maleNum==5 && femaleNum==2 ) {
			
		} else if( maleNum==5 && femaleNum==1 ) {
			
		} else if( maleNum==4 && femaleNum==5 ) {
			
		} else if( maleNum==4 && femaleNum==4 ) {
			
		} else if( maleNum==4 && femaleNum==3 ) {
			
		} else if( maleNum==4 && femaleNum==2 ) {
			
		} else if( maleNum==4 && femaleNum==1 ) {
			
		} else if( maleNum==3 && femaleNum==5 ) {
			
		} else if( maleNum==3 && femaleNum==4 ) {
			
		} else if( maleNum==3 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// pattern 1-1
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 1-2
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 1-3
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 1-4
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 1-5
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 1-6
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 2-1
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-2
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-3
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-4
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-5
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-6
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[2]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 3-1
			tmpSeatPositionArray[1] = maleMembersIndexArray[2]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 3-2
			tmpSeatPositionArray[1] = maleMembersIndexArray[2]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 3-3
			tmpSeatPositionArray[1] = maleMembersIndexArray[2]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 3-4
			tmpSeatPositionArray[1] = maleMembersIndexArray[2]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 3-5
			tmpSeatPositionArray[1] = maleMembersIndexArray[2]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 3-6
			tmpSeatPositionArray[1] = maleMembersIndexArray[2]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[7] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
		} else if( maleNum==3 && femaleNum==2 ) {
			
		} else if( maleNum==3 && femaleNum==1 ) {
			
		} else if( maleNum==2 && femaleNum==5 ) {
			
		} else if( maleNum==2 && femaleNum==4 ) {
			
		} else if( maleNum==2 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// pattern 1-1
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 1-2
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 1-3
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 1-4
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 1-5
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 1-6
			tmpSeatPositionArray[1] = maleMembersIndexArray[0]
			tmpSeatPositionArray[5] = maleMembersIndexArray[1]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)

			// pattern 2-1
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-2
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-3
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[2]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-4
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-5
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			
			// pattern 2-6
			tmpSeatPositionArray[1] = maleMembersIndexArray[1]
			tmpSeatPositionArray[5] = maleMembersIndexArray[0]
			tmpSeatPositionArray[0] = femaleMembersIndexArray[2]
			tmpSeatPositionArray[2] = femaleMembersIndexArray[1]
			tmpSeatPositionArray[6] = femaleMembersIndexArray[0]
			tmpSeatPositionPatterns.append(tmpSeatPositionArray)
		} else if( maleNum==2 && femaleNum==2 ) {
			
		} else if( maleNum==2 && femaleNum==1 ) {
			
		} else if( maleNum==1 && femaleNum==5 ) {
			
		} else if( maleNum==1 && femaleNum==4 ) {
			
		} else if( maleNum==1 && femaleNum==3 ) {
			
		} else if( maleNum==1 && femaleNum==2 ) {
			
		}
	} else {
		if( maleNum==5 && femaleNum==5 ) {
			
		} else if( maleNum==5 && femaleNum==4 ) {
			
		} else if( maleNum==5 && femaleNum==3 ) {
			
		} else if( maleNum==5 && femaleNum==2 ) {
			
		} else if( maleNum==5 && femaleNum==1 ) {
			
		} else if( maleNum==4 && femaleNum==5 ) {
			
		} else if( maleNum==4 && femaleNum==4 ) {
			
		} else if( maleNum==4 && femaleNum==3 ) {
			
		} else if( maleNum==4 && femaleNum==2 ) {
			
		} else if( maleNum==4 && femaleNum==1 ) {
			
		} else if( maleNum==3 && femaleNum==5 ) {
			
		} else if( maleNum==3 && femaleNum==4 ) {
			
		} else if( maleNum==3 && femaleNum==3 ) {
			
		} else if( maleNum==3 && femaleNum==2 ) {
			
		} else if( maleNum==3 && femaleNum==1 ) {
			
		} else if( maleNum==2 && femaleNum==5 ) {
			
		} else if( maleNum==2 && femaleNum==4 ) {
			
		} else if( maleNum==2 && femaleNum==3 ) {
			
		} else if( maleNum==2 && femaleNum==2 ) {
			
		} else if( maleNum==1 && femaleNum==5 ) {
			
		} else if( maleNum==1 && femaleNum==4 ) {
			
		} else if( maleNum==1 && femaleNum==3 ) {
			
		}
	}
	return tmpSeatPositionPatterns
}


public func calcSeatEvaluation(tmpSeatPositionArray: Array<Int>) -> Double {
	var evaluation = 0.0
	
	return evaluation
}


public func calcEachPointSquare(sexIndex: Int, memberIndex: Int) -> Double {
	var point = 0.0
	
	return point
}


public func calcEachPointCircle(sexIndex: Int) -> Double {
	var point = 0.0
	
	return point
}
