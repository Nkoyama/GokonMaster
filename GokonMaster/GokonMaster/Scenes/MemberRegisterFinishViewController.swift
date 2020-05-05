//
//  MemberRegisterFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/04/12.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MemberRegisterFinishViewController: UIViewController, UITextFieldDelegate{

	// MARK: Views
	let backBtn				= UIButton()			// back button
	let smallTitle			= UILabel()				// title
	let registeredNickname	= UILabel()				// registered nickname
	let message1			= UILabel()				// message1
	let nickname			= UILabel()				// nickname
	let sex					= UILabel()				// sex
	let pinCode				= UILabel()				// PIN code
	let lineId				= UILabel()				// LINE ID
	let emailAddress		= UILabel()				// e-mail address
	let phoneNumber			= UILabel()				// phone number
	let instagramId			= UILabel()				// Instagram ID
	let twitterId			= UILabel()				// Twitter ID
	let contactInfoOther	= UILabel()				// contact information other
	let nextBtn				= UIButton()			// 次へボタン


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// return button
		self.backBtn.setTitle(" 登録内容修正 ", for: .normal)
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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// registered nickname
		self.registeredNickname.text = nicknameArray[registeredNum] + " さん"
		self.registeredNickname.textColor = UIColor.red
		self.registeredNickname.font = self.registeredNickname.font.withSize(20)
		self.view.addSubview(registeredNickname)
		self.registeredNickname.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
		}

		// message1
		self.message1.text = "以下の情報が登録されました。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}

		// sex
		if(sexIndexArray[registeredNum] == 1){
			self.sex.text = "性別 : 女"
		}else{
			self.sex.text = "性別 : 男"
		}
		self.sex.textColor = UIColor.black
		self.view.addSubview(sex)
		self.sex.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(290)
		}

		// PIN code
		self.pinCode.text = "暗証番号 : " + String(pinCodeArray[registeredNum])
		self.pinCode.textColor = UIColor.black
		self.view.addSubview(pinCode)
		self.pinCode.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
		}

		// LINE ID
		if(lineIdArray[registeredNum] == ""){
			self.lineId.text = "LINE ID : 未登録"
			self.lineId.textColor = UIColor.lightGray
		}else{
			self.lineId.text = "LINE ID : " + lineIdArray[registeredNum]
			self.lineId.textColor = UIColor.black
		}
		self.view.addSubview(lineId)
		self.lineId.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
		}

		// e-mail address
		if(emailAddressArray[registeredNum] == ""){
			self.emailAddress.text = "e-mail address : 未登録"
			self.emailAddress.textColor = UIColor.lightGray
		}else{
			self.emailAddress.text = "e-mail address : " + emailAddressArray[registeredNum]
			self.emailAddress.textColor = UIColor.black
		}
		self.view.addSubview(emailAddress)
		self.emailAddress.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(380)
		}

		// phone number
		if(phoneNumberArray[registeredNum] == ""){
			self.phoneNumber.text = "phone number : 未登録"
			self.phoneNumber.textColor = UIColor.lightGray
		}else{
			self.phoneNumber.text = "phone number : " + phoneNumberArray[registeredNum]
			self.phoneNumber.textColor = UIColor.black
		}
		self.view.addSubview(phoneNumber)
		self.phoneNumber.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(410)
		}

		// Instagram ID
		if(instagramIdArray[registeredNum] == ""){
			self.instagramId.text = "Instagram ID : 未登録"
			self.instagramId.textColor = UIColor.lightGray
		}else{
			self.instagramId.text = "Instagram ID : " + instagramIdArray[registeredNum]
			self.instagramId.textColor = UIColor.black
		}
		self.view.addSubview(instagramId)
		self.instagramId.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(440)
		}

		// Twitter ID
		if(twitterIdArray[registeredNum] == ""){
			self.twitterId.text = "Twitter ID : 未登録"
			self.twitterId.textColor = UIColor.lightGray
		}else{
			self.twitterId.text = "Twitter ID : " + twitterIdArray[registeredNum]
			self.twitterId.textColor = UIColor.black
		}
		self.view.addSubview(twitterId)
		self.twitterId.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(470)
		}

		// other
		if(contactInfoOtherNameArray[registeredNum] == ""){
			self.contactInfoOther.text = "other : 未登録"
			self.contactInfoOther.textColor = UIColor.lightGray
		}else{
			self.contactInfoOther.text = contactInfoOtherNameArray[registeredNum] + " : " + contactInfoOtherArray[registeredNum]
			self.contactInfoOther.textColor = UIColor.black
		}
		self.view.addSubview(contactInfoOther)
		self.contactInfoOther.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(500)
		}

		// next button
		self.nextBtn.setTitle(" 次へ ", for: .normal)
		self.nextBtn.setTitleColor(UIColor.black, for: .normal)
		self.nextBtn.backgroundColor = UIColor.green
		self.nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.nextBtn.layer.borderColor = UIColor.clear.cgColor
		self.nextBtn.layer.borderWidth = 2.0
		self.nextBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.nextBtn)
		self.nextBtn.addTarget(self, action: #selector(self.nextBtnDidTap(_:)), for: .touchUpInside)
		self.nextBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
		}
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		if(registeredNum == joinNumSum){
		}else{
			let memberRegisterViewController = MemberRegisterViewController()
			memberRegisterViewController.modalPresentationStyle = .fullScreen
			self.present(memberRegisterViewController, animated: true)
		}

		// registered number count up
		registeredNum += 1;
	}
}
