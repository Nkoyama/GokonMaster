//
//  TableCircle.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/02/03.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit

class TableCircle: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clear;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // 円
        let circle = UIBezierPath(arcCenter: CGPoint(x: 150, y: 150), radius: 100, startAngle: 0, endAngle: CGFloat(Double.pi)*2, clockwise: true)
        // 内側の色
        UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).setFill()
        // 内側を塗りつぶす
        circle.fill()
        // 線の色
        UIColor(red: 0, green: 0, blue: 1, alpha: 1.0).setStroke()
        // 線の太さ
        circle.lineWidth = 2.0
        // 線を塗りつぶす
        circle.stroke()
    }
    
}
