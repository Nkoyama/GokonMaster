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
// nickname
public var nicknameArray : Array<String> = Array<String>()
public func initNicknameArray(joinNum : Int) {
	let len : Int = nicknameArray.count
	for _ in 0..<len {
		nicknameArray.removeLast()
	}
	for _ in 1...joinNum {
		nicknameArray.append("")
	}
}
// sex
public var sexIndexArray : Array<Int> = Array<Int>()
public func initSexIndexArray(joinNum : Int) {
	let len : Int = sexIndexArray.count
	for _ in 0..<len {
		sexIndexArray.removeLast()
	}
	for _ in 1...joinNum {
		sexIndexArray.append(0)
	}
}
// PIN code
public var pinCodeArray : Array<String> = Array<String>()
public func initPinCodeArray(joinNum : Int) {
	let len : Int = pinCodeArray.count
	for _ in 0..<len {
		pinCodeArray.removeLast()
	}
	for _ in 1...joinNum {
		pinCodeArray.append("")
	}
}
// LINE ID
public var lineIdArray : Array<String> = Array<String>()
public func initLineIdArray(joinNum : Int) {
	let len : Int = lineIdArray.count
	for _ in 0..<len {
		lineIdArray.removeLast()
	}
	for _ in 1...joinNum {
		lineIdArray.append("")
	}
}
// e-mail address
public var emailAddressArray : Array<String> = Array<String>()
public func initEmailAddressArray(joinNum : Int) {
	let len : Int = emailAddressArray.count
	for _ in 0..<len {
		emailAddressArray.removeLast()
	}
	for _ in 1...joinNum {
		emailAddressArray.append("")
	}
}
// phone number
public var phoneNumberArray : Array<String> = Array<String>()
public func initPhoneNumberArray(joinNum : Int) {
	let len : Int = phoneNumberArray.count
	for _ in 0..<len {
		phoneNumberArray.removeLast()
	}
	for _ in 1...joinNum {
		phoneNumberArray.append("")
	}
}
// Instagram ID
public var instagramIdArray : Array<String> = Array<String>()
public func initInstagramIdArray(joinNum : Int) {
	let len : Int = instagramIdArray.count
	for _ in 0..<len {
		instagramIdArray.removeLast()
	}
	for _ in 1...joinNum {
		instagramIdArray.append("")
	}
}
// Twitter ID
public var twitterIdArray : Array<String> = Array<String>()
public func initTwitterIdArray(joinNum : Int) {
	let len : Int = twitterIdArray.count
	for _ in 0..<len {
		twitterIdArray.removeLast()
	}
	for _ in 1...joinNum {
		twitterIdArray.append("")
	}
}
// other contact information name
public var contactInfoOtherNameArray : Array<String> = Array<String>()
public func initContactInfoOtherNameArray(joinNum : Int) {
	let len : Int = contactInfoOtherNameArray.count
	for _ in 0..<len {
		contactInfoOtherNameArray.removeLast()
	}
	for _ in 1...joinNum {
		contactInfoOtherNameArray.append("")
	}
}
// other contact information
public var contactInfoOtherArray : Array<String> = Array<String>()
public func initContactInfoOtherArray(joinNum : Int) {
	let len : Int = contactInfoOtherArray.count
	for _ in 0..<len {
		contactInfoOtherArray.removeLast()
	}
	for _ in 1...joinNum {
		contactInfoOtherArray.append("")
	}
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


// 座席位置
public var seatAFlg = false
public var seatBFlg = false
public var seatCFlg = false
public var seatDFlg = false
public var seatEFlg = false
public var seatFFlg = false
public var seatGFlg = false
public var seatHFlg = false
public var seatIFlg = false
public var seatJFlg = false
public func initSeatFlg() {
	seatAFlg = false
	seatBFlg = false
	seatCFlg = false
	seatDFlg = false
	seatEFlg = false
	seatFFlg = false
	seatGFlg = false
	seatHFlg = false
	seatIFlg = false
	seatJFlg = false
}


// 登録済み人数
public var registeredNum = 0
public func initRegisteredNum() {
	registeredNum = 0
}


/// すべてのpublic変数を初期化
public func initAllPublicValues() {
	maleNum = 0
	femaleNum = 0
	joinNumSum = 0

	tableTypeIndex = 0

	seatAFlg = false
	seatBFlg = false
	seatCFlg = false
	seatDFlg = false
	seatEFlg = false
	seatFFlg = false
	seatGFlg = false
	seatHFlg = false
	seatIFlg = false
	seatJFlg = false
}


// エラーメッセージ：OKボタン押下
public let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
	(action: UIAlertAction!) -> Void in
})
