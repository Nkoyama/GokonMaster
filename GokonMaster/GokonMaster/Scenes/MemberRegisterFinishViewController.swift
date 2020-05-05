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

		// setting message
		self.message2.text = "あなたの現在の位置はどこですか？"
		self.message2.textColor = UIColor.black
		self.view.addSubview(message2)
		self.message2.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(400)
		}

		// テーブル分岐
		if(tableTypeIndex == 0) {
			// square
			var seatNum:Int = joinNumSum/2
			if(maleNum>seatNum) {seatNum = maleNum}
			if(femaleNum>seatNum) {seatNum = femaleNum}

			// テーブル描写
			let screenWidth:Int = Int(self.view.bounds.width)
			let tableSquareDraw = TableSquareDrawView(frame: CGRect(x: screenWidth/2-80, y: Int(SCREEN_SIZE.height)-425, width: 160, height: seatNum*60))
			self.view.addSubview(tableSquareDraw)

			// seat button A
			if(seatAFlg) {
				self.seatBtnA.backgroundColor = UIColor.blue
			} else {
				self.seatBtnA.backgroundColor = UIColor.white
			}
			self.seatBtnA.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnA.layer.borderWidth = 2.0
			self.seatBtnA.layer.cornerRadius = 2.0
			self.seatBtnA.tag = 1
			self.view.addSubview(self.seatBtnA)
			self.seatBtnA.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
			self.seatBtnA.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(60)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(380)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(340)
			}
			// seat button F
			if(seatFFlg) {
				self.seatBtnF.backgroundColor = UIColor.blue
			} else {
				self.seatBtnF.backgroundColor = UIColor.white
			}
			self.seatBtnF.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnF.layer.borderWidth = 2.0
			self.seatBtnF.layer.cornerRadius = 2.0
			self.seatBtnF.tag = 6
			self.view.addSubview(self.seatBtnF)
			self.seatBtnF.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
			self.seatBtnF.snp.makeConstraints { (make) in
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(60)
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(380)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(340)
			}
			if(seatNum>=2) {
				// seat button B
				if(seatBFlg) {
					self.seatBtnB.backgroundColor = UIColor.blue
				} else {
					self.seatBtnB.backgroundColor = UIColor.white
				}
				self.seatBtnB.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnB.layer.borderWidth = 2.0
				self.seatBtnB.layer.cornerRadius = 2.0
				self.seatBtnB.tag = 2
				self.view.addSubview(self.seatBtnB)
				self.seatBtnB.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnB.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(60)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(320)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(280)
				}
				// seat button G
				if(seatGFlg) {
					self.seatBtnG.backgroundColor = UIColor.blue
				} else {
					self.seatBtnG.backgroundColor = UIColor.white
				}
				self.seatBtnG.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnG.layer.borderWidth = 2.0
				self.seatBtnG.layer.cornerRadius = 2.0
				self.seatBtnG.tag = 7
				self.view.addSubview(self.seatBtnG)
				self.seatBtnG.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnG.snp.makeConstraints { (make) in
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(60)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(320)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(280)
				}
			}
			if(seatNum>=3) {
				// seat button C
				if(seatCFlg) {
					self.seatBtnC.backgroundColor = UIColor.blue
				} else {
					self.seatBtnC.backgroundColor = UIColor.white
				}
				self.seatBtnC.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnC.layer.borderWidth = 2.0
				self.seatBtnC.layer.cornerRadius = 2.0
				self.seatBtnC.tag = 3
				self.view.addSubview(self.seatBtnC)
				self.seatBtnC.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnC.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(60)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(220)
				}
				// seat button H
				if(seatHFlg) {
					self.seatBtnH.backgroundColor = UIColor.blue
				} else {
					self.seatBtnH.backgroundColor = UIColor.white
				}
				self.seatBtnH.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnH.layer.borderWidth = 2.0
				self.seatBtnH.layer.cornerRadius = 2.0
				self.seatBtnH.tag = 8
				self.view.addSubview(self.seatBtnH)
				self.seatBtnH.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnH.snp.makeConstraints { (make) in
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(60)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(260)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(220)
				}
			}
			if(seatNum>=4) {
				// seat button D
				if(seatDFlg) {
					self.seatBtnD.backgroundColor = UIColor.blue
				} else {
					self.seatBtnD.backgroundColor = UIColor.white
				}
				self.seatBtnD.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnD.layer.borderWidth = 2.0
				self.seatBtnD.layer.cornerRadius = 2.0
				self.seatBtnD.tag = 4
				self.view.addSubview(self.seatBtnD)
				self.seatBtnD.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnD.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(60)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(200)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(160)
				}
				// seat button I
				if(seatIFlg) {
					self.seatBtnI.backgroundColor = UIColor.blue
				} else {
					self.seatBtnI.backgroundColor = UIColor.white
				}
				self.seatBtnI.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnI.layer.borderWidth = 2.0
				self.seatBtnI.layer.cornerRadius = 2.0
				self.seatBtnI.tag = 9
				self.view.addSubview(self.seatBtnI)
				self.seatBtnI.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnI.snp.makeConstraints { (make) in
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(60)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(200)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(160)
				}
			}
			if(seatNum>=5) {
				// seat button E
				if(seatEFlg) {
					self.seatBtnE.backgroundColor = UIColor.blue
				} else {
					self.seatBtnE.backgroundColor = UIColor.white
				}
				self.seatBtnE.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnE.layer.borderWidth = 2.0
				self.seatBtnE.layer.cornerRadius = 2.0
				self.seatBtnE.tag = 5
				self.view.addSubview(self.seatBtnE)
				self.seatBtnE.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnE.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(60)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(140)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100)
				}
				// seat button J
				if(seatJFlg) {
					self.seatBtnJ.backgroundColor = UIColor.blue
				} else {
					self.seatBtnJ.backgroundColor = UIColor.white
				}
				self.seatBtnJ.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnJ.layer.borderWidth = 2.0
				self.seatBtnJ.layer.cornerRadius = 2.0
				self.seatBtnJ.tag = 10
				self.view.addSubview(self.seatBtnJ)
				self.seatBtnJ.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnJ.snp.makeConstraints { (make) in
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(60)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(140)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100)
				}
			}
		} else if(tableTypeIndex == 1) {
			// circle
			let screenWidth = SCREEN_SIZE.width
			let tableCircleDraw = TableCircleDrawView(frame: CGRect(x: Int(screenWidth)/2-90, y: Int(SCREEN_SIZE.height)-370, width: 180, height: 180))
			self.view.addSubview(tableCircleDraw)
			
			/* いい感じにseat buttonを配置 */
			let eachAngle:CGFloat = CGFloat(360/(joinNumSum+1))	// 座席を配置する間隔(角度)

			// 出入口
			self.doorWay.text = " 出入口 "
			self.doorWay.textColor = UIColor.black
			self.doorWay.font = UIFont.boldSystemFont(ofSize: 20.0)
			self.doorWay.backgroundColor = UIColor.init(red: 102/255, green: 51/255, blue: 204/255, alpha: 0.5)
			self.doorWay.layer.borderColor = UIColor.gray.cgColor
			self.doorWay.layer.borderWidth = 1.0
			self.doorWay.layer.cornerRadius = 5.0
			self.view.addSubview(doorWay)
			self.doorWay.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(SCREEN_SIZE.height-450)
			}

			// seat button A
			if(seatAFlg) {
				self.seatBtnA.backgroundColor = UIColor.blue
			} else {
				self.seatBtnA.backgroundColor = UIColor.white
			}
			self.seatBtnA.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnA.layer.borderWidth = 2.0
			self.seatBtnA.layer.cornerRadius = 25.0
			self.seatBtnA.tag = 1
			self.view.addSubview(self.seatBtnA)
			self.seatBtnA.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
			let centerX_a = screenWidth/2 + 120*cos(CGFloat.pi*(eachAngle-90)/180)
			let centerY_a = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(eachAngle-90)/180)
			self.seatBtnA.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_a-25)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_a+25)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_a-25)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_a+25)
			}
			// seat button B
			if(seatBFlg) {
				self.seatBtnB.backgroundColor = UIColor.blue
			} else {
				self.seatBtnB.backgroundColor = UIColor.white
			}
			self.seatBtnB.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnB.layer.borderWidth = 2.0
			self.seatBtnB.layer.cornerRadius = 25.0
			self.seatBtnB.tag = 2
			self.view.addSubview(self.seatBtnB)
			self.seatBtnB.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
			let centerX_b = screenWidth/2 + 120*cos(CGFloat.pi*(2*eachAngle-90)/180)
			let centerY_b = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(2*eachAngle-90)/180)
			self.seatBtnB.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_b-25)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_b+25)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_b-25)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_b+25)
			}
			// seat button C
			if(joinNumSum >= 3) {
				if(seatCFlg) {
					self.seatBtnC.backgroundColor = UIColor.blue
				} else {
					self.seatBtnC.backgroundColor = UIColor.white
				}
				self.seatBtnC.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnC.layer.borderWidth = 2.0
				self.seatBtnC.layer.cornerRadius = 25.0
				self.seatBtnC.tag = 3
				self.view.addSubview(self.seatBtnC)
				self.seatBtnC.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(3*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(3*eachAngle-90)/180)
				self.seatBtnC.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button D
			if(joinNumSum >= 4) {
				if(seatDFlg) {
					self.seatBtnD.backgroundColor = UIColor.blue
				} else {
					self.seatBtnD.backgroundColor = UIColor.white
				}
				self.seatBtnD.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnD.layer.borderWidth = 2.0
				self.seatBtnD.layer.cornerRadius = 25.0
				self.seatBtnD.tag = 4
				self.view.addSubview(self.seatBtnD)
				self.seatBtnD.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(4*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(4*eachAngle-90)/180)
				self.seatBtnD.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button E
			if(joinNumSum >= 5) {
				if(seatEFlg) {
					self.seatBtnE.backgroundColor = UIColor.blue
				} else {
					self.seatBtnE.backgroundColor = UIColor.white
				}
				self.seatBtnE.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnE.layer.borderWidth = 2.0
				self.seatBtnE.layer.cornerRadius = 25.0
				self.seatBtnE.tag = 5
				self.view.addSubview(self.seatBtnE)
				self.seatBtnE.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(5*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(5*eachAngle-90)/180)
				self.seatBtnE.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button F
			if(joinNumSum >= 6) {
				if(seatFFlg) {
					self.seatBtnF.backgroundColor = UIColor.blue
				} else {
					self.seatBtnF.backgroundColor = UIColor.white
				}
				self.seatBtnF.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnF.layer.borderWidth = 2.0
				self.seatBtnF.layer.cornerRadius = 25.0
				self.seatBtnF.tag = 6
				self.view.addSubview(self.seatBtnF)
				self.seatBtnF.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(6*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(6*eachAngle-90)/180)
				self.seatBtnF.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button G
			if(joinNumSum >= 7) {
				if(seatGFlg) {
					self.seatBtnG.backgroundColor = UIColor.blue
				} else {
					self.seatBtnG.backgroundColor = UIColor.white
				}
				self.seatBtnG.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnG.layer.borderWidth = 2.0
				self.seatBtnG.layer.cornerRadius = 25.0
				self.seatBtnG.tag = 7
				self.view.addSubview(self.seatBtnG)
				self.seatBtnG.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(7*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(7*eachAngle-90)/180)
				self.seatBtnG.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button H
			if(joinNumSum >= 8) {
				if(seatHFlg) {
					self.seatBtnH.backgroundColor = UIColor.blue
				} else {
					self.seatBtnH.backgroundColor = UIColor.white
				}
				self.seatBtnH.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnH.layer.borderWidth = 2.0
				self.seatBtnH.layer.cornerRadius = 25.0
				self.seatBtnH.tag = 8
				self.view.addSubview(self.seatBtnH)
				self.seatBtnH.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(8*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(8*eachAngle-90)/180)
				self.seatBtnH.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button I
			if(joinNumSum >= 9) {
				if(seatIFlg) {
					self.seatBtnI.backgroundColor = UIColor.blue
				} else {
					self.seatBtnI.backgroundColor = UIColor.white
				}
				self.seatBtnI.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnI.layer.borderWidth = 2.0
				self.seatBtnI.layer.cornerRadius = 25.0
				self.seatBtnI.tag = 9
				self.view.addSubview(self.seatBtnI)
				self.seatBtnI.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(9*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(9*eachAngle-90)/180)
				self.seatBtnI.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
			// seat button J
			if(joinNumSum >= 10) {
				if(seatJFlg) {
					self.seatBtnJ.backgroundColor = UIColor.blue
				} else {
					self.seatBtnJ.backgroundColor = UIColor.white
				}
				self.seatBtnJ.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnJ.layer.borderWidth = 2.0
				self.seatBtnJ.layer.cornerRadius = 25.0
				self.seatBtnJ.tag = 10
				self.view.addSubview(self.seatBtnJ)
				self.seatBtnJ.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				let centerX = screenWidth/2 + 120*cos(CGFloat.pi*(10*eachAngle-90)/180)
				let centerY = SCREEN_SIZE.height-320 + 120*sin(CGFloat.pi*(10*eachAngle-90)/180)
				self.seatBtnJ.snp.makeConstraints { (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX-25)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX+25)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY-25)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY+25)
				}
			}
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

	/// seatBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func seatBtnDidTap(_ sender: Any) {
		if let button = sender as? UIButton {
			if let tag = actionTag(rawValue: button.tag) {
				switch tag {
					case .actionA:
						if(!seatAFlg) {
							self.seatBtnA.backgroundColor = UIColor.blue
							seatAFlg = true
						} else {
							self.seatBtnA.backgroundColor = UIColor.white
							seatAFlg = false
					}
					case .actionB:
						if(!seatBFlg) {
							self.seatBtnB.backgroundColor = UIColor.blue
							seatBFlg = true
						} else {
							self.seatBtnB.backgroundColor = UIColor.white
							seatBFlg = false
					}
					case .actionC:
						if(!seatCFlg) {
							self.seatBtnC.backgroundColor = UIColor.blue
							seatCFlg = true
						} else {
							self.seatBtnC.backgroundColor = UIColor.white
							seatCFlg = false
					}
					case .actionD:
						if(!seatDFlg) {
							self.seatBtnD.backgroundColor = UIColor.blue
							seatDFlg = true
						} else {
							self.seatBtnD.backgroundColor = UIColor.white
							seatEFlg = false
					}
					case .actionE:
						if(!seatEFlg) {
							self.seatBtnE.backgroundColor = UIColor.blue
							seatEFlg = true
						} else {
							self.seatBtnE.backgroundColor = UIColor.white
							seatEFlg = false
					}
					case .actionF:
						if(!seatFFlg) {
							self.seatBtnF.backgroundColor = UIColor.blue
							seatFFlg = true
						} else {
							self.seatBtnF.backgroundColor = UIColor.white
							seatFFlg = false
					}
					case .actionG:
						if(!seatGFlg) {
							self.seatBtnG.backgroundColor = UIColor.blue
							seatGFlg = true
						} else {
							self.seatBtnG.backgroundColor = UIColor.white
							seatGFlg = false
					}
					case .actionH:
						if(!seatHFlg) {
							self.seatBtnH.backgroundColor = UIColor.blue
							seatHFlg = true
						} else {
							self.seatBtnH.backgroundColor = UIColor.white
							seatHFlg = false
					}
					case .actionI:
						if(!seatIFlg) {
							self.seatBtnI.backgroundColor = UIColor.blue
							seatIFlg = true
						} else {
							self.seatBtnI.backgroundColor = UIColor.white
							seatIFlg = false
					}
					case .actionJ:
						if(!seatJFlg) {
							self.seatBtnJ.backgroundColor = UIColor.blue
							seatJFlg = true
						} else {
							self.seatBtnJ.backgroundColor = UIColor.white
							seatJFlg = false
					}
				}
			}
		}
	}
	enum actionTag: Int {
		case actionA = 1
		case actionB = 2
		case actionC = 3
		case actionD = 4
		case actionE = 5
		case actionF = 6
		case actionG = 7
		case actionH = 8
		case actionI = 9
		case actionJ = 10
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
