//
//  DefineExtension.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/06.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation


extension String {
	/// 「漢字」かどうか
	var isKanji: Bool {
		let range = "^[\u{3005}\u{3007}\u{303b}\u{3400}-\u{9fff}\u{f900}-\u{faff}\u{20000}-\u{2ffff}]+$"
		return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
	}
	
	/// 「ひらがな」かどうか
	var isHiragana: Bool {
		let range = "^[ぁ-ゞ]+$"
		return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
	}
	
	/// 「カタカナ」かどうか
	var isKatakana: Bool {
		let range = "^[ァ-ヾ]+$"
		return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
	}
	
	/// 全角文字を含まないかどうか
	var isNotZenkaku: Bool {
		let range = "^[a-zA-Z0-9!-/:-@¥[-`{-~]*]+$"
		return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
	}
}
