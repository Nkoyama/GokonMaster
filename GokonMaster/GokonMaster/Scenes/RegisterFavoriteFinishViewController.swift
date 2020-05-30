//
//  RegisterFavoriteFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/30.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class RegisterFavoriteFinishViewController: UIViewController {

	// MARK: Views
	let backBtn			= UIButton()		// back button
	let smallTitle		= UILabel()			// title
	let nickname		= UILabel()			// nickname
	let message1		= UILabel()			// message1
	let rankLabel_1		= UILabel()			// 1位 label
	let rankLabel_2		= UILabel()			// 2位 label
	let rankLabel_3		= UILabel()			// 3位 label
	let rankLabel_4		= UILabel()			// 4位 label
	let favoriteName_1	= UILabel()			// お気に入り 1位
	let favoriteName_2	= UILabel()			// お気に入り 2位
	let favoriteName_3	= UILabel()			// お気に入り 3位
	let favoriteName_4	= UILabel()			// お気に入り 4位
	let nextName		= UILabel()			// next name
	let message2		= UILabel()			// message2

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// return button
		if(registeredNum <= 0) {
			self.backBtn.setTitle(" 修正 ", for: .normal)
			self.backBtn.setTitleColor(UIColor.green, for: .normal)
			self.backBtn.backgroundColor = UIColor.clear
			self.backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
			self.backBtn.layer.borderColor = UIColor.clear.cgColor
			self.backBtn.layer.borderWidth = 2.0
			self.backBtn.layer.cornerRadius = 2.0
			self.view.addSubview(self.backBtn)
			self.backBtn.addTarget(self, action: #selector(self.backBtnDidTap(_:)), for: .touchUpInside)
			self.backBtn.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(5)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(0)
			}
		}

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

		// nickname
		self.nickname.text = memberData[registeredNum].nickname + " さん"
		self.nickname.textColor = UIColor.red
		self.nickname.font = self.nickname.font.withSize(20)
		self.view.addSubview(nickname)
		self.nickname.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// message1
		self.message1.text = "気に入ったお相手が以下の通り登録されました。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}

		// 1位
		self.rankLabel_1.text = "1位"
		self.rankLabel_1.textColor = UIColor.black
		self.rankLabel_1.textAlignment = NSTextAlignment.center
		self.rankLabel_1.font = self.rankLabel_1.font.withSize(25.0)
		self.rankLabel_1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.rankLabel_1)
		self.rankLabel_1.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}
		if(memberData[registeredNum].sexIndex == 0) {
			self.favoriteName_1.text = femaleNameArray[favoriteArray[registeredNum].first]
		} else if(memberData[registeredNum].sexIndex == 1) {
			self.favoriteName_1.text = maleNameArray[favoriteArray[registeredNum].first]
		}
		self.favoriteName_1.textColor = UIColor.black
		self.favoriteName_1.font = self.favoriteName_1.font.withSize(25.0)
		self.favoriteName_1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.favoriteName_1)
		self.favoriteName_1.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}

		// 2位
		if((memberData[registeredNum].sexIndex == 0 && femaleNum >= 3) ||
			(memberData[registeredNum].sexIndex == 1 && maleNum >= 3)) {
			self.rankLabel_2.text = "2位"
			self.rankLabel_2.textColor = UIColor.black
			self.rankLabel_2.textAlignment = NSTextAlignment.center
			self.rankLabel_2.font = self.rankLabel_2.font.withSize(25.0)
			self.rankLabel_2.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_2)
			self.rankLabel_2.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(340)
			}
			if(memberData[registeredNum].sexIndex == 0) {
				self.favoriteName_2.text = femaleNameArray[favoriteArray[registeredNum].second]
			} else if(memberData[registeredNum].sexIndex == 1) {
				self.favoriteName_2.text = maleNameArray[favoriteArray[registeredNum].second]
			}
			self.favoriteName_2.textColor = UIColor.black
			self.favoriteName_2.font = self.favoriteName_2.font.withSize(25.0)
			self.favoriteName_2.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.favoriteName_2)
			self.favoriteName_2.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(340)
			}
		}

		// 3位
		if((memberData[registeredNum].sexIndex == 0 && femaleNum >= 4) ||
			(memberData[registeredNum].sexIndex == 1 && maleNum >= 4)) {
			self.rankLabel_3.text = "3位"
			self.rankLabel_3.textColor = UIColor.black
			self.rankLabel_3.textAlignment = NSTextAlignment.center
			self.rankLabel_3.font = self.rankLabel_3.font.withSize(25.0)
			self.rankLabel_3.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_3)
			self.rankLabel_3.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(380)
			}
			if(memberData[registeredNum].sexIndex == 0) {
				self.favoriteName_3.text = femaleNameArray[favoriteArray[registeredNum].third]
			} else if(memberData[registeredNum].sexIndex == 1) {
				self.favoriteName_3.text = maleNameArray[favoriteArray[registeredNum].third]
			}
			self.favoriteName_3.textColor = UIColor.black
			self.favoriteName_3.font = self.favoriteName_3.font.withSize(25.0)
			self.favoriteName_3.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.favoriteName_3)
			self.favoriteName_3.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(380)
			}
		}

		// 4位
		if((memberData[registeredNum].sexIndex == 0 && femaleNum >= 5) ||
			(memberData[registeredNum].sexIndex == 1 && maleNum >= 5)) {
			self.rankLabel_4.text = "4位"
			self.rankLabel_4.textColor = UIColor.black
			self.rankLabel_4.textAlignment = NSTextAlignment.center
			self.rankLabel_4.font = self.rankLabel_4.font.withSize(25.0)
			self.rankLabel_4.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_4)
			self.rankLabel_4.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(420)
			}
			if(memberData[registeredNum].sexIndex == 0) {
				self.favoriteName_4.text = femaleNameArray[favoriteArray[registeredNum].fourth]
			} else if(memberData[registeredNum].sexIndex == 1) {
				self.favoriteName_4.text = maleNameArray[favoriteArray[registeredNum].fourth]
			}
			self.favoriteName_4.textColor = UIColor.black
			self.favoriteName_4.font = self.favoriteName_4.font.withSize(25.0)
			self.favoriteName_4.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.favoriteName_4)
			self.favoriteName_4.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(420)
			}
		}
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}
}
