//
//  TableSquareDrawView.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/14.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit

class TableSquareDrawView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/// 四角テーブルの描画
	/// - Parameter rect: CGRect
	/// - Authors: Nozomi Koyama
	override func draw(_ rect: CGRect) {
		let square = UIBezierPath(rect: CGRect(x: 5, y: 5, width:150, height: 390))
		UIColor.brown.setFill()
		square.fill()
		UIColor.brown.setStroke()
		square.lineWidth = 8
		square.stroke()
	}
	
}
