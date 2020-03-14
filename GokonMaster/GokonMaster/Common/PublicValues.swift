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

public func clearJoinNum() {
	maleNum = 0
	femaleNum = 0
	joinNumSum = 0
}


// テーブルタイプ	0:square, 1:circle
public var tableTypeIndex = 0

public func clearTableTypeIndex() {
	tableTypeIndex = 0
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

public func clearSeatFlg() {
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


/// すべてのpublic変数を初期化
public func clearAllPublicValues() {
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
