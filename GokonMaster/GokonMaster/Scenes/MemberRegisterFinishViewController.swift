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
		self.backBtn.addTarget(self, action: #selector(self.backBtnDidTap(_:)), for: .touchUpInside)
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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(100)
		}

		// sex
		self.sexLabel.text = "性別 : "
		self.sexLabel.textColor = UIColor.black
		self.view.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2-10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(130)
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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(130)
		}

		// PIN code
		self.pinCodeLabel.text = "暗証番号 : "
		self.pinCodeLabel.textColor = UIColor.black
		self.view.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2-10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(160)
		}
		self.pinCode.text = String(memberData[registeredNum].pinCode)
		self.pinCode.textColor = UIColor.black
		self.view.addSubview(pinCode)
		self.pinCode.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(160)
		}

		// setting message
		self.message2.text = "あなたの現在の位置はどこですか？"
		self.message2.textColor = UIColor.black
		self.view.addSubview(message2)
		self.message2.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(430)
		}

		// テーブル分岐
		if(tableTypeIndex == 0) {
			// square
			var seatNum:Int = joinNumSum/2
			if(maleNum>seatNum) {seatNum = maleNum}
			if(femaleNum>seatNum) {seatNum = femaleNum}

			// テーブル描写
			let screenWidth:Int = Int(self.view.bounds.width)
			let tableSquareDraw = TableSquareDrawView(frame: CGRect(x: screenWidth/2-80,
																	y: Int(SCREEN_SIZE.height)-420,
																	width: 160,
																	height: seatNum*60))
			self.view.addSubview(tableSquareDraw)

			// seat button A
			if(memberIndexA >= 0){
				self.seatBtnA.setTitle(memberData[memberIndexA].nickname,
									   for: UIControl.State.normal)
				self.seatBtnA.titleLabel?.adjustsFontSizeToFitWidth = true
				self.seatBtnA.setTitleColor(UIColor.black, for: .normal)
				self.seatBtnA.backgroundColor = UIColor.init(red: 84/255,
															 green: 255/255,
															 blue: 159/255,
															 alpha: 0.5)
				self.seatBtnA.isEnabled = false
			} else {
				if(seatPositionArray[0] == registeredNum) {
					self.seatBtnA.backgroundColor = UIColor.blue
				} else {
					self.seatBtnA.backgroundColor = UIColor.white
				}
			}
			self.seatBtnA.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnA.layer.borderWidth = 2.0
			self.seatBtnA.layer.cornerRadius = 2.0
			self.seatBtnA.tag = 0
			self.view.addSubview(self.seatBtnA)
			self.seatBtnA.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
			self.seatBtnA.frame = CGRect(x: 20,
										 y: Int(SCREEN_SIZE.height)-410,
										 width: screenWidth/2-110,
										 height: 40)
			// seat button F
			if(memberIndexF >= 0) {
				self.seatBtnF.setTitle(memberData[memberIndexF].nickname, for: UIControl.State.normal)
				self.seatBtnF.titleLabel?.adjustsFontSizeToFitWidth = true
				self.seatBtnF.setTitleColor(UIColor.black, for: .normal)
				self.seatBtnF.backgroundColor = UIColor.init(red: 84/255,
															 green: 255/255,
															 blue: 159/255,
															 alpha: 0.5)
				self.seatBtnF.isEnabled = false
			} else {
				if(seatPositionArray[5] == registeredNum) {
					self.seatBtnF.backgroundColor = UIColor.blue
				} else {
					self.seatBtnF.backgroundColor = UIColor.white
				}
			}
			self.seatBtnF.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnF.layer.borderWidth = 2.0
			self.seatBtnF.layer.cornerRadius = 2.0
			self.seatBtnF.tag = 5
			self.view.addSubview(self.seatBtnF)
			self.seatBtnF.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
			self.seatBtnF.frame = CGRect(x: screenWidth/2+90,
										 y: Int(SCREEN_SIZE.height)-410,
										 width: screenWidth/2-110,
										 height: 40)
			if(seatNum>=2) {
				// seat button B
				if(memberIndexB >= 0) {
					self.seatBtnB.setTitle(memberData[memberIndexB].nickname, for: .normal)
					self.seatBtnB.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnB.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnB.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnB.isEnabled = false
				} else {
					if(seatPositionArray[1] == registeredNum) {
						self.seatBtnB.backgroundColor = UIColor.blue
					} else {
						self.seatBtnB.backgroundColor = UIColor.white
					}
				}
				self.seatBtnB.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnB.layer.borderWidth = 2.0
				self.seatBtnB.layer.cornerRadius = 2.0
				self.seatBtnB.tag = 1
				self.view.addSubview(self.seatBtnB)
				self.seatBtnB.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnB.frame = CGRect(x: 20,
											 y: Int(SCREEN_SIZE.height)-350,
											 width: screenWidth/2-110,
											 height: 40)
				// seat button G
				if(memberIndexG >= 0) {
					self.seatBtnG.setTitle(memberData[memberIndexG].nickname, for: .normal)
					self.seatBtnG.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnG.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnG.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnG.isEnabled = false
				} else {
					if(seatPositionArray[6] == registeredNum) {
						self.seatBtnG.backgroundColor = UIColor.blue
					} else {
						self.seatBtnG.backgroundColor = UIColor.white
					}
				}
				self.seatBtnG.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnG.layer.borderWidth = 2.0
				self.seatBtnG.layer.cornerRadius = 2.0
				self.seatBtnG.tag = 6
				self.view.addSubview(self.seatBtnG)
				self.seatBtnG.addTarget(self,
										action: #selector(self.seatBtnDidTap(_:)),
										for: .touchUpInside)
				self.seatBtnG.frame = CGRect(x: screenWidth/2+90,
											 y: Int(SCREEN_SIZE.height)-350,
											 width: screenWidth/2-110,
											 height: 40)
			}
			if(seatNum>=3) {
				// seat button C
				if(memberIndexC >= 0) {
					self.seatBtnC.setTitle(memberData[memberIndexC].nickname, for: .normal)
					self.seatBtnC.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnC.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnC.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnC.isEnabled = false
				} else {
					if(seatPositionArray[2] == registeredNum) {
						self.seatBtnC.backgroundColor = UIColor.blue
					} else {
						self.seatBtnC.backgroundColor = UIColor.white
					}
				}
				self.seatBtnC.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnC.layer.borderWidth = 2.0
				self.seatBtnC.layer.cornerRadius = 2.0
				self.seatBtnC.tag = 2
				self.view.addSubview(self.seatBtnC)
				self.seatBtnC.addTarget(self,
										action: #selector(self.seatBtnDidTap(_:)),
										for: .touchUpInside)
				self.seatBtnC.frame = CGRect(x: 20,
											 y: Int(SCREEN_SIZE.height)-290,
											 width: screenWidth/2-110,
											 height: 40)
				// seat button H
				if(memberIndexH >= 0) {
					self.seatBtnH.setTitle(memberData[memberIndexH].nickname, for: .normal)
					self.seatBtnH.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnH.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnH.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnH.isEnabled = false
				} else {
					if(seatPositionArray[7] == registeredNum) {
						self.seatBtnH.backgroundColor = UIColor.blue
					} else {
						self.seatBtnH.backgroundColor = UIColor.white
					}
				}
				self.seatBtnH.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnH.layer.borderWidth = 2.0
				self.seatBtnH.layer.cornerRadius = 2.0
				self.seatBtnH.tag = 7
				self.view.addSubview(self.seatBtnH)
				self.seatBtnH.addTarget(self,
										action: #selector(self.seatBtnDidTap(_:)),
										for: .touchUpInside)
				self.seatBtnH.frame = CGRect(x: screenWidth/2+90,
											 y: Int(SCREEN_SIZE.height)-290,
											 width: screenWidth/2-110,
											 height: 40)
			}
			if(seatNum>=4) {
				// seat button D
				if(memberIndexD >= 0) {
					self.seatBtnD.setTitle(memberData[memberIndexD].nickname, for: .normal)
					self.seatBtnD.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnD.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnD.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnD.isEnabled = false
				} else {
					if(seatPositionArray[3] == registeredNum) {
						self.seatBtnD.backgroundColor = UIColor.blue
					} else {
						self.seatBtnD.backgroundColor = UIColor.white
					}
				}
				self.seatBtnD.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnD.layer.borderWidth = 2.0
				self.seatBtnD.layer.cornerRadius = 2.0
				self.seatBtnD.tag = 3
				self.view.addSubview(self.seatBtnD)
				self.seatBtnD.addTarget(self, action: #selector(self.seatBtnDidTap(_:)), for: .touchUpInside)
				self.seatBtnD.frame = CGRect(x: 20,
											 y: Int(SCREEN_SIZE.height)-230,
											 width: screenWidth/2-110,
											 height: 40)
				// seat button I
				if(memberIndexI >= 0) {
					self.seatBtnI.setTitle(memberData[memberIndexI].nickname, for: .normal)
					self.seatBtnI.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnI.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnI.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnI.isEnabled = false
				} else {
					if(seatPositionArray[8] == registeredNum) {
						self.seatBtnI.backgroundColor = UIColor.blue
					} else {
						self.seatBtnI.backgroundColor = UIColor.white
					}
				}
				self.seatBtnI.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnI.layer.borderWidth = 2.0
				self.seatBtnI.layer.cornerRadius = 2.0
				self.seatBtnI.tag = 8
				self.view.addSubview(self.seatBtnI)
				self.seatBtnI.addTarget(self,
										action: #selector(self.seatBtnDidTap(_:)),
										for: .touchUpInside)
				self.seatBtnI.frame = CGRect(x: screenWidth/2+90,
											 y: Int(SCREEN_SIZE.height)-230,
											 width: screenWidth/2-110,
											 height: 40)
			}
			if(seatNum>=5) {
				// seat button E
				if(memberIndexE >= 0) {
					self.seatBtnE.setTitle(memberData[memberIndexE].nickname, for: .normal)
					self.seatBtnE.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnE.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnE.backgroundColor = UIColor.init(red: 84/255, green: 255/255, blue: 159/255, alpha: 0.5)
					self.seatBtnE.isEnabled = false
				} else {
					if(seatPositionArray[4] == registeredNum) {
						self.seatBtnE.backgroundColor = UIColor.blue
					} else {
						self.seatBtnE.backgroundColor = UIColor.white
					}
				}
				self.seatBtnE.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnE.layer.borderWidth = 2.0
				self.seatBtnE.layer.cornerRadius = 2.0
				self.seatBtnE.tag = 4
				self.view.addSubview(self.seatBtnE)
				self.seatBtnE.addTarget(self,
										action: #selector(self.seatBtnDidTap(_:)),
										for: .touchUpInside)
				self.seatBtnE.frame = CGRect(x: 20,
											 y: Int(SCREEN_SIZE.height)-170,
											 width: screenWidth/2-110,
											 height: 40)
				// seat button J
				if(memberIndexJ >= 0) {
					self.seatBtnJ.setTitle(memberData[memberIndexJ].nickname, for: .normal)
					self.seatBtnJ.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnJ.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnJ.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnJ.isEnabled = false
				} else {
					if(seatPositionArray[9] == registeredNum) {
						self.seatBtnJ.backgroundColor = UIColor.blue
					} else {
						self.seatBtnJ.backgroundColor = UIColor.white
					}
				}
				self.seatBtnJ.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnJ.layer.borderWidth = 2.0
				self.seatBtnJ.layer.cornerRadius = 2.0
				self.seatBtnJ.tag = 9
				self.view.addSubview(self.seatBtnJ)
				self.seatBtnJ.addTarget(self,
										action: #selector(self.seatBtnDidTap(_:)),
										for: .touchUpInside)
				self.seatBtnJ.frame = CGRect(x: screenWidth/2+90,
											 y: Int(SCREEN_SIZE.height)-170,
											 width: screenWidth/2-110,
											 height: 40)
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
			var prefixNumA = 2
			if(memberIndexA >= 0) {
				if(memberData[memberIndexA].nickname.isNotZenkaku) {
					prefixNumA = 5
				}
				self.seatBtnA.setTitle(String(memberData[memberIndexA].nickname.prefix(prefixNumA)),
									   for: .normal)
				self.seatBtnA.titleLabel?.adjustsFontSizeToFitWidth = true
				self.seatBtnA.setTitleColor(UIColor.black, for: .normal)
				self.seatBtnA.backgroundColor = UIColor.init(red: 84/255,
															 green: 255/255,
															 blue: 159/255,
															 alpha: 0.5)
				self.seatBtnA.isEnabled = false
			} else {
				if(seatPositionArray[0] == registeredNum) {
					self.seatBtnA.backgroundColor = UIColor.blue
				} else {
					self.seatBtnA.backgroundColor = UIColor.white
				}
			}
			self.seatBtnA.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnA.layer.borderWidth = 2.0
			self.seatBtnA.layer.cornerRadius = 25.0
			self.seatBtnA.tag = 0
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
			var prefixNumB = 2
			if(memberIndexB >= 0) {
				if(memberData[memberIndexB].nickname.isNotZenkaku) {
					prefixNumB = 5
				}
				self.seatBtnB.setTitle(String(memberData[memberIndexB].nickname.prefix(prefixNumB)),
									   for: .normal)
				self.seatBtnB.titleLabel?.adjustsFontSizeToFitWidth = true
				self.seatBtnB.setTitleColor(UIColor.black, for: .normal)
				self.seatBtnB.backgroundColor = UIColor.init(red: 84/255,
															 green: 255/255,
															 blue: 159/255,
															 alpha: 0.5)
				self.seatBtnB.isEnabled = false
			} else {
				if(seatPositionArray[1] == registeredNum) {
					self.seatBtnB.backgroundColor = UIColor.blue
				} else {
					self.seatBtnB.backgroundColor = UIColor.white
				}
			}
			self.seatBtnB.layer.borderColor = UIColor.gray.cgColor
			self.seatBtnB.layer.borderWidth = 2.0
			self.seatBtnB.layer.cornerRadius = 25.0
			self.seatBtnB.tag = 1
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
				var prefixNumC = 2
				if(memberIndexC >= 0) {
					if(memberData[memberIndexC].nickname.isNotZenkaku) {
						prefixNumC = 5
					}
					self.seatBtnC.setTitle(String(memberData[memberIndexC].nickname.prefix(prefixNumC)),
										   for: .normal)
					self.seatBtnC.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnC.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnC.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnC.isEnabled = false
				} else {
					if(seatPositionArray[2] == registeredNum) {
						self.seatBtnC.backgroundColor = UIColor.blue
					} else {
						self.seatBtnC.backgroundColor = UIColor.white
					}
				}
				self.seatBtnC.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnC.layer.borderWidth = 2.0
				self.seatBtnC.layer.cornerRadius = 25.0
				self.seatBtnC.tag = 2
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
				var prefixNumD = 2
				if(memberIndexD >= 0) {
					if(memberData[memberIndexD].nickname.isNotZenkaku) {
						prefixNumD = 5
					}
					self.seatBtnD.setTitle(String(memberData[memberIndexD].nickname.prefix(prefixNumD)),
										   for: .normal)
					self.seatBtnD.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnD.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnD.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnD.isEnabled = false
				} else {
					if(seatPositionArray[3] == registeredNum) {
						self.seatBtnD.backgroundColor = UIColor.blue
					} else {
						self.seatBtnD.backgroundColor = UIColor.white
					}
				}
				self.seatBtnD.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnD.layer.borderWidth = 2.0
				self.seatBtnD.layer.cornerRadius = 25.0
				self.seatBtnD.tag = 3
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
				var prefixNumE = 2
				if(memberIndexE >= 0) {
					if(memberData[memberIndexE].nickname.isNotZenkaku) {
						prefixNumE = 5
					}
					self.seatBtnE.setTitle(String(memberData[memberIndexE].nickname.prefix(prefixNumE)),
										   for: .normal)
					self.seatBtnE.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnE.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnE.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnE.isEnabled = false
				} else {
					if(seatPositionArray[4] == registeredNum) {
						self.seatBtnE.backgroundColor = UIColor.blue
					} else {
						self.seatBtnE.backgroundColor = UIColor.white
					}
				}
				self.seatBtnE.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnE.layer.borderWidth = 2.0
				self.seatBtnE.layer.cornerRadius = 25.0
				self.seatBtnE.tag = 4
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
				var prefixNumF = 2
				if(memberIndexF >= 0) {
					if(memberData[memberIndexF].nickname.isNotZenkaku) {
						prefixNumF = 5
					}
					self.seatBtnF.setTitle(String(memberData[memberIndexF].nickname.prefix(prefixNumF)),
										   for: .normal)
					self.seatBtnF.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnF.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnF.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnF.isEnabled = false
				} else {
					if(seatPositionArray[5] == registeredNum) {
						self.seatBtnF.backgroundColor = UIColor.blue
					} else {
						self.seatBtnF.backgroundColor = UIColor.white
					}
				}
				self.seatBtnF.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnF.layer.borderWidth = 2.0
				self.seatBtnF.layer.cornerRadius = 25.0
				self.seatBtnF.tag = 5
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
				var prefixNumG = 2
				if(memberIndexG >= 0) {
					if(memberData[memberIndexG].nickname.isNotZenkaku) {
						prefixNumG = 5
					}
					self.seatBtnG.setTitle(String(memberData[memberIndexG].nickname.prefix(prefixNumG)),
										   for: .normal)
					self.seatBtnG.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnG.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnG.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnG.isEnabled = false
				} else {
					if(seatPositionArray[6] == registeredNum) {
						self.seatBtnG.backgroundColor = UIColor.blue
					} else {
						self.seatBtnG.backgroundColor = UIColor.white
					}
				}
				self.seatBtnG.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnG.layer.borderWidth = 2.0
				self.seatBtnG.layer.cornerRadius = 25.0
				self.seatBtnG.tag = 6
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
				var prefixNumH = 2
				if(memberIndexH >= 0) {
					if(memberData[memberIndexH].nickname.isNotZenkaku) {
						prefixNumH = 5
					}
					self.seatBtnH.setTitle(String(memberData[memberIndexH].nickname.prefix(prefixNumH)),
										   for: .normal)
					self.seatBtnH.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnH.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnH.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnH.isEnabled = false
				} else {
					if(seatPositionArray[7] == registeredNum) {
						self.seatBtnH.backgroundColor = UIColor.blue
					} else {
						self.seatBtnH.backgroundColor = UIColor.white
					}
				}
				self.seatBtnH.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnH.layer.borderWidth = 2.0
				self.seatBtnH.layer.cornerRadius = 25.0
				self.seatBtnH.tag = 7
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
				var prefixNumI = 2
				if(memberIndexI >= 0) {
					if(memberData[memberIndexI].nickname.isNotZenkaku) {
						prefixNumI = 5
					}
					self.seatBtnI.setTitle(String(memberData[memberIndexI].nickname.prefix(prefixNumI)),
										   for: .normal)
					self.seatBtnI.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnI.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnI.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnI.isEnabled = false
				} else {
					if(seatPositionArray[8] == registeredNum) {
						self.seatBtnI.backgroundColor = UIColor.blue
					} else {
						self.seatBtnI.backgroundColor = UIColor.white
					}
				}
				self.seatBtnI.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnI.layer.borderWidth = 2.0
				self.seatBtnI.layer.cornerRadius = 25.0
				self.seatBtnI.tag = 8
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
				var prefixNumJ = 2
				if(memberIndexJ >= 0) {
					if(memberData[memberIndexJ].nickname.isNotZenkaku) {
						prefixNumJ = 5
					}
					self.seatBtnJ.setTitle(String(memberData[memberIndexJ].nickname.prefix(prefixNumJ)),
										   for: .normal)
					self.seatBtnJ.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnJ.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnJ.backgroundColor = UIColor.init(red: 84/255,
																 green: 255/255,
																 blue: 159/255,
																 alpha: 0.5)
					self.seatBtnJ.isEnabled = false
				} else {
					if(seatPositionArray[9] == registeredNum) {
						self.seatBtnJ.backgroundColor = UIColor.blue
					} else {
						self.seatBtnJ.backgroundColor = UIColor.white
					}
				}
				self.seatBtnJ.layer.borderColor = UIColor.gray.cgColor
				self.seatBtnJ.layer.borderWidth = 2.0
				self.seatBtnJ.layer.cornerRadius = 25.0
				self.seatBtnJ.tag = 9
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

	/// seatBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func seatBtnDidTap(_ sender: Any) {
		if let button = sender as? UIButton {
			if let tag = actionTag(rawValue: button.tag) {
				switch tag {
					case .actionA:
						self.seatBtnA.backgroundColor = UIColor.blue
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionB:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						self.seatBtnB.backgroundColor = UIColor.blue
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionC:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						self.seatBtnC.backgroundColor = UIColor.blue
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionD:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						self.seatBtnD.backgroundColor = UIColor.blue
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionE:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						self.seatBtnE.backgroundColor = UIColor.blue
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionF:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						self.seatBtnF.backgroundColor = UIColor.blue
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionG:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						self.seatBtnG.backgroundColor = UIColor.blue
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionH:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						self.seatBtnH.backgroundColor = UIColor.blue
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionI:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						self.seatBtnI.backgroundColor = UIColor.blue
						if(memberIndexJ < 0) {
							self.seatBtnJ.backgroundColor = UIColor.white
						}
					case .actionJ:
						if(memberIndexA < 0) {
							self.seatBtnA.backgroundColor = UIColor.white
						}
						if(memberIndexB < 0) {
							self.seatBtnB.backgroundColor = UIColor.white
						}
						if(memberIndexC < 0) {
							self.seatBtnC.backgroundColor = UIColor.white
						}
						if(memberIndexD < 0) {
							self.seatBtnD.backgroundColor = UIColor.white
						}
						if(memberIndexE < 0) {
							self.seatBtnE.backgroundColor = UIColor.white
						}
						if(memberIndexF < 0) {
							self.seatBtnF.backgroundColor = UIColor.white
						}
						if(memberIndexG < 0) {
							self.seatBtnG.backgroundColor = UIColor.white
						}
						if(memberIndexH < 0) {
							self.seatBtnH.backgroundColor = UIColor.white
						}
						if(memberIndexI < 0) {
							self.seatBtnI.backgroundColor = UIColor.white
						}
						self.seatBtnJ.backgroundColor = UIColor.blue
				}
			}
		}
	}
	enum actionTag: Int {
		case actionA = 0
		case actionB = 1
		case actionC = 2
		case actionD = 3
		case actionE = 4
		case actionF = 5
		case actionG = 6
		case actionH = 7
		case actionI = 8
		case actionJ = 9
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
		// 選択中の座席を設定
		if(self.seatBtnA.backgroundColor == UIColor.blue) {
			seatPositionArray[0] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnB.backgroundColor == UIColor.blue) {
			seatPositionArray[1] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnC.backgroundColor == UIColor.blue) {
			seatPositionArray[2] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnD.backgroundColor == UIColor.blue) {
			seatPositionArray[3] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnE.backgroundColor == UIColor.blue) {
			seatPositionArray[4] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnF.backgroundColor == UIColor.blue) {
			seatPositionArray[5] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnG.backgroundColor == UIColor.blue) {
			seatPositionArray[6] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnH.backgroundColor == UIColor.blue) {
			seatPositionArray[7] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnI.backgroundColor == UIColor.blue) {
			seatPositionArray[8] = registeredNum
			registeredNum += 1
		} else if(self.seatBtnJ.backgroundColor == UIColor.blue) {
			seatPositionArray[9] = registeredNum
			registeredNum += 1
		} else {
			let alert: UIAlertController = UIAlertController(title: "エラー",
												 message: "現在の位置を設定してください。",
												 preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}

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
