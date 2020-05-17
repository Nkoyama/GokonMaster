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
public var memberData:[(nickname:String,
						sexIndex:Int,
						pinCode:String,
						lineId:String,
						emailAddress:String,
						phoneNumber:String,
						instagramId:String,
						twitterId:String,
						otherName:String,
						other:String)] = []
public func initMemberData() {
	for _ in memberData {
		memberData.removeLast()
	}
	for _ in 1...joinNumSum {
		memberData.append((nickname:"",
						   sexIndex:-1,
						   pinCode:"",
						   lineId:"",
						   emailAddress:"",
						   phoneNumber:"",
						   instagramId:"",
						   twitterId:"",
						   otherName:"",
						   other:""))
	}
}


public var maleNameArray = [String]()
public var femaleNameArray = [String]()
public func initNameArrays() {
	maleNameArray = [String]()
	femaleNameArray = [String]()
}
/// memberDataから性別ごとの名前リストを作成
/// - Returns: succeed(true) or fail(false)
/// - Authors: Nozomi Koyama
public func setNameArrays() -> Bool {
	for oneMemberData in memberData {
		if(oneMemberData.sexIndex == 0) {
			maleNameArray.append(oneMemberData.nickname)
		} else if(oneMemberData.sexIndex == 1) {
			femaleNameArray.append(oneMemberData.nickname)
		} else {
			return false
		}
	}
	return true
}


// 座席位置
public var seatPositionArray : Array<Int> = Array<Int>()
public func initSeatPositionArray(joinNum : Int){
	let len : Int = seatPositionArray.count
	for _ in 0..<len {
		seatPositionArray.removeLast()
	}
	for _ in 1...joinNum {
		seatPositionArray.append(-1)
	}
}


// 登録済み人数
public var registeredNum = 0
public func initRegisteredNum() {
	registeredNum = 0
}


/// すべてのpublic変数を初期化
public func initAllPublicValues() {
	editingTextFieldName = ""
	keyboardHeight = 0.0

	maleNum = 0
	femaleNum = 0
	joinNumSum = 0

	tableTypeIndex = 0

	initMemberData()

	let len : Int = seatPositionArray.count
	for _ in 0..<len {
		seatPositionArray.removeLast()
	}
}


// エラーメッセージ：OKボタン押下
public let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
	(action: UIAlertAction!) -> Void in
})
