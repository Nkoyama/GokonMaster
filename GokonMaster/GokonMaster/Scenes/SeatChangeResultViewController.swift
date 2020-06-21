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
	let message			= UILabel()		// message
	let menuBtn			= UIButton()	// menu button

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

	/// menuBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func menuBtnDidTap(_ sender: UIButton) {
		let menuViewController = MenuViewController()
		menuViewController.modalPresentationStyle = .fullScreen
		self.present(menuViewController, animated: true)
	}
}
