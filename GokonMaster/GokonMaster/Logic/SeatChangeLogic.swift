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


/// 1パターンの座席位置に対しての評価値を計算
/// - Parameter tmpSeatPositionArray: 計算対象の座席位置パターン
/// - Returns: evaluation:評価値(Doublt)
/// - Authors: Nozomi Koyama
public func calcSeatEvaluation(tmpSeatPositionArray: Array<Int>) -> Double {
	var evaluation = 0.0
	var i = 0
	for position in tmpSeatPositionArray {
		let sexIndex = memberData[position].sexIndex
		evaluation += calcEachPointSquare(tmpSeatPositionArray: tmpSeatPositionArray,
										  sexIndex: sexIndex,
										  positionIndex: i)
		i += 1
	}
	return evaluation
}


/// 1人1人に対するポイントの合計値を計算(四角テーブル)
/// - Parameters:
///   - tmpSeatPositionArray: 計算対象の座席位置
///   - sexIndex: 計算中メンバーの性別index
///   - positionIndex: 計算中メンバーの座席位置index
/// - Returns: points(Doublt)
/// - Authors: Nozomi Koyama
public func calcEachPointSquare(tmpSeatPositionArray: Array<Int>,
								sexIndex: Int,
								positionIndex: Int) -> Double {
	var points = 0.0
	// 端の席の場合_1
	if( positionIndex == 0 || positionIndex == 5 ) {
		let nextMemberIndex = tmpSeatPositionArray[positionIndex + 1]
		//端ではない側のポイントを加算
		points += nextPoint(memberSexIndex: sexIndex,
							memberIndex: tmpSeatPositionArray[positionIndex],
							nextMemberIndex: nextMemberIndex)
		//端側のポイントを加算
		points += 0.5 * points
		//正面のポイントを加算
		points += frontPoint(memberSexIndex: sexIndex,
							 memberIndex: tmpSeatPositionArray[positionIndex],
							 frontMemberIndex: 5 - positionIndex)
	// 端の席の場合_2
	} else if( positionIndex == 4 || positionIndex == 9 ) {
		let nextMemberIndex = tmpSeatPositionArray[positionIndex - 1]
		//端ではない側のポイントを加算
		points += nextPoint(memberSexIndex: sexIndex,
							memberIndex: tmpSeatPositionArray[positionIndex],
							nextMemberIndex: nextMemberIndex)
		//端側のポイントを加算
		points += 0.5 * points
		//正面のポイントを加算
		points += frontPoint(memberSexIndex: sexIndex,
							 memberIndex: tmpSeatPositionArray[positionIndex],
							 frontMemberIndex: 13 - positionIndex)
	// 端の席ではない場合
	} else {
		
	}
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
	if( memberSexIndex == 0 ) {
		if( favoriteArray[memberIndex].first == nextMemberIndex ) {
			point = 10
		} else if( favoriteArray[memberIndex].second == nextMemberIndex ) {
			if( femaleNum >= 4 ) {
				point = 7
			} else {
				point = 3
			}
		} else if( favoriteArray[memberIndex].third == nextMemberIndex ) {
			point = 3
		} else if( favoriteArray[memberIndex].fourth == nextMemberIndex ) {
			point = 1
		} else {
			if( memberData[nextMemberIndex].sexIndex == 0 ) {
				point = -10
			} else {
				point = -3
			}
		}
	} else {
		if( favoriteArray[memberIndex].first == nextMemberIndex ) {
			point = 20
		} else if( favoriteArray[memberIndex].second == nextMemberIndex ) {
			if( maleNum >= 4 ) {
				point = 10
			} else {
				point = 0
			}
		} else if( favoriteArray[memberIndex].third == nextMemberIndex ) {
			if( maleNum >= 5 ) {
				point = 0
			} else {
				point = -10
			}
		} else if(favoriteArray[memberIndex].fourth == nextMemberIndex ) {
			point = -10
		} else {
			if( nextMemberIndex < 0 ) {
				//隣が空席の場合、個別に計算が必要なため、-999を返す
				point = -999
			} else {
				point = -20
			}
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
	var point = 0.0
	if( memberSexIndex == 0 ) {
		if( favoriteArray[memberIndex].first == frontMemberIndex ) {
			point = 5
		} else if( favoriteArray[memberIndex].second == frontMemberIndex ) {
			if( femaleNum >= 4 ) {
				point = 3
			} else {
				point = 0
			}
		} else if( favoriteArray[memberIndex].third == frontMemberIndex ) {
			point = 0
		} else if( favoriteArray[memberIndex].fourth == frontMemberIndex ) {
			point = -3
		} else {
			if( memberData[frontMemberIndex].sexIndex == 0 ) {
				point = 0
			} else if( frontMemberIndex < 0 ) {
				point = 0
			} else {
				point = -5
			}
		}
	} else {
		if( favoriteArray[memberIndex].first == frontMemberIndex ||
			favoriteArray[memberIndex].second == frontMemberIndex) {
			point = 0
		} else if( favoriteArray[memberIndex].third == frontMemberIndex ) {
			if( maleNum >= 5 ) {
				point = 0
			} else {
				point = -5
			}
		} else if(favoriteArray[memberIndex].fourth == frontMemberIndex ) {
			point = -5
		} else {
			if( memberData[frontMemberIndex].sexIndex == 1 ) {
				point = 0
			} else if( frontMemberIndex < 0 ) {
				point = 0
			} else {
				point = -10
			}
		}
	}
	return point
}
