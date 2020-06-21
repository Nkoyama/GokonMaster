//
//  SeatChangeResultViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/06/13.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class SeatChangeResultViewController: UIViewController {

	// MARK: Views
	let smallTitle		= UILabel()		// title
	let seatLabelA		= UILabel()
	let seatLabelB		= UILabel()
	let seatLabelC		= UILabel()
	let seatLabelD		= UILabel()
	let seatLabelE		= UILabel()
	let seatLabelF		= UILabel()
	let seatLabelG		= UILabel()
	let seatLabelH		= UILabel()
	let seatLabelI		= UILabel()
	let seatLabelJ		= UILabel()
	let doorWay			= UILabel()
	let seatBtnA		= UIButton()
	let seatBtnB		= UIButton()
	let seatBtnC		= UIButton()
	let seatBtnD		= UIButton()
	let seatBtnE		= UIButton()
	let seatBtnF		= UIButton()
	let seatBtnG		= UIButton()
	let seatBtnH		= UIButton()
	let seatBtnI		= UIButton()
	let seatBtnJ		= UIButton()
	let message			= UILabel()		// message
	let menuBtn			= UIButton()	// menu button

	let SCREEN_SIZE		= UIScreen.main.bounds.size

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// title
		self.smallTitle.text = "席替え結果"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(self.smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// calc the best seat position
		let seatChangeResult = seatChangeMainLogic()
		print(seatPositionArray)

		if( seatChangeResult ) {
			// square table
			if( tableTypeIndex == 0 ) {
				//draw table
				var seatNum:Int = joinNumSum/2
				if(maleNum>seatNum)		{	seatNum = maleNum	}
				if(femaleNum>seatNum)	{	seatNum = femaleNum	}
				let screenWidth:Int = Int(self.view.bounds.width)
				let tableSquareDraw = TableSquareDrawView(frame: CGRect(x: screenWidth/2-80,
																		y: 235,
																		width: 160,
																		height: seatNum*60))
				self.view.addSubview(tableSquareDraw)

				//seat A
				if( seatPositionArray[0] >= 0 ) {
					self.seatLabelA.text = memberData[seatPositionArray[0]].nickname
					self.seatLabelA.textAlignment = NSTextAlignment.center
					self.seatLabelA.textColor = UIColor.black
					self.seatLabelA.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelA.adjustsFontSizeToFitWidth = true
					self.seatLabelA.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelA)
					self.seatLabelA.snp.makeConstraints{ (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(240)
					}
				}
				//seat B
				if( seatPositionArray[1] >= 0 ) {
					self.seatLabelB.text = memberData[seatPositionArray[1]].nickname
					self.seatLabelB.textAlignment = NSTextAlignment.center
					self.seatLabelB.textColor = UIColor.black
					self.seatLabelB.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelB.adjustsFontSizeToFitWidth = true
					self.seatLabelB.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelB)
					self.seatLabelB.snp.makeConstraints{ (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(260)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
					}
				}
				//seat C
				if( seatPositionArray[2] >= 0 ) {
					self.seatLabelC.text = memberData[seatPositionArray[2]].nickname
					self.seatLabelC.textAlignment = NSTextAlignment.center
					self.seatLabelC.textColor = UIColor.black
					self.seatLabelC.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelC.adjustsFontSizeToFitWidth = true
					self.seatLabelC.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelC)
					self.seatLabelC.snp.makeConstraints{ (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(360)
					}
				}
				//seat D
				if( seatPositionArray[3] >= 0 ) {
					self.seatLabelD.text = memberData[seatPositionArray[3]].nickname
					self.seatLabelD.textAlignment = NSTextAlignment.center
					self.seatLabelD.textColor = UIColor.black
					self.seatLabelD.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelD.adjustsFontSizeToFitWidth = true
					self.seatLabelD.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelD)
					self.seatLabelD.snp.makeConstraints{ (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(380)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(420)
					}
				}
				//seat E
				if( seatPositionArray[4] >= 0 ) {
					self.seatLabelE.text = memberData[seatPositionArray[4]].nickname
					self.seatLabelE.textAlignment = NSTextAlignment.center
					self.seatLabelE.textColor = UIColor.black
					self.seatLabelE.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelE.adjustsFontSizeToFitWidth = true
					self.seatLabelE.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelE)
					self.seatLabelE.snp.makeConstraints{ (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(440)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(480)
					}
				}
				//seat F
				if( seatPositionArray[5] >= 0 ) {
					self.seatLabelF.text = memberData[seatPositionArray[5]].nickname
					self.seatLabelF.textAlignment = NSTextAlignment.center
					self.seatLabelF.textColor = UIColor.black
					self.seatLabelF.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelF.adjustsFontSizeToFitWidth = true
					self.seatLabelF.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelF)
					self.seatLabelF.snp.makeConstraints{ (make) in
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(240)
					}
				}
				//seat G
				if( seatPositionArray[6] >= 0 ) {
					self.seatLabelG.text = memberData[seatPositionArray[6]].nickname
					self.seatLabelG.textAlignment = NSTextAlignment.center
					self.seatLabelG.textColor = UIColor.black
					self.seatLabelG.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelG.adjustsFontSizeToFitWidth = true
					self.seatLabelG.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelG)
					self.seatLabelG.snp.makeConstraints{ (make) in
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(260)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
					}
				}
				//seat H
				if( seatPositionArray[7] >= 0 ) {
					self.seatLabelH.text = memberData[seatPositionArray[7]].nickname
					self.seatLabelH.textAlignment = NSTextAlignment.center
					self.seatLabelH.textColor = UIColor.black
					self.seatLabelH.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelH.adjustsFontSizeToFitWidth = true
					self.seatLabelH.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelH)
					self.seatLabelH.snp.makeConstraints{ (make) in
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(360)
					}
				}
				//seat I
				if( seatPositionArray[8] >= 0 ) {
					self.seatLabelI.text = memberData[seatPositionArray[8]].nickname
					self.seatLabelI.textAlignment = NSTextAlignment.center
					self.seatLabelI.textColor = UIColor.black
					self.seatLabelI.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelI.adjustsFontSizeToFitWidth = true
					self.seatLabelI.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelI)
					self.seatLabelI.snp.makeConstraints{ (make) in
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(380)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(420)
					}
				}
				//seat J
				if( seatPositionArray[9] >= 0 ) {
					self.seatLabelJ.text = memberData[seatPositionArray[9]].nickname
					self.seatLabelJ.textAlignment = NSTextAlignment.center
					self.seatLabelJ.textColor = UIColor.black
					self.seatLabelJ.font = UIFont.systemFont(ofSize: 25.0)
					self.seatLabelJ.adjustsFontSizeToFitWidth = true
					self.seatLabelJ.backgroundColor = UIColor.init(red: 174/255,
																   green: 218/255,
																   blue: 204/255,
																   alpha: 0.7)
					self.view.addSubview(self.seatLabelJ)
					self.seatLabelJ.snp.makeConstraints{ (make) in
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(screenWidth/2-90)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(440)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(480)
					}
				}
			// circle table
			} else {
				//draw circle
				let screenWidth = SCREEN_SIZE.width
				let tableCircleDraw = TableCircleDrawView(frame: CGRect(x: Int(screenWidth)/2-90, y: 270, width: 180, height: 180))
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
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
				}

				// seat button A
				var prefixNumA = 2
				if( seatPositionArray[0] >= 0 ) {
					if(memberData[seatPositionArray[0]].nickname.isNotJapanese) {
						prefixNumA = 5
					}
					self.seatBtnA.setTitle(String(memberData[seatPositionArray[0]].nickname.prefix(prefixNumA)),
										   for: .normal)
					self.seatBtnA.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnA.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnA.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnA.isEnabled = false
					self.seatBtnA.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnA.layer.borderWidth = 2.0
					self.seatBtnA.layer.cornerRadius = 25.0
					self.seatBtnA.tag = 0
					self.view.addSubview(self.seatBtnA)
					self.seatBtnA.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_a = screenWidth/2 + 120*cos(CGFloat.pi*(eachAngle-90)/180)
					let centerY_a = 320 + 120*sin(CGFloat.pi*(eachAngle-90)/180)
					self.seatBtnA.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_a-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_a+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_a-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_a+25)
					}
				}
				// seat button B
				var prefixNumB = 2
				if( seatPositionArray[1] >= 0 ) {
					if(memberData[seatPositionArray[1]].nickname.isNotJapanese) {
						prefixNumB = 5
					}
					self.seatBtnB.setTitle(String(memberData[seatPositionArray[1]].nickname.prefix(prefixNumB)),
										   for: .normal)
					self.seatBtnB.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnB.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnB.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnB.isEnabled = false
					self.seatBtnB.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnB.layer.borderWidth = 2.0
					self.seatBtnB.layer.cornerRadius = 25.0
					self.seatBtnB.tag = 0
					self.view.addSubview(self.seatBtnB)
					self.seatBtnB.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_b = screenWidth/2 + 120*cos(CGFloat.pi*(2*eachAngle-90)/180)
					let centerY_b = 320 + 120*sin(CGFloat.pi*(2*eachAngle-90)/180)
					self.seatBtnB.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_b-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_b+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_b-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_b+25)
					}
				}

				// seat button C
				var prefixNumC = 2
				if( seatPositionArray[2] >= 0 ) {
					if(memberData[seatPositionArray[2]].nickname.isNotJapanese) {
						prefixNumC = 5
					}
					self.seatBtnC.setTitle(String(memberData[seatPositionArray[2]].nickname.prefix(prefixNumC)),
										   for: .normal)
					self.seatBtnC.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnC.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnC.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnC.isEnabled = false
					self.seatBtnC.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnC.layer.borderWidth = 2.0
					self.seatBtnC.layer.cornerRadius = 25.0
					self.seatBtnC.tag = 0
					self.view.addSubview(self.seatBtnC)
					self.seatBtnC.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_c = screenWidth/2 + 120*cos(CGFloat.pi*(3*eachAngle-90)/180)
					let centerY_c = 320 + 120*sin(CGFloat.pi*(3*eachAngle-90)/180)
					self.seatBtnC.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_c-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_c+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_c-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_c+25)
					}
				}

				// seat button D
				var prefixNumD = 2
				if( seatPositionArray[3] >= 0 ) {
					if(memberData[seatPositionArray[3]].nickname.isNotJapanese) {
						prefixNumD = 5
					}
					self.seatBtnD.setTitle(String(memberData[seatPositionArray[3]].nickname.prefix(prefixNumD)),
										   for: .normal)
					self.seatBtnD.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnD.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnD.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnD.isEnabled = false
					self.seatBtnD.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnD.layer.borderWidth = 2.0
					self.seatBtnD.layer.cornerRadius = 25.0
					self.seatBtnD.tag = 0
					self.view.addSubview(self.seatBtnD)
					self.seatBtnD.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_d = screenWidth/2 + 120*cos(CGFloat.pi*(4*eachAngle-90)/180)
					let centerY_d = 320 + 120*sin(CGFloat.pi*(4*eachAngle-90)/180)
					self.seatBtnD.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_d-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_d+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_d-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_d+25)
					}
				}

				// seat button E
				var prefixNumE = 2
				if( seatPositionArray[4] >= 0 ) {
					if(memberData[seatPositionArray[4]].nickname.isNotJapanese) {
						prefixNumE = 5
					}
					self.seatBtnE.setTitle(String(memberData[seatPositionArray[4]].nickname.prefix(prefixNumE)),
										   for: .normal)
					self.seatBtnE.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnE.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnE.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnE.isEnabled = false
					self.seatBtnE.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnE.layer.borderWidth = 2.0
					self.seatBtnE.layer.cornerRadius = 25.0
					self.seatBtnE.tag = 0
					self.view.addSubview(self.seatBtnE)
					self.seatBtnE.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_e = screenWidth/2 + 120*cos(CGFloat.pi*(5*eachAngle-90)/180)
					let centerY_e = 320 + 120*sin(CGFloat.pi*(5*eachAngle-90)/180)
					self.seatBtnE.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_e-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_e+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_e-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_e+25)
					}
				}

				// seat button F
				var prefixNumF = 2
				if( seatPositionArray[5] >= 0 ) {
					if(memberData[seatPositionArray[5]].nickname.isNotJapanese) {
						prefixNumF = 5
					}
					self.seatBtnF.setTitle(String(memberData[seatPositionArray[5]].nickname.prefix(prefixNumF)),
										   for: .normal)
					self.seatBtnF.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnF.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnF.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnF.isEnabled = false
					self.seatBtnF.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnF.layer.borderWidth = 2.0
					self.seatBtnF.layer.cornerRadius = 25.0
					self.seatBtnF.tag = 0
					self.view.addSubview(self.seatBtnF)
					self.seatBtnF.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_f = screenWidth/2 + 120*cos(CGFloat.pi*(6*eachAngle-90)/180)
					let centerY_f = 320 + 120*sin(CGFloat.pi*(6*eachAngle-90)/180)
					self.seatBtnF.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_f-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_f+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_f-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_f+25)
					}
				}

				// seat button G
				var prefixNumG = 2
				if( seatPositionArray[6] >= 0 ) {
					if(memberData[seatPositionArray[6]].nickname.isNotJapanese) {
						prefixNumG = 5
					}
					self.seatBtnG.setTitle(String(memberData[seatPositionArray[6]].nickname.prefix(prefixNumG)),
										   for: .normal)
					self.seatBtnG.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnG.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnG.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnG.isEnabled = false
					self.seatBtnG.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnG.layer.borderWidth = 2.0
					self.seatBtnG.layer.cornerRadius = 25.0
					self.seatBtnG.tag = 0
					self.view.addSubview(self.seatBtnG)
					self.seatBtnG.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_g = screenWidth/2 + 120*cos(CGFloat.pi*(7*eachAngle-90)/180)
					let centerY_g = 320 + 120*sin(CGFloat.pi*(7*eachAngle-90)/180)
					self.seatBtnG.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_g-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_g+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_g-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_g+25)
					}
				}

				// seat button H
				var prefixNumH = 2
				if( seatPositionArray[7] >= 0 ) {
					if(memberData[seatPositionArray[7]].nickname.isNotJapanese) {
						prefixNumH = 5
					}
					self.seatBtnH.setTitle(String(memberData[seatPositionArray[7]].nickname.prefix(prefixNumH)),
										   for: .normal)
					self.seatBtnH.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnH.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnH.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnH.isEnabled = false
					self.seatBtnH.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnH.layer.borderWidth = 2.0
					self.seatBtnH.layer.cornerRadius = 25.0
					self.seatBtnH.tag = 0
					self.view.addSubview(self.seatBtnH)
					self.seatBtnH.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_h = screenWidth/2 + 120*cos(CGFloat.pi*(8*eachAngle-90)/180)
					let centerY_h = 320 + 120*sin(CGFloat.pi*(8*eachAngle-90)/180)
					self.seatBtnH.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_h-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_h+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_h-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_h+25)
					}
				}

				// seat button I
				var prefixNumI = 2
				if( seatPositionArray[8] >= 0 ) {
					if(memberData[seatPositionArray[8]].nickname.isNotJapanese) {
						prefixNumI = 5
					}
					self.seatBtnI.setTitle(String(memberData[seatPositionArray[8]].nickname.prefix(prefixNumI)),
										   for: .normal)
					self.seatBtnI.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnI.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnI.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnI.isEnabled = false
					self.seatBtnI.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnI.layer.borderWidth = 2.0
					self.seatBtnI.layer.cornerRadius = 25.0
					self.seatBtnI.tag = 0
					self.view.addSubview(self.seatBtnI)
					self.seatBtnI.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_i = screenWidth/2 + 120*cos(CGFloat.pi*(9*eachAngle-90)/180)
					let centerY_i = 320 + 120*sin(CGFloat.pi*(9*eachAngle-90)/180)
					self.seatBtnI.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_i-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_i+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_i-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_i+25)
					}
				}

				// seat button J
				var prefixNumJ = 2
				if( seatPositionArray[9] >= 0 ) {
					if(memberData[seatPositionArray[9]].nickname.isNotJapanese) {
						prefixNumJ = 5
					}
					self.seatBtnJ.setTitle(String(memberData[seatPositionArray[9]].nickname.prefix(prefixNumJ)),
										   for: .normal)
					self.seatBtnJ.titleLabel?.adjustsFontSizeToFitWidth = true
					self.seatBtnJ.setTitleColor(UIColor.black, for: .normal)
					self.seatBtnJ.backgroundColor = UIColor.init(red: 174/255,
																 green: 218/255,
																 blue: 204/255,
																 alpha: 0.7)
					self.seatBtnJ.isEnabled = false
					self.seatBtnJ.layer.borderColor = UIColor.gray.cgColor
					self.seatBtnJ.layer.borderWidth = 2.0
					self.seatBtnJ.layer.cornerRadius = 25.0
					self.seatBtnJ.tag = 0
					self.view.addSubview(self.seatBtnJ)
					self.seatBtnJ.addTarget(self,
											action: #selector(self.seatBtnDidTap(_:)),
											for: .touchUpInside)
					let centerX_j = screenWidth/2 + 120*cos(CGFloat.pi*(10*eachAngle-90)/180)
					let centerY_j = 320 + 120*sin(CGFloat.pi*(10*eachAngle-90)/180)
					self.seatBtnJ.snp.makeConstraints { (make) in
						make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_j-25)
						make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(centerX_j+25)
						make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_j-25)
						make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(centerY_j+25)
					}
				}
			}
		}

		// message
		self.message.text = "席を移動しましょう！"
		self.message.textColor = UIColor.black
		self.message.font = UIFont.systemFont(ofSize: 20.0)
		self.view.addSubview(self.message)
		self.message.snp.makeConstraints{ (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(150)
		}

		// menu button
		self.menuBtn.setTitle(" メニューへ ", for: .normal)
		self.menuBtn.setTitleColor(UIColor.black, for: .normal)
		self.menuBtn.backgroundColor = UIColor.green
		self.menuBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.menuBtn.layer.borderColor = UIColor.clear.cgColor
		self.menuBtn.layer.borderWidth = 2.0
		self.menuBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.menuBtn)
		self.menuBtn.addTarget(self,
							   action: #selector(self.menuBtnDidTap(_:)),
							   for: .touchUpInside)
		self.menuBtn.snp.makeConstraints{ (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
		}
	}

	/// seatBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func seatBtnDidTap(_ sender: Any) {
		
	}

	/// menuBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func menuBtnDidTap(_ sender: UIButton) {
		let menuViewController = MenuViewController()
		menuViewController.modalPresentationStyle = .fullScreen
		self.present(menuViewController, animated: true)
	}
}
