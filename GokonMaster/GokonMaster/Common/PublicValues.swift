//
//  PublicValues.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/14.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

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
