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
	let backBtn				= UIButton()			// back button
	let smallTitle			= UILabel()				// title
	let message1			= UILabel()				// message1
	let message2			= UILabel()				// message2
	let settingMsg			= UILabel()				// setting message
	let nicknameLabel		= UILabel()				// nickname label
	let nicknameTF			= UITextField()			// nickname
	let sexLabel			= UILabel()				// sex label
	var sexSC				= UISegmentedControl()	// sex segmented control
	let pinCodeLabel		= UILabel()				// PIN code label
	let pinCodeTF			= UITextField()			// PIN code
	let contactInfoLabel	= UILabel()				// contact information label
	let contactInfoScrollV	= UIScrollView()		// contact information scroll view


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
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(345)
		}
		self.nicknameTF.delegate = self

		// 性別
		self.sexLabel.text = "性別"
		self.sexLabel.textColor = UIColor.purple
		self.view.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(400)
		}
		// 性別選択
		let options = ["男", "女"]
		self.sexSC = UISegmentedControl(items: options)
		self.view.addSubview(self.sexSC)
		self.sexSC.selectedSegmentIndex = 0
		self.sexSC.addTarget(self, action: #selector(self.sexChanged(_:)), for: .valueChanged)
		self.sexSC.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(160)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(395)
		}

		// PIN code
		self.pinCodeLabel.text = "暗証番号(最大6桁)"
		self.pinCodeLabel.textColor = UIColor.purple
		self.view.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(450)
		}
		self.pinCodeTF.keyboardType = .numberPad
		self.pinCodeTF.borderStyle = .roundedRect
		self.view.addSubview(pinCodeTF)
		self.pinCodeTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(200)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(445)
		}
		self.pinCodeTF.delegate = self

		/* contact information */
		self.contactInfoLabel.text = "連絡先"
		self.contactInfoLabel.textColor = UIColor.purple
		self.view.addSubview(contactInfoLabel)
		self.contactInfoLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(500)
		}
		// scroll view
		self.contactInfoScrollV.layer.borderColor = UIColor.black.cgColor
		self.contactInfoScrollV.layer.borderWidth = 1.0
		self.view.addSubview(self.contactInfoScrollV)
		self.contactInfoScrollV.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(550)
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100)
		}
		let contactInfoView = createContactInfoListView()
		self.contactInfoScrollV.addSubview(contactInfoView)
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}

	/// 性別が変更された時に、sexIndexを変更
	/// - Parameter sender: Any
	/// - Authors: Nozomi Koyama
	@objc func sexChanged(_ sender: Any) {
		sexIndexArray[registeredNum] = self.sexSC.selectedSegmentIndex
	}

	/// TextField以外の部分をタッチした時の処理
	/// - Parameters:
	///   - touches: Set<UITouch>
	///   - event: UIEvent
	/// - Authors: Nozomi Koyama
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		// close keyboard
		self.nicknameTF.resignFirstResponder()
		self.pinCodeTF.resignFirstResponder()

		// get values
		nicknameArray[registeredNum] = self.nicknameTF.text!
		if(0<self.pinCodeTF.text!.count && self.pinCodeTF.text!.count<=6) {
			pinCodeArray[registeredNum] = self.pinCodeTF.text!
		} else {
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "暗証番号は1桁以上6桁以下にしてください。", preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}
	}
	
	/// 連絡先を入力するスクロール部分のViewを作成
	/// - Authors: Nozomi Koyama
	func createContactInfoListView() -> UIView {
		// MARK: Views
		let contactInfoListView = UIView()
		let lineIdLabel			= UILabel()			// LINE ID label
		let emailAddressLabel	= UILabel()			// e-mail address label
		let phoneNumberLabel	= UILabel()			// phone number label
		let instagramIdLabel	= UILabel()			// Instagram ID label

		contactInfoListView.backgroundColor = UIColor.black

		// LINE ID
		lineIdLabel.text = "LINE ID"
		lineIdLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(lineIdLabel)
		lineIdLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(20)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(10)
		}

		// e-mail address
		emailAddressLabel.text = "e-mail address"
		emailAddressLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(emailAddressLabel)
		emailAddressLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(20)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(50)
		}

		// phone number
		phoneNumberLabel.text = "phone number"
		phoneNumberLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(phoneNumberLabel)
		phoneNumberLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(20)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(90)
		}

		// Instagram ID
		instagramIdLabel.text = "Instagram ID"
		instagramIdLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(instagramIdLabel)
		instagramIdLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(20)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(130)
		}

		return contactInfoListView
	}
}
