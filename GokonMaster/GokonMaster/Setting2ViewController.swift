//
//  Setting2ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/07.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class Setting2ViewController: UIViewController, UITextFieldDelegate{

	// MARK: Views
	let backBtn		= UIButton()	// back button
	let smallTitle	= UILabel()		// title
	let settingMsg	= UILabel()		// setting message
	let seatBtnA	= UIButton()	// seat button A
	let seatBtnB	= UIButton()	// seat button B
	let seatBtnC	= UIButton()	// seat button C
	let seatBtnD	= UIButton()	// seat button D
	let seatBtnE	= UIButton()	// seat button E
	let seatBtnF	= UIButton()	// seat button F
	let seatBtnG	= UIButton()	// seat button G
	let seatBtnH	= UIButton()	// seat button H
	let seatBtnI	= UIButton()	// seat button I
	let seatBtnJ	= UIButton()	// seat button J
	let finishBtn	= UIButton()	// 完了ボタン

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// back button
		self.backBtn.setTitle(" 戻る ", for: .normal)
		self.backBtn.setTitleColor(UIColor.green, for: .normal)
		self.backBtn.backgroundColor = UIColor.clear
		self.backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
		self.backBtn.layer.borderColor = UIColor.clear.cgColor
		self.backBtn.layer.borderWidth = 2.0
		self.backBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.backBtn)
		self.backBtn.addTarget(self, action:#selector(self.backBtnDidTap(_:)), for: .touchUpInside)
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

		// setting message
		self.settingMsg.text = "席の配置を設定をして下さい。"
		self.settingMsg.textColor = UIColor.black
		self.view.addSubview(settingMsg)
		self.settingMsg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(250)
		}

		// テーブル分岐
		if(tableTypeIndex == 0) {
			// square
			var seatNum:Int = joinNumSum/2
			if(maleNum>seatNum) {seatNum = maleNum}
			if(femaleNum>seatNum) {seatNum = femaleNum}

			// テーブル描写
			let screenWidth:Int = Int(self.view.bounds.width)
			let tableSquareDraw = TableSquareDrawView(frame: CGRect(x: screenWidth/2-80, y: 350, width: 160, height: seatNum*70))
			self.view.addSubview(tableSquareDraw)
			
			/* いい感じにseat buttonを配置 */
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
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(370)
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
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(370)
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
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(390)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(440)
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
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(390)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(440)
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
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(460)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(510)
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
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(460)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(510)
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
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(530)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(580)
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
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(530)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(580)
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
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(600)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(650)
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
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(600)
					make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(650)
				}
			}
		} else if(tableTypeIndex == 1) {
			// 丸テーブル
			let screenWidth = self.view.bounds.width
			let tableCircleDraw = TableCircleDrawView(frame: CGRect(x: screenWidth/2-80, y: 450, width: 160, height: 160))
			self.view.addSubview(tableCircleDraw)
		}
		
		// finish button
		self.finishBtn.setTitle(" 完了 ", for: .normal)
		self.finishBtn.setTitleColor(UIColor.black, for: .normal)
		self.finishBtn.backgroundColor = UIColor.green
		self.finishBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.finishBtn.layer.borderColor = UIColor.clear.cgColor
		self.finishBtn.layer.borderWidth = 2.0
		self.finishBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.finishBtn)
		self.finishBtn.addTarget(self, action: #selector(self.finishBtnDidTap(_:)), for: .touchUpInside)
		self.finishBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(70)
		}
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
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

	/// finishBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func finishBtnDidTap(_ sender: UIButton) {
		// 座席選択数カウント
		var choiceSeatNum = 0
		if(seatAFlg) {choiceSeatNum += 1}
		if(seatBFlg) {choiceSeatNum += 1}
		if(seatCFlg) {choiceSeatNum += 1}
		if(seatDFlg) {choiceSeatNum += 1}
		if(seatEFlg) {choiceSeatNum += 1}
		if(seatFFlg) {choiceSeatNum += 1}
		if(seatGFlg) {choiceSeatNum += 1}
		if(seatHFlg) {choiceSeatNum += 1}
		if(seatIFlg) {choiceSeatNum += 1}
		if(seatJFlg) {choiceSeatNum += 1}
		if(choiceSeatNum != joinNumSum) {
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "参加者数と選択された座席数が一致しません。\n登録された参加者数は"+String(joinNumSum)+"人です。", preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}
	}
	// エラーメッセージ：OKボタン押下
	let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
		(action: UIAlertAction!) -> Void in
	})

}
