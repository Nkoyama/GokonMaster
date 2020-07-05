//
//  MemberRegisterFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/04/12.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MemberRegisterFinishViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

	// MARK: Views
	let backBtn					= UIButton()		// back button
	let registeredNickname		= UILabel()			// registered nickname
	let message1				= UILabel()			// message1
	let contactInfoScrollV		= UIScrollView()	// contact information scroll view
	let message2				= UILabel()			// message2
	let doorWay					= UILabel()			// 出入口
	let seatBtnA				= UIButton()		// seat button A
	let seatBtnB				= UIButton()		// seat button B
	let seatBtnC				= UIButton()		// seat button C
	let seatBtnD				= UIButton()		// seat button D
	let seatBtnE				= UIButton()		// seat button E
	let seatBtnF				= UIButton()		// seat button F
	let seatBtnG				= UIButton()		// seat button G
	let seatBtnH				= UIButton()		// seat button H
	let seatBtnI				= UIButton()		// seat button I
	let seatBtnJ				= UIButton()		// seat button J
	let nextBtn					= UIButton()		// 次へボタン
	let nickname				= UILabel()			// nickname
	let sexLabel				= UILabel()			// sex label
	let sex						= UILabel()			// sex
	let pinCodeLabel			= UILabel()			// PIN code label
	let pinCode					= UILabel()			// PIN code

	let SCREEN_SIZE				= UIScreen.main.bounds.size

	// テーブル選択状況
	let memberIndexA = seatPositionArray[0]
	let memberIndexB = seatPositionArray[1]
	let memberIndexC = seatPositionArray[2]
	let memberIndexD = seatPositionArray[3]
	let memberIndexE = seatPositionArray[4]
	let memberIndexF = seatPositionArray[5]
	let memberIndexG = seatPositionArray[6]
	let memberIndexH = seatPositionArray[7]
	let memberIndexI = seatPositionArray[8]
	let memberIndexJ = seatPositionArray[9]


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
		self.backBtn.addTarget(self,
							   action: #selector(self.backBtnDidTap(_:)),
							   for: .touchUpInside)
		self.backBtn.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(5)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(0)
		}

		// registered nickname
		self.registeredNickname.text = memberData[registeredNum].nickname + " さん"
		self.registeredNickname.textColor = UIColor.red
		self.registeredNickname.font = self.registeredNickname.font.withSize(20)
		self.view.addSubview(registeredNickname)
		self.registeredNickname.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// message1
		self.message1.text = "以下の情報が登録されました。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(130)
		}

		// sex
		self.sexLabel.text = "性別 : "
		self.sexLabel.textColor = UIColor.black
		self.view.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2-10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}
		if(memberData[registeredNum].sexIndex == 1){
			self.sex.text = "女"
		}else{
			self.sex.text = "男"
		}
		self.sex.textColor = UIColor.black
		self.view.addSubview(sex)
		self.sex.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// PIN code
		self.pinCodeLabel.text = "暗証番号 : "
		self.pinCodeLabel.textColor = UIColor.black
		self.view.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2-10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}
		self.pinCode.text = String(memberData[registeredNum].pinCode)
		self.pinCode.textColor = UIColor.black
		self.view.addSubview(pinCode)
		self.pinCode.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
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
		registeredNum += 1
		if( registeredNum == joinNumSum ) {
			let settingFinishViewController = SettingFinishViewController()
			settingFinishViewController.modalPresentationStyle = .fullScreen
			self.present(settingFinishViewController, animated: true)
		} else {
			let memberRegisterViewController = MemberRegisterViewController()
			memberRegisterViewController.modalPresentationStyle = .fullScreen
			self.present(memberRegisterViewController, animated: true)
		}
	}
}
