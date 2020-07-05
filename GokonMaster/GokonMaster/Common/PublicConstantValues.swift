//
//  PublicConstantValues.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/05.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit

// 各画面の最下部ボタンの位置(画面最下部から??pixel)
public let bottomHeight = 70


/* actions */
// alert message：OKボタン押下
public let defaultAction = UIAlertAction(title: "OK",
										 style: .default,
										 handler: { (action: UIAlertAction!) -> Void in
											alertResult = 1
})
// alert message：Cancelボタン押下
public let cancelAction = UIAlertAction(title: "Cancel",
										style: .destructive,
										handler: { (action: UIAlertAction) in
											alertResult = 0
											return;
})
// alert message：Yesボタン押下
public let yesAction = UIAlertAction(title: "Yes",
									 style: .default,
									 handler: { (action: UIAlertAction) in
										alertResult = 2
})
// alert message：Noボタン押下
public let noAction = UIAlertAction(title: "No",
									style: .default,
									handler: { (action: UIAlertAction) in
										alertResult = 3
})


// NG words
public let ngWordsList = ["あさって", "おととい", "来年", "去年", "平成",
						  "いぬ", "ねこ", "牛(うし･ぎゅう)",
						  "スカイツリー", "東京タワー", "レインボーブリッジ",
						  "ディズニー", "通天閣", "道頓堀", "富士山",
						  "ユニバーサルスタジオジャパン(略称可)",
						  "野球", "バスケ", "サッカー", "テニス", "ゴルフ",
						  "キャンプ", "バーベキュー", "プール", "うみ", "やま",
						  "パン", "ケーキ", "タピオカ",
						  "あか", "みどり", "あお", "きいろ", "ピンク",
						  "あたま", "かみ", "うで",
						  "おいしい", "かっこいい", "微妙",
						  "パパ", "ママ", "兄ちゃん", "姉ちゃん", "いとこ",
						  "おとうと", "いもうと",
						  "あらし", "キング", "プリンス", "ニュース",
						  "au", "docomo", "SoftBank",
						  "Insta(gram)", "Twitter", "TikTok", "Facebook",
						  "YouTube(r)", "Netflix", "Hulu",
						  "アンドロイド", "アプリ",
						  "浮気", "方言", "血液型", "占い", "早番", "遅番", "OK"]
