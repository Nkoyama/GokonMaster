//
//  Setting2ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/07.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class Setting2ViewController: UIViewController, UITextFieldDelegate{

	// MARK: Views
	let smallTitle = UILabel()		// title
	let settingMsg = UILabel()		// setting message

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// title
		self.smallTitle.numberOfLines = 2
		self.smallTitle.text = "合コン\n    master"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(100)
		}

		// setting message
		self.settingMsg.text = "席の配置を設定をして下さい。"
		self.settingMsg.textColor = UIColor.black
		self.view.addSubview(settingMsg)
		self.settingMsg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(250)
		}

		let setting1ViewController = Setting1ViewController()
		if(setting1ViewController.tableTypeIndex == 0){
			// 四角テーブルの描画
			let screenWidth = self.view.bounds.width
			let tableSquareDraw = TableSquareDrawView(frame: CGRect(x: screenWidth/2-80, y: 350, width: 160, height: 400))
			self.view.addSubview(tableSquareDraw)
		}
	}
}
