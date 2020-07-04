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
}


public var alertResult = -1
public func initAlertResult() {
	alertResult = -1
}

// alert message：OKボタン押下
public let defaultAction = UIAlertAction(title: "OK",
										 style: .default,
										 handler:{
											(action: UIAlertAction!) -> Void in
											alertResult = 1
})

// alert message：Cancelボタン押下
public let cancelAction = UIAlertAction(title: "Cancel",
										style: .destructive,
										handler:{
											(action: UIAlertAction!) -> Void in
											alertResult = 0
											return;
})

// alert message：Yesボタン押下
public let yesAction = UIAlertAction(title: "Yes",
									 style: .default,
									 handler:{
										(action: UIAlertAction!) -> Void in
										alertResult = 2
})

// alert message：Noボタン押下
public let noAction = UIAlertAction(title: "No",
									style: .default,
									handler:{
										(action: UIAlertAction!) -> Void in
										alertResult = 3
})


// NG words master
public let masterNGWords = ["あさって", "おととい", "来年", "去年", "平成",		// 時間系
							"いぬ", "ねこ", "牛(うし･ぎゅう)",					// 動物系
							"スカイツリー", "東京タワー", "レインボーブリッジ",
							"ディズニー", "通天閣", "道頓堀", "富士山",
							"ユニバーサルスタジオジャパン (略称可)",				// 観光地系
							"野球", "バスケ", "サッカー", "テニス", "ゴルフ",		// スポーツ系
							"キャンプ", "バーベキュー", "プール", "うみ", "やま",	// レジャー系
							"パン", "ケーキ", "タピオカ",						// 食品系
							"あか", "みどり", "あお", "きいろ", "ピンク",		// 色
							"あたま", "かみ", "うで",							// 体
							"おいしい", "かっこいい", "微妙",					// 形容詞系
							"パパ", "ママ", "兄ちゃん", "姉ちゃん", "いとこ",
							"おとうと", "いもうと",								// 家族系
							"あらし", "キング", "プリンス",	 "ニュース",			// ジャニーズ
							"au", "docomo", "SoftBank",						// キャリア
							"Insta(gram)", "Twitter", "TikTok", "Facebook",	// SNS
							"YouTube(r)", "Netflix", "Hulu",				// 動画
							"アンドロイド", "アプリ",							// スマホ系
							"浮気", "方言", "血液型", "占い", "早番", "遅番", "OK"]
