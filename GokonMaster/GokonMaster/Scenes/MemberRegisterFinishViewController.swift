//
//  MemberRegisterFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/04/12.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MemberRegisterFinishViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate{

	// MARK: Views
	let backBtn					= UIButton()		// back button
	let smallTitle				= UILabel()			// title
	let registeredNickname		= UILabel()			// registered nickname
	let message1				= UILabel()			// message1
	let contactInfoScrollV		= UIScrollView()	// contact information scroll view
	let nextBtn					= UIButton()		// 次へボタン
	
	let SCREEN_SIZE				= UIScreen.main.bounds.size

	// contactInfoScrollV内
	let nickname				= UILabel()			// nickname
	let sexLabel				= UILabel()			// sex label
	let sex						= UILabel()			// sex
	let pinCodeLabel			= UILabel()			// PIN code label
	let pinCode					= UILabel()			// PIN code
	let lineIdLabel				= UILabel()			// LINE ID label
	let lineId					= UILabel()			// LINE ID
	let emailAddressLabel		= UILabel()			// e-mail address label
	let emailAddress			= UILabel()			// e-mail address
	let phoneNumberLabel		= UILabel()			// phone number label
	let phoneNumber				= UILabel()			// phone number
	let instagramIdLabel		= UILabel()			// Instagram ID label
	let instagramId				= UILabel()			// Instagram ID
	let twitterIdLabel			= UILabel()			// Twitter ID label
	let twitterId				= UILabel()			// Twitter ID
	let contactInfoOtherName	= UILabel()			// contact information other name
	let contactInfoOther		= UILabel()			// contact information other


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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(160)
		}

		// message1
		self.message1.text = "以下の情報が登録されました。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// scroll view
		self.contactInfoScrollV.layer.borderColor = UIColor.black.cgColor
		self.contactInfoScrollV.backgroundColor = UIColor.init(red: 84/255, green: 255/255, blue: 159/255, alpha: 0.5)
		self.contactInfoScrollV.layer.borderWidth = 1.0
		self.contactInfoScrollV.contentSize = CGSize(width: self.view.frame.width-100, height: 180)
		self.contactInfoScrollV.delegate = self
		self.view.addSubview(self.contactInfoScrollV)
		self.contactInfoScrollV.frame.origin.y		= 280
		self.contactInfoScrollV.frame.origin.x		= 50
		self.contactInfoScrollV.frame.size.height	= SCREEN_SIZE.height - 760
		self.contactInfoScrollV.frame.size.width	= SCREEN_SIZE.width - 100
		let contactInfoView = createContactInfoListView()
		self.contactInfoScrollV.addSubview(contactInfoView)
		// ドラッグ開始時にキーボードを閉じる
		self.contactInfoScrollV.keyboardDismissMode = .onDrag
		// キーボードを下にドラッグした時にキーボードを閉じる
		self.contactInfoScrollV.keyboardDismissMode = .interactive

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
	
	/// 登録された連絡先を表示するスクロール部分のViewを作成
	/// - Authors: Nozomi Koyama
	func createContactInfoListView() -> UIView {
		// MARK: Views
		let contactInfoListView = UIView()
		contactInfoListView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-100, height: 180)

		// sex
		self.sexLabel.text = "性別 : "
		self.sexLabel.textColor = UIColor.black
		contactInfoListView.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(10)
		}
		if(sexIndexArray[registeredNum] == 1){
			self.sex.text = "女"
		}else{
			self.sex.text = "男"
		}
		self.sex.textColor = UIColor.black
		contactInfoListView.addSubview(sex)
		self.sex.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(10)
		}
		
		// PIN code
		self.pinCodeLabel.text = "暗証番号 : "
		self.pinCodeLabel.textColor = UIColor.black
		contactInfoListView.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(30)
		}
		self.pinCode.text = String(pinCodeArray[registeredNum])
		self.pinCode.textColor = UIColor.black
		contactInfoListView.addSubview(pinCode)
		self.pinCode.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(30)
		}

		// LINE ID
		self.lineIdLabel.text = "LINE ID : "
		self.lineIdLabel.textColor = UIColor.black
		contactInfoListView.addSubview(lineIdLabel)
		self.lineIdLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(50)
		}
		if(lineIdArray[registeredNum] == ""){
			self.lineId.text = "未登録"
			self.lineId.textColor = UIColor.lightGray
		}else{
			self.lineId.text = lineIdArray[registeredNum]
			self.lineId.textColor = UIColor.black
		}
		contactInfoListView.addSubview(lineId)
		self.lineId.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(50)
		}

		// e-mail address
		self.emailAddressLabel.text = "e-mail address : "
		self.emailAddressLabel.textColor = UIColor.black
		contactInfoListView.addSubview(emailAddressLabel)
		self.emailAddressLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(70)
		}
		if(emailAddressArray[registeredNum] == ""){
			self.emailAddress.text = "未登録"
			self.emailAddress.textColor = UIColor.lightGray
		}else{
			self.emailAddress.text = emailAddressArray[registeredNum]
			self.emailAddress.textColor = UIColor.black
		}
		contactInfoListView.addSubview(emailAddress)
		self.emailAddress.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// phone number
		self.phoneNumberLabel.text = "phone number : "
		self.phoneNumberLabel.textColor = UIColor.black
		contactInfoListView.addSubview(phoneNumberLabel)
		self.phoneNumberLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(90)
		}
		if(phoneNumberArray[registeredNum] == ""){
			self.phoneNumber.text = "未登録"
			self.phoneNumber.textColor = UIColor.lightGray
		}else{
			self.phoneNumber.text = phoneNumberArray[registeredNum]
			self.phoneNumber.textColor = UIColor.black
		}
		contactInfoListView.addSubview(phoneNumber)
		self.phoneNumber.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(90)
		}

		// Instagram ID
		self.instagramIdLabel.text = "Instagram ID : "
		self.instagramIdLabel.textColor = UIColor.black
		contactInfoListView.addSubview(instagramIdLabel)
		self.instagramIdLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(110)
		}
		if(instagramIdArray[registeredNum] == ""){
			self.instagramId.text = "未登録"
			self.instagramId.textColor = UIColor.lightGray
		}else{
			self.instagramId.text = instagramIdArray[registeredNum]
			self.instagramId.textColor = UIColor.black
		}
		contactInfoListView.addSubview(instagramId)
		self.instagramId.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(110)
		}

		// Twitter ID
		self.twitterIdLabel.text = "Twitter ID : "
		self.twitterIdLabel.textColor = UIColor.black
		contactInfoListView.addSubview(twitterIdLabel)
		self.twitterIdLabel.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(130)
		}
		if(twitterIdArray[registeredNum] == ""){
			self.twitterId.text = "未登録"
			self.twitterId.textColor = UIColor.lightGray
		}else{
			self.twitterId.text = twitterIdArray[registeredNum]
			self.twitterId.textColor = UIColor.black
		}
		contactInfoListView.addSubview(twitterId)
		self.twitterId.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(130)
		}

		// other
		if(contactInfoOtherNameArray[registeredNum] == ""){
			self.contactInfoOtherName.text = "other : "
			self.contactInfoOtherName.textColor = UIColor.lightGray
			self.contactInfoOther.text = "未登録"
			self.contactInfoOther.textColor = UIColor.lightGray
		}else{
			self.contactInfoOtherName.text = contactInfoOtherNameArray[registeredNum] + " : "
			self.contactInfoOtherName.textColor = UIColor.black
			self.contactInfoOther.text = contactInfoOtherArray[registeredNum]
			self.contactInfoOther.textColor = UIColor.black
		}
		contactInfoListView.addSubview(contactInfoOtherName)
		self.contactInfoOtherName.snp.makeConstraints { (make) in
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(150)
		}
		contactInfoListView.addSubview(contactInfoOther)
		self.contactInfoOther.snp.makeConstraints{ (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(150)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(150)
		}

		return contactInfoListView
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
