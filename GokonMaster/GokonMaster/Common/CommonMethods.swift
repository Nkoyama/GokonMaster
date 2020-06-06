//
//  CommonMethods.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/08.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import Foundation

/// String -> Int 変換　例外throw
/// - Parameter str: 文字列の数値
/// - Authors: Nozomi Koyama
public func String2Int(str: String) throws -> Int {
	let num = Int(str) ?? 0
	return num
}
