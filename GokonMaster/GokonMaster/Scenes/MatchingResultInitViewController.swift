//
//  MatchingResultInitViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/06/27.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MatchingResultInitViewController: UIViewController {
	// MARK: Views
	let smallTitle			= UILabel()				// title
	let registeredNickname		= UILabel()			// registered nickname
	let message1				= UILabel()			// message1
	let secondTitle			= UILabel()		// secondary title

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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// secondary title
		self.secondTitle.text = "マッチング結果確認"
		self.secondTitle.textColor = UIColor.init(red: 0/255, green: 167/255, blue: 113/255, alpha: 1)
		self.secondTitle.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.view.addSubview(secondTitle)
		self.secondTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
		}
		
		// dear name
		self.dearName.text = memberData[registeredNum].nickname + " さん"
		self.dearName.textColor = UIColor.red
		self.dearName.font = self.dearName.font.withSize(20)
		self.view.addSubview(dearName)
		self.dearName.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(240)
		}
		// message
		self.message.text = "パスワードを入力してください。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(270)
		}
	}
}
