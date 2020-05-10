//
//  TableCircleDrawView.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/14.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit

class TableCircleDrawView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clear
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// 丸テーブルの描画
	/// - Parameter rect: CGRect
	/// - Authors: Nozomi Koyama
	override func draw(_ rect: CGRect) {
		let circle = UIBezierPath(ovalIn: CGRect(x: 5, y: 5, width:170, height: 170))
		UIColor.gray.setFill()
		circle.fill()
		UIColor.gray.setStroke()
		circle.lineWidth = 8
		circle.stroke()
	}
	
}
