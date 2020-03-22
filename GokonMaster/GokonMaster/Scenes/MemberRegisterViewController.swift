//
//  MemberRegisterViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/22.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MemberRegisterViewController: UIViewController, UITextFieldDelegate{

	// MARK: Views
	let backBtn			= UIButton()			// back button
	let smallTitle		= UILabel()				// title
	let message1		= UILabel()				// message1
	let message2		= UILabel()				// message2
	let settingMsg		= UILabel()				// setting message
	let nicknameLabel	= UILabel()				// nickname label
	let nicknameTF		= UITextField()			// nickname

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white
		
		// return button
		self.backBtn.setTitle(" 戻る ", for: .normal)
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

		// message1
		self.message1.text = String(registeredNum+1) + "人目"
		self.message1.textColor = UIColor.red
		self.message1.font = self.message1.font.withSize(20)
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(218)
		}
		// message2
		self.message2.text = "の情報を登録してください。"
		self.message2.textColor = UIColor.black
		self.view.addSubview(message2)
		self.message2.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(220)
		}
		// setting message
		self.settingMsg.numberOfLines = 2
		self.settingMsg.text = "※登録された連絡先は合コン終了後、\n  マッチした相手にのみ表示されます。"
		self.settingMsg.textColor = UIColor.black
		self.view.addSubview(settingMsg)
		self.settingMsg.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(260)
		}

		// nickname
		self.nicknameLabel.text = "ニックネーム"
		self.nicknameLabel.textColor = UIColor.purple
		self.view.addSubview(nicknameLabel)
		self.nicknameLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
		}
		self.nicknameTF.borderStyle = .roundedRect
		self.view.addSubview(nicknameTF)
		self.nicknameTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(160)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(300)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(345)
		}
		self.nicknameTF.delegate = self

	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}

}
