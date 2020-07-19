//
//  PublicValues.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/14.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit

public var editingTextFieldName = ""	// 編集中のTextField名
public func initEditingTextFieldName(){
	editingTextFieldName = ""
}


public var keyboardHeight = 0.0
public func initKeyboardHeight(){
	keyboardHeight = 0.0
}


public var maleNum = 0			// 男性参加人数
public var femaleNum = 0		// 女性参加人数
public var joinNumSum = 0		// 合計参加人数
public func initJoinNum() {
	maleNum = 0
	femaleNum = 0
	joinNumSum = 0
}


// テーブルタイプ	0:square, 1:circle
public var tableTypeIndex = 0
public func initTableTypeIndex() {
	tableTypeIndex = 0
}

/* 参加者データ */
public var memberData:[(nickname:		String,
						sexIndex:		Int,
						pinCode:		String)] = []
public func initMemberData() {
	memberData.removeAll()
	for _ in 1...joinNumSum {
		memberData.append((nickname:		"",
						   sexIndex:		-1,
						   pinCode:			""))
	}
}


/* 男女別リスト */
public var maleArray : [(index:		Int,
						 nickname:	String)] = []
public var femaleArray : [(index:		Int,
						   nickname:	String)] = []
public func clearBothSexArray() {
	maleArray.removeAll()
	femaleArray.removeAll()
}
/// memberDataから性別ごとの名前リストを作成
/// - Returns: succeed(true) or fail(false)
/// - Authors: Nozomi Koyama
public func setNameArray() -> Bool {
	clearBothSexArray()
	var i = 0
	for oneMemberData in memberData {
		if(oneMemberData.sexIndex == 0) {
			maleArray.append((index:	i,
							  nickname:	oneMemberData.nickname))
		} else if(oneMemberData.sexIndex == 1) {
			femaleArray.append((index:	i,
							  nickname:	oneMemberData.nickname))
		} else {
			return false
		}
		i += 1
	}
	return true
}


// 座席位置
// それぞれの座席にいる人のindexを保持　誰もいない席は-1
// 円テーブル：半時計周りに0〜9
// 四角テーブル：	5 6 7 8 9
//			   |‾‾‾‾‾‾‾‾‾|
//			   |  table  |
//			   |_________|
//				0 1 2 3 4
public var seatPositionArray : [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
public func initSeatPositionArray(){
	seatPositionArray = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
}


// 登録済み人数
public var registeredNum = 0
public func initRegisteredNum() {
	registeredNum = 0
}


// お気に入りリスト
public var favoriteArray:[(	first:	Int,
							second:	Int,
							third:	Int,
							fourth:	Int)] = []
public func initFavoriteArray(joinNum : Int) {
	favoriteArray.removeAll()
	for _ in 1...joinNum {
		favoriteArray.append((first:	-1,
							  second:	-1,
							  third:	-1,
							  fourth:	-1))
	}
}


// マッチング結果
public var matchingResult = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
public func initMatchingResult() {
	matchingResult = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
}


// NG words
public var assignedNGWords = ["", "", "", "", "", "", "", "", "", ""]
public func initAssignedNGWords() {
	assignedNGWords = ["", "", "", "", "", "", "", "", "", ""]
}


// king game job
public var assignedJobs = ["", "", "", "", "", "", "", "", "", ""]
public func initAssignedJobs() {
	assignedJobs = ["", "", "", "", "", "", "", "", "", ""]
}


// navigation controller: menu layer number
public var menuLayerNum = 0
public func initMenuLayerNum() {
	menuLayerNum = 0
}


/// すべてのpublic変数を初期化
public func initAllPublicValues() {
	editingTextFieldName = ""
	keyboardHeight = 0.0

	maleNum = 0
	femaleNum = 0
	joinNumSum = 0

	tableTypeIndex = 0

	memberData.removeAll()
	clearBothSexArray()

	initSeatPositionArray()

	initRegisteredNum()
	
	favoriteArray.removeAll()

	initMatchingResult()

	initAssignedNGWords()
	initAssignedJobs()

	initMenuLayerNum()
}


public var alertResult = -1
public func initAlertResult() {
	alertResult = -1
}
