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
	var bestEvaluationPoint = -10000.0

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

	// 人数が少ない場合は決め打ち
	if( maleNum == 1 && femaleNum == 1 ) {
		if( tableTypeIndex == 0 ) {
			bestTmpSeatPositionArray = [0, -1, -1, -1, -1, 1, -1, -1, -1, -1]
		} else {
			bestTmpSeatPositionArray = [0, 1, -1, -1, -1, -1, -1, -1, -1, -1]
		}
	} else if( maleNum == 1 && femaleNum == 2 ) {
		// 男の席固定
		bestTmpSeatPositionArray = [maleMembersIndexArray[0], -1, -1, -1, -1, -1, -1, -1, -1, -1]

		// square table
		if( tableTypeIndex == 0 ) {
			//1人目の女性のお気に入りが登録されている
			if( favoriteArray[femaleMembersIndexArray[0]].first >= 0 ) {
				//2人目の女性のお気に入りが登録されている
				if( favoriteArray[femaleMembersIndexArray[0]].first >= 0 ) {
					//男のお気に入りが登録されている場合
					if( favoriteArray[maleMembersIndexArray[0]].first >= 0 ) {
						if(femaleArray[favoriteArray[maleMembersIndexArray[0]].first].index==femaleMembersIndexArray[0]) {
							bestTmpSeatPositionArray[1] = femaleMembersIndexArray[0]
							bestTmpSeatPositionArray[5] = femaleMembersIndexArray[1]
						} else {
							bestTmpSeatPositionArray[1] = femaleMembersIndexArray[1]
							bestTmpSeatPositionArray[5] = femaleMembersIndexArray[0]
						}
					//男のお気に入りが未登録 -> random
					} else {
						let randIndex = Int.random(in: 0...1)
						bestTmpSeatPositionArray[1] = femaleMembersIndexArray[randIndex]
						bestTmpSeatPositionArray[5] = femaleMembersIndexArray[1-randIndex]
					}
				//2人目の女性のお気に入りが未登録 -> 男の隣は1人目の女性
				} else {
					bestTmpSeatPositionArray[1] = femaleMembersIndexArray[0]
					bestTmpSeatPositionArray[5] = femaleMembersIndexArray[1]
				}
			//1人目の女性のお気に入りが未登録
			} else {
				//2人目の女性のお気に入りが登録されている -> 男の隣は2人目の女性
				if( favoriteArray[femaleMembersIndexArray[0]].first >= 0 ) {
					bestTmpSeatPositionArray[1] = femaleMembersIndexArray[1]
					bestTmpSeatPositionArray[5] = femaleMembersIndexArray[0]
				//2人目の女性もお気に入りが未登録
				} else {
					//男のお気に入りが登録されている場合
					if( favoriteArray[maleMembersIndexArray[0]].first >= 0 ) {
						if(maleArray[favoriteArray[maleMembersIndexArray[0]].first].index==femaleMembersIndexArray[0]) {
							bestTmpSeatPositionArray[1] = femaleMembersIndexArray[0]
							bestTmpSeatPositionArray[5] = femaleMembersIndexArray[1]
						} else {
							bestTmpSeatPositionArray[1] = femaleMembersIndexArray[1]
							bestTmpSeatPositionArray[5] = femaleMembersIndexArray[0]
						}
					//男のお気に入りが未登録 -> random
					} else {
						let randIndex = Int.random(in: 0...1)
						bestTmpSeatPositionArray[1] = femaleMembersIndexArray[randIndex]
						bestTmpSeatPositionArray[5] = femaleMembersIndexArray[1-randIndex]
					}
				}
			}
		// circle table
		} else {
		}
	} else if( maleNum == 2 && femaleNum == 1 ) {
		// 女の席固定
		bestTmpSeatPositionArray = [femaleMembersIndexArray[0], -1, -1, -1, -1, -1, -1, -1, -1, -1]

		// square table
		if( tableTypeIndex == 0 ) {
			//女性のお気に入りが登録されている
			if( favoriteArray[femaleMembersIndexArray[0]].first >= 0 ) {
				if(maleArray[favoriteArray[femaleMembersIndexArray[0]].first].index==maleMembersIndexArray[0]) {
					bestTmpSeatPositionArray[1] = maleMembersIndexArray[0]
					bestTmpSeatPositionArray[5] = maleMembersIndexArray[1]
				} else {
					bestTmpSeatPositionArray[1] = maleMembersIndexArray[1]
					bestTmpSeatPositionArray[5] = maleMembersIndexArray[0]
				}
			//女性のお気に入りが未登録
			} else {
				//1人目の男のお気に入りが登録されている場合
				if( favoriteArray[maleMembersIndexArray[0]].first >= 0 ) {
					//2人目の男のお気に入りが登録されている場合 -> random
					if( favoriteArray[maleMembersIndexArray[1]].first >= 0 ) {
						let randIndex = Int.random(in: 0...1)
						bestTmpSeatPositionArray[1] = maleMembersIndexArray[randIndex]
						bestTmpSeatPositionArray[5] = maleMembersIndexArray[1-randIndex]
					//2人目の男のお気に入りが登録されていない
					} else {
						bestTmpSeatPositionArray[1] = maleMembersIndexArray[0]
						bestTmpSeatPositionArray[5] = maleMembersIndexArray[1]
					}
				//1人目の男のお気に入りが未登録
				} else {
					//2人目の男のお気に入りが登録されている場合
					if( favoriteArray[maleMembersIndexArray[1]].first >= 0 ) {
						bestTmpSeatPositionArray[1] = maleMembersIndexArray[1]
						bestTmpSeatPositionArray[5] = maleMembersIndexArray[0]
					//2人目の男のお気に入りも未登録の場合 -> random
					} else {
						let randIndex = Int.random(in: 0...1)
						bestTmpSeatPositionArray[1] = maleMembersIndexArray[randIndex]
						bestTmpSeatPositionArray[5] = maleMembersIndexArray[1-randIndex]
					}
				}
			}
		// circle table
		} else {
		}
	// 全パターン計算し、最適な配置を選択
	} else {
		let tmpSeatPositionPatterns = makeTmpSeatPositionPatterns(maleMembersIndexArray: maleMembersIndexArray,
																  femaleMembersIndexArray: femaleMembersIndexArray)
		var evaluationPoint = 0.0
		for tmpSeatPositionArray in tmpSeatPositionPatterns {
			evaluationPoint = calcSeatEvaluation(tmpSeatPositionArray: tmpSeatPositionArray)
			print(tmpSeatPositionArray, evaluationPoint)
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
public func makeTmpSeatPositionPatterns(maleMembersIndexArray: Array<Int>,
										femaleMembersIndexArray: Array<Int>) -> Array<Array<Int>> {
	var tmpSeatPositionPatterns : Array<Array<Int>> = Array<Array<Int>>()

	// 男配置順全パターン作成
	var maleOrderAllPattern : Array<Array<Int>> = Array<Array<Int>>()
	if( maleNum == 5 ) {
		for i in 0...4 {
			maleOrderAllPattern.append([i, (i+1)%5, (i+2)%5, (i+3)%5, (i+4)%5])
			maleOrderAllPattern.append([i, (i+1)%5, (i+2)%5, (i+4)%5, (i+3)%5])
			maleOrderAllPattern.append([i, (i+1)%5, (i+3)%5, (i+2)%5, (i+4)%5])
			maleOrderAllPattern.append([i, (i+1)%5, (i+3)%5, (i+4)%5, (i+2)%5])
			maleOrderAllPattern.append([i, (i+1)%5, (i+4)%5, (i+2)%5, (i+3)%5])
			maleOrderAllPattern.append([i, (i+1)%5, (i+4)%5, (i+3)%5, (i+2)%5])
			maleOrderAllPattern.append([i, (i+2)%5, (i+1)%5, (i+3)%5, (i+4)%5])
			maleOrderAllPattern.append([i, (i+2)%5, (i+1)%5, (i+4)%5, (i+3)%5])
			maleOrderAllPattern.append([i, (i+2)%5, (i+3)%5, (i+1)%5, (i+4)%5])
			maleOrderAllPattern.append([i, (i+2)%5, (i+3)%5, (i+4)%5, (i+1)%5])
			maleOrderAllPattern.append([i, (i+2)%5, (i+4)%5, (i+1)%5, (i+3)%5])
			maleOrderAllPattern.append([i, (i+2)%5, (i+4)%5, (i+3)%5, (i+1)%5])
			maleOrderAllPattern.append([i, (i+3)%5, (i+1)%5, (i+2)%5, (i+4)%5])
			maleOrderAllPattern.append([i, (i+3)%5, (i+1)%5, (i+4)%5, (i+2)%5])
			maleOrderAllPattern.append([i, (i+3)%5, (i+2)%5, (i+1)%5, (i+4)%5])
			maleOrderAllPattern.append([i, (i+3)%5, (i+2)%5, (i+4)%5, (i+1)%5])
			maleOrderAllPattern.append([i, (i+3)%5, (i+4)%5, (i+1)%5, (i+2)%5])
			maleOrderAllPattern.append([i, (i+3)%5, (i+4)%5, (i+2)%5, (i+1)%5])
			maleOrderAllPattern.append([i, (i+4)%5, (i+1)%5, (i+2)%5, (i+3)%5])
			maleOrderAllPattern.append([i, (i+4)%5, (i+1)%5, (i+3)%5, (i+2)%5])
			maleOrderAllPattern.append([i, (i+4)%5, (i+2)%5, (i+1)%5, (i+3)%5])
			maleOrderAllPattern.append([i, (i+4)%5, (i+2)%5, (i+3)%5, (i+1)%5])
			maleOrderAllPattern.append([i, (i+4)%5, (i+3)%5, (i+1)%5, (i+2)%5])
			maleOrderAllPattern.append([i, (i+4)%5, (i+3)%5, (i+2)%5, (i+1)%5])
		}
	} else if( maleNum == 4 ) {
		for i in 0...3 {
			maleOrderAllPattern.append([i, (i+1)%4, (i+2)%4, (i+3)%4])
			maleOrderAllPattern.append([i, (i+1)%4, (i+3)%4, (i+2)%4])
			maleOrderAllPattern.append([i, (i+2)%4, (i+1)%4, (i+3)%4])
			maleOrderAllPattern.append([i, (i+2)%4, (i+3)%4, (i+1)%4])
			maleOrderAllPattern.append([i, (i+3)%4, (i+1)%4, (i+2)%4])
			maleOrderAllPattern.append([i, (i+3)%4, (i+2)%4, (i+1)%4])
		}
	} else if( maleNum == 3 ) {
		maleOrderAllPattern.append([0, 1, 2])
		maleOrderAllPattern.append([0, 2, 1])
		maleOrderAllPattern.append([1, 0, 2])
		maleOrderAllPattern.append([1, 2, 0])
		maleOrderAllPattern.append([2, 0, 1])
		maleOrderAllPattern.append([2, 1, 0])
	} else if( maleNum == 2 ) {
		maleOrderAllPattern.append([0, 1])
		maleOrderAllPattern.append([1, 0])
	}
	// 女配置順全パターン作成
	var femaleOrderAllPattern : Array<Array<Int>> = Array<Array<Int>>()
	if( femaleNum == 5 ) {
		for i in 0...4 {
			femaleOrderAllPattern.append([i, (i+1)%5, (i+2)%5, (i+3)%5, (i+4)%5])
			femaleOrderAllPattern.append([i, (i+1)%5, (i+2)%5, (i+4)%5, (i+3)%5])
			femaleOrderAllPattern.append([i, (i+1)%5, (i+3)%5, (i+2)%5, (i+4)%5])
			femaleOrderAllPattern.append([i, (i+1)%5, (i+3)%5, (i+4)%5, (i+2)%5])
			femaleOrderAllPattern.append([i, (i+1)%5, (i+4)%5, (i+2)%5, (i+3)%5])
			femaleOrderAllPattern.append([i, (i+1)%5, (i+4)%5, (i+3)%5, (i+2)%5])
			femaleOrderAllPattern.append([i, (i+2)%5, (i+1)%5, (i+3)%5, (i+4)%5])
			femaleOrderAllPattern.append([i, (i+2)%5, (i+1)%5, (i+4)%5, (i+3)%5])
			femaleOrderAllPattern.append([i, (i+2)%5, (i+3)%5, (i+1)%5, (i+4)%5])
			femaleOrderAllPattern.append([i, (i+2)%5, (i+3)%5, (i+4)%5, (i+1)%5])
			femaleOrderAllPattern.append([i, (i+2)%5, (i+4)%5, (i+1)%5, (i+3)%5])
			femaleOrderAllPattern.append([i, (i+2)%5, (i+4)%5, (i+3)%5, (i+1)%5])
			femaleOrderAllPattern.append([i, (i+3)%5, (i+1)%5, (i+2)%5, (i+4)%5])
			femaleOrderAllPattern.append([i, (i+3)%5, (i+1)%5, (i+4)%5, (i+2)%5])
			femaleOrderAllPattern.append([i, (i+3)%5, (i+2)%5, (i+1)%5, (i+4)%5])
			femaleOrderAllPattern.append([i, (i+3)%5, (i+2)%5, (i+4)%5, (i+1)%5])
			femaleOrderAllPattern.append([i, (i+3)%5, (i+4)%5, (i+1)%5, (i+2)%5])
			femaleOrderAllPattern.append([i, (i+3)%5, (i+4)%5, (i+2)%5, (i+1)%5])
			femaleOrderAllPattern.append([i, (i+4)%5, (i+1)%5, (i+2)%5, (i+3)%5])
			femaleOrderAllPattern.append([i, (i+4)%5, (i+1)%5, (i+3)%5, (i+2)%5])
			femaleOrderAllPattern.append([i, (i+4)%5, (i+2)%5, (i+1)%5, (i+3)%5])
			femaleOrderAllPattern.append([i, (i+4)%5, (i+2)%5, (i+3)%5, (i+1)%5])
			femaleOrderAllPattern.append([i, (i+4)%5, (i+3)%5, (i+1)%5, (i+2)%5])
			femaleOrderAllPattern.append([i, (i+4)%5, (i+3)%5, (i+2)%5, (i+1)%5])
		}
	} else if( femaleNum == 4 ) {
		for i in 0...3 {
			femaleOrderAllPattern.append([i, (i+1)%4, (i+2)%4, (i+3)%4])
			femaleOrderAllPattern.append([i, (i+1)%4, (i+3)%4, (i+2)%4])
			femaleOrderAllPattern.append([i, (i+2)%4, (i+1)%4, (i+3)%4])
			femaleOrderAllPattern.append([i, (i+2)%4, (i+3)%4, (i+1)%4])
			femaleOrderAllPattern.append([i, (i+3)%4, (i+1)%4, (i+2)%4])
			femaleOrderAllPattern.append([i, (i+3)%4, (i+2)%4, (i+1)%4])
		}
	} else if( femaleNum == 3 ) {
		femaleOrderAllPattern.append([0, 1, 2])
		femaleOrderAllPattern.append([0, 2, 1])
		femaleOrderAllPattern.append([1, 0, 2])
		femaleOrderAllPattern.append([1, 2, 0])
		femaleOrderAllPattern.append([2, 0, 1])
		femaleOrderAllPattern.append([2, 1, 0])
	} else if( femaleNum == 2 ) {
		femaleOrderAllPattern.append([0, 1])
		femaleOrderAllPattern.append([1, 0])
	}

	// square table
	if( tableTypeIndex == 0 ) {
		if( maleNum==5 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[8] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionArray[9] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[8] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[8] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==1 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
				tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[4]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==4 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[8] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==4 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[8] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==4 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==4 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				//線対称同配置を排除するため女の席を固定
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionArray[6] = femaleMembersIndexArray[1]
				tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==4 && femaleNum==1 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==3 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[8] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// 線対称同配列を排除するため、女の並び順を限定
			femaleOrderAllPattern = []
			femaleOrderAllPattern.append([0, 1, 2])
			femaleOrderAllPattern.append([1, 0, 2])
			femaleOrderAllPattern.append([2, 0, 1])

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==1 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==2 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==2 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				//線対称同配置を排除するため男の席を固定
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[0]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionArray[6] = maleMembersIndexArray[1]
				tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==2 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==2 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				//線対称同配置を排除するため男の席を固定
				tmpSeatPositionArray[0] = maleMembersIndexArray[0]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[6] = maleMembersIndexArray[1]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==1 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[0]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[3]]
				tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[4]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==1 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[0]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==1 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				tmpSeatPositionArray[0] = maleMembersIndexArray[0]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		}
	// circle table
	} else {
		if( maleNum==5 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[8] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionArray[9] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[8] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==5 && femaleNum==1 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[3]]
				tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[4]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==4 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionArray[8] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==4 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[7] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==4 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// 線対称同配列を排除するため、女の並び順を限定
			femaleOrderAllPattern = []
			femaleOrderAllPattern.append([1, 0, 2])
			femaleOrderAllPattern.append([0, 1, 2])
			femaleOrderAllPattern.append([0, 2, 1])

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[3]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==4 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				//線対称同配置を排除するため女の席を固定
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionArray[4] = femaleMembersIndexArray[1]
				tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==4 && femaleNum==1 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==3 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[6] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[7] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// 線対称同配列を排除するため、男の並び順を限定
			maleOrderAllPattern = []
			maleOrderAllPattern.append([1, 0, 2])
			maleOrderAllPattern.append([0, 1, 2])
			maleOrderAllPattern.append([0, 2, 1])

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[5] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==3 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				//線対称同配置を排除するため女の席を固定
				tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[0]
				tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
				tmpSeatPositionArray[3] = femaleMembersIndexArray[1]
				tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[2]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==3 && femaleNum==1 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[2] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[2]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==2 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
					tmpSeatPositionArray[4] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[3]]
					tmpSeatPositionArray[6] = femaleMembersIndexArray[femaleOrder[4]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==2 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				//線対称同配置を排除するため男の席を固定
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[0]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionArray[4] = maleMembersIndexArray[1]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==2 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				//線対称同配置を排除するため男の席を固定
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = maleMembersIndexArray[0]
				tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[3] = maleMembersIndexArray[1]
				tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==2 && femaleNum==2 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for maleOrder in maleOrderAllPattern {
				for femaleOrder in femaleOrderAllPattern {
					tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
					tmpSeatPositionArray[1] = maleMembersIndexArray[maleOrder[0]]
					tmpSeatPositionArray[2] = femaleMembersIndexArray[femaleOrder[1]]
					tmpSeatPositionArray[3] = maleMembersIndexArray[maleOrder[1]]
					tmpSeatPositionPatterns.append(tmpSeatPositionArray)
				}
			}
		} else if( maleNum==1 && femaleNum==5 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[2] = maleMembersIndexArray[0]
				tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[3]]
				tmpSeatPositionArray[5] = femaleMembersIndexArray[femaleOrder[4]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==1 && femaleNum==4 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[2] = maleMembersIndexArray[0]
				tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionArray[4] = femaleMembersIndexArray[femaleOrder[3]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		} else if( maleNum==1 && femaleNum==3 ) {
			var tmpSeatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

			// make patterns
			for femaleOrder in femaleOrderAllPattern {
				tmpSeatPositionArray[0] = femaleMembersIndexArray[femaleOrder[0]]
				tmpSeatPositionArray[1] = femaleMembersIndexArray[femaleOrder[1]]
				tmpSeatPositionArray[2] = maleMembersIndexArray[0]
				tmpSeatPositionArray[3] = femaleMembersIndexArray[femaleOrder[2]]
				tmpSeatPositionPatterns.append(tmpSeatPositionArray)
			}
		}
	}
	return tmpSeatPositionPatterns
}


/// 1パターンの座席位置に対しての評価値を計算
/// - Parameter tmpSeatPositionArray: 計算対象の座席位置パターン
/// - Returns: evaluation:評価値(Double)
/// - Authors: Nozomi Koyama
public func calcSeatEvaluation(tmpSeatPositionArray: Array<Int>) -> Double {
	var evaluation = 0.0
	var i = 0
	for position in tmpSeatPositionArray {
		if( position >= 0 ) {
			evaluation += calcEachPointSquare(tmpSeatPositionArray: tmpSeatPositionArray,
											  sexIndex: memberData[position].sexIndex,
											  positionIndex: i)
		}
		i += 1
	}
	return evaluation
}


/// 1人1人に対するポイントを計算(四角テーブル)
/// - Parameters:
///   - tmpSeatPositionArray: 計算対象の座席位置
///   - sexIndex: 計算中メンバーの性別index
///   - positionIndex: 計算中メンバーの座席位置index
/// - Returns: points(Double)
/// - Authors: Nozomi Koyama
public func calcEachPointSquare(tmpSeatPositionArray: Array<Int>,
								sexIndex: Int,
								positionIndex: Int) -> Double {
	var points = 0.0
	// 端の席の場合_1
	if( positionIndex == 0 || positionIndex == 5 ) {
		//端ではない側のポイントを加算
		points += nextPoint(memberSexIndex: sexIndex,
							memberIndex: tmpSeatPositionArray[positionIndex],
							nextMemberIndex: tmpSeatPositionArray[positionIndex+1])
		//端側のポイントを加算
		if(sexIndex==0)	{	points += -3	}
		else			{	points += 0.5 * points	}
	// 端の席の場合_2
	} else if( positionIndex == 4 || positionIndex == 9 ) {
		//端ではない側のポイントを加算
		points += nextPoint(memberSexIndex: sexIndex,
							memberIndex: tmpSeatPositionArray[positionIndex],
							nextMemberIndex: tmpSeatPositionArray[positionIndex-1])
		//端側のポイントを加算
		if(sexIndex==0)	{	points += -3	}
		else			{	points += 0.5 * points	}
	// 端の席ではない場合
	} else {
		//indexが小さい方の席が空席の場合
		if( seatPositionArray[positionIndex-1] < 0 ) {
			//先にindexが大きい方の席のポイントを計算
			points += nextPoint(memberSexIndex: sexIndex,
								memberIndex: tmpSeatPositionArray[positionIndex],
								nextMemberIndex: tmpSeatPositionArray[positionIndex+1])
			//indexが小さい方(空席)のポイントを加算
			if(sexIndex==0)	{	points += -3	}
			else			{	points += 0.5 * points	}
		//indexが小さい方の席が空席ではない場合
		} else {
			//先にindexが小さい方の席のポイントを計算
			points += nextPoint(memberSexIndex: sexIndex,
								memberIndex: tmpSeatPositionArray[positionIndex],
								nextMemberIndex: tmpSeatPositionArray[positionIndex-1])
			//indexが大きい方が空席の場合
			if( seatPositionArray[positionIndex+1] < 0 ) {
				if(sexIndex==0)	{	points += -3	}
				else			{	points += 0.5 * points	}
			//indexが大きい方が空席ではない場合
			} else {
				points += nextPoint(memberSexIndex: sexIndex,
									memberIndex: tmpSeatPositionArray[positionIndex],
									nextMemberIndex: tmpSeatPositionArray[positionIndex+1])
			}
		}
	}
	//正面のポイントを加算
	points += frontPoint(memberSexIndex: sexIndex,
						 memberIndex: tmpSeatPositionArray[positionIndex],
						 frontMemberIndex: tmpSeatPositionArray[(positionIndex+5) % 10])

	return points
}


/// 1人1人に対するポイントの合計値を計算(丸テーブル)
/// - Parameters:
///   - tmpSeatPositionArray: 計算対象の座席位置
///   - sexIndex: 計算中メンバーの性別index
///   - positionIndex: 計算中メンバーの座席位置index
/// - Returns: points(Doublt)
/// - Authors: Nozomi Koyama
public func calcEachPointCircle(tmpSeatPositionArray: Array<Int>,
								sexIndex: Int,
								positionIndex: Int) -> Double {
	var points = 0.0
	
	return points
}


/// 片方の隣の人のお気に入りランクに応じてポイントを返す
/// - Parameters:
///   - memberSexIndex: 計算中メンバーの性別index
///   - memberIndex: 計算中メンバーのindex
///   - nextMemberIndex: 隣の人のindex
/// - Returns: point(Double)
/// - Authors: Nozomi Koyama
public func nextPoint(memberSexIndex: Int, memberIndex: Int, nextMemberIndex: Int) -> Double {
	var point = 0.0
	// male
	if( memberSexIndex == 0 ) {
		//お気に入り1位が登録済み
		if( favoriteArray[memberIndex].first >= 0 ) {
			//隣がお気に入り1位
			if(femaleArray[favoriteArray[memberIndex].first].index==nextMemberIndex) {
				point = 10
			//お気に入り2位が登録済み
			} else if( favoriteArray[memberIndex].second >= 0 ) {
				//隣がお気に入り2位
				if(femaleArray[favoriteArray[memberIndex].second].index==nextMemberIndex) {
					if( femaleNum >= 4 ) {
						point = 7
					} else {
						point = 3
					}
				//お気に入り3位が登録済み
				} else if( favoriteArray[memberIndex].third >= 0 ) {
					//隣がお気に入り3位
					if(femaleArray[favoriteArray[memberIndex].third].index==nextMemberIndex) {
						point = 3
					//お気に入り4位が登録済み
					} else if( favoriteArray[memberIndex].fourth >= 0 ) {
						//隣がお気に入り4位
						if(femaleArray[favoriteArray[memberIndex].fourth].index==nextMemberIndex) {
							point = 1
						//隣がお気に入りトップ4以外
						} else {
							//隣が同性
							if(memberData[nextMemberIndex].sexIndex==0)	{	point = -10	}
							//隣がお気に入りランク外
							else										{	point = -3	}
						}
					//お気に入り4位は未登録
					} else {
						//隣が同性
						if(memberData[nextMemberIndex].sexIndex==0)	{	point = -10	}
						//隣がお気に入りランク外
						else										{	point = -3	}
					}
				//お気に入り3位以下は未登録
				} else {
					//隣が同性
					if(memberData[nextMemberIndex].sexIndex==0)	{	point = -10	}
					//隣がお気に入りランク外
					else										{	point = -3	}
				}
			//お気に入り2位以下は未登録
			} else {
				//隣が同性
				if(memberData[nextMemberIndex].sexIndex==0)	{	point = -10	}
				//隣がお気に入りランク外
				else										{	point = -3	}
			}
		//お気に入り未登録
		} else {
			//隣が同性
			if(memberData[nextMemberIndex].sexIndex==0)	{	point = -10	}
			//隣がお気に入りランク外
			else										{	point = -3	}
		}
	// female
	} else {
		//お気に入り1位が登録済み
		if( favoriteArray[memberIndex].first >= 0 ) {
			//隣がお気に入り1位
			if(maleArray[favoriteArray[memberIndex].first].index==nextMemberIndex) {
				point = 20
			//お気に入り2位が登録済み
			} else if( favoriteArray[memberIndex].second >= 0 ) {
				//隣がお気に入り2位
				if(maleArray[favoriteArray[memberIndex].second].index==nextMemberIndex) {
					if(maleNum>=4)	{	point = 10	}
					else			{	point = 0	}
				//お気に入り3位が登録済み
				} else if( favoriteArray[memberIndex].third >= 0 ) {
					//隣がお気に入り3位
					if(maleArray[favoriteArray[memberIndex].third].index==nextMemberIndex) {
						if(maleNum>=5)	{	point = 0	}
						else			{	point = -10	}
					//お気に入り4位が登録済み
					} else if( favoriteArray[memberIndex].fourth >= 0 ) {
						//隣がお気に入り4位
						if(maleArray[favoriteArray[memberIndex].fourth].index==nextMemberIndex) {
							point = -10
						//隣がお気に入りランク外、または同性
						} else {
							point = -20
						}
					//お気に入り4位は未登録
					} else {
						point = -20
					}
				//お気に入り3位以下は未登録
				} else {
					point = -20
				}
			//お気に入り2位以下は未登録
			} else {
				point = -20
			}
		//お気に入り未登録
		} else {
			point = -20
		}
	}
	return point
}


/// 正面の人のお気に入りランクに応じてポイントを返す(丸テーブルでは使わない)
/// - Parameters:
///   - memberSexIndex: 計算中メンバーの性別index
///   - memberIndex: 計算中メンバーのindex
///   - frontMemberIndex: 正面の人のindex
/// - Returns: point(Double)
/// - Authors: Nozomi Koyama
public func frontPoint(memberSexIndex: Int, memberIndex: Int, frontMemberIndex: Int) -> Double {
	// male
	if( memberSexIndex == 0 ) {
		//お気に入り1位が登録済み
		if( favoriteArray[memberIndex].first >= 0 ) {
			//正面がお気に入り1位
			if(femaleArray[favoriteArray[memberIndex].first].index==frontMemberIndex) {
				return 5
			//お気に入り2位が登録されている
			} else if( favoriteArray[memberIndex].second >= 0 ) {
				//正面がお気に入り2位
				if(femaleArray[favoriteArray[memberIndex].second].index==frontMemberIndex) {
					if(femaleNum>=4)	{	return 3	}
					else				{	return 0	}
				//お気に入り3位が登録されている
				} else if( favoriteArray[memberIndex].third >= 0 ) {
					//正面がお気に入り3位
					if(femaleArray[favoriteArray[memberIndex].third].index==frontMemberIndex) {
						return 0
					//お気に入り4位が登録されている
					} else if( favoriteArray[memberIndex].fourth >= 0 ) {
						//正面がお気に入り4位
						if(femaleArray[favoriteArray[memberIndex].fourth].index==frontMemberIndex) {
							return -3
						}
					}
				}
			}
		}
		//正面が同性
		if(memberData[frontMemberIndex].sexIndex==0){	return 0	}
		//正面が空席
		else if(frontMemberIndex<0)					{	return 0	}
		//正面がお気に入りランク外
		else										{	return -5	}
	// female
	} else {
		//お気に入り1位が登録されている
		if( favoriteArray[memberIndex].first >= 0 ){
			//正面がお気に入り1位
			if(maleArray[favoriteArray[memberIndex].first].index==frontMemberIndex) {
				return 0
			//お気に入り2位が登録されている
			} else if( favoriteArray[memberIndex].second >= 0 ) {
				//正面がお気に入り2位
				if(maleArray[favoriteArray[memberIndex].second].index==frontMemberIndex) {
					return 0
				//お気に入り3位が登録されている
				} else if( favoriteArray[memberIndex].third >= 0 ) {
					//正面がお気に入り3位
					if(maleArray[favoriteArray[memberIndex].third].index==frontMemberIndex) {
						if(maleNum>=5)	{	return 0	}
						else			{	return -5	}
					//お気に入り4位が登録されている
					} else if( favoriteArray[memberIndex].fourth >= 0 ) {
						//正面がお気に入り4位
						if(maleArray[favoriteArray[memberIndex].fourth].index==frontMemberIndex) {
							return -5
						}
					}
				}
			}
		}
		//正面が同性
		if(memberData[frontMemberIndex].sexIndex==1){	return 0	}
		//正面が空席
		else if(frontMemberIndex<0)					{	return 0	}
		//正面がお気に入りランク外
		else										{	return -10	}
	}
}
