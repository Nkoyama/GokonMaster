//
//  TableTypeDrawView.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/08.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit

class TableTypeDrawView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clear
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/// テーブルタイプ（四角、丸）の描画
	/// - Parameter rect: <#rect description#>
	/// - Authors: Nozomi Koyama
	override func draw(_ rect: CGRect) {
		// 四角
		let square = UIBezierPath(rect: CGRect(x: 0, y: 10, width:80, height: 80))
		UIColor.gray.setFill()
		square.fill()
		UIColor.gray.setStroke()
		square.lineWidth = 8
		square.stroke()

		// 丸
		let circle = UIBezierPath(ovalIn: CGRect(x: 120, y: 10, width:80, height: 80))
		UIColor.gray.setFill()
		circle.fill()
		UIColor.gray.setStroke()
		circle.lineWidth = 8
		circle.stroke()
	}

}
