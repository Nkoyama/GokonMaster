//
//  RegisterFavoriteViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/17.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class RegisterFavoriteViewController: UIViewController {
	// MARK: Views
	let backBtn				= UIButton()	// back button
	let smallTitle			= UILabel()		// title
	let secondTitle			= UILabel()		// secondary title
	let dearName			= UILabel()
	let message				= UILabel()
	let rankLabel_1			= UILabel()		// 1位 label
	let rankLabel_2			= UILabel()		// 2位 label
	let rankLabel_3			= UILabel()		// 3位 label
	let rankLabel_4			= UILabel()		// 4位 label
	let nameBtn_1			= UIButton()	// 1位 ボタン
	let nameBtn_2			= UIButton()	// 2位 ボタン
	let nameBtn_3			= UIButton()	// 3位 ボタン
	let nameBtn_4			= UIButton()	// 4位 ボタン
	let decideBtn			= UIButton()	// 決定 ボタン

	let SCREEN_SIZE			= UIScreen.main.bounds.size

	var nameArray	= [[String]]()
	var rankArray	= [String]()


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// return button
		if(registeredNum <= 0) {
			self.backBtn.setTitle(" メニュー ", for: .normal)
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

		// secondary title
		self.secondTitle.text = "お気に入り登録"
		self.secondTitle.textColor = UIColor.init(red: 0/255, green: 167/255, blue: 113/255, alpha: 1)
		self.secondTitle.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.view.addSubview(secondTitle)
		self.secondTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
		}

		// dear name
		self.dearName.text = memberData[registeredNum].nickname + " さん"
		self.dearName.textColor = UIColor.red
		self.dearName.font = self.dearName.font.withSize(20)
		self.view.addSubview(dearName)
		self.dearName.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(240)
		}
		// message
		self.message.text = "気に入っている方を登録してください。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(270)
		}

		/* select favorite */
		// 行の間隔を計算
		let lineWidth = (SCREEN_SIZE.height - 500) / 5

		// 女の場合
		if(memberData[registeredNum].sexIndex == 1) {
			// 1位
			self.rankLabel_1.text = "1位"
			self.rankLabel_1.textColor = UIColor.black
			self.rankLabel_1.textAlignment = NSTextAlignment.center
			self.rankLabel_1.font = self.rankLabel_1.font.withSize(35.0)
			self.rankLabel_1.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_1)
			self.rankLabel_1.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
			}

			if(favoriteArray[registeredNum].first != -1) {
				self.nameBtn_1.setTitle(maleNameArray[favoriteArray[registeredNum].first],
										for: .normal)
			} else {
				self.nameBtn_1.setTitle("未選択", for: .normal)
			}
			self.nameBtn_1.titleLabel?.adjustsFontSizeToFitWidth = true
			self.nameBtn_1.setTitleColor(UIColor.white, for: .normal)
			self.nameBtn_1.backgroundColor = UIColor.init(red: 99/255,
														  green: 78/255,
														  blue: 134/255,
														  alpha: 1)
			self.nameBtn_1.layer.borderColor = UIColor.gray.cgColor
			self.nameBtn_1.layer.borderWidth = 1.0
			self.nameBtn_1.layer.cornerRadius = 1.0
			self.nameBtn_1.addTarget(self,
									 action: #selector(self.chooseFavorite(_:)),
									 for: .touchUpInside)
			self.nameBtn_1.tag = 1
			self.view.addSubview(self.nameBtn_1)
			self.nameBtn_1.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
			}

			// 2位
			if(maleNum>=3) {
				self.rankLabel_2.text = "2位"
				self.rankLabel_2.textColor = UIColor.black
				self.rankLabel_2.textAlignment = NSTextAlignment.center
				self.rankLabel_2.font = self.rankLabel_2.font.withSize(32.0)
				self.rankLabel_2.adjustsFontSizeToFitWidth = true
				self.view.addSubview(self.rankLabel_2)
				self.rankLabel_2.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth))
				}

				if(favoriteArray[registeredNum].second != -1) {
					self.nameBtn_2.setTitle(maleNameArray[favoriteArray[registeredNum].second],
											for: .normal)
				} else {
					self.nameBtn_2.setTitle("未選択", for: .normal)
				}
				self.nameBtn_2.titleLabel?.adjustsFontSizeToFitWidth = true
				self.nameBtn_2.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_2.backgroundColor = UIColor.init(red: 99/255,
															  green: 78/255,
															  blue: 134/255,
															  alpha: 1)
				self.nameBtn_2.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_2.layer.borderWidth = 1.0
				self.nameBtn_2.layer.cornerRadius = 1.0
				self.nameBtn_2.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.nameBtn_2.tag = 2
				self.view.addSubview(self.nameBtn_2)
				self.nameBtn_2.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth))
				}
			}

			// 3位
			if(maleNum>=4) {
				self.rankLabel_3.text = "3位"
				self.rankLabel_3.textColor = UIColor.black
				self.rankLabel_3.textAlignment = NSTextAlignment.center
				self.rankLabel_3.font = self.rankLabel_3.font.withSize(30.0)
				self.rankLabel_3.adjustsFontSizeToFitWidth = true
				self.view.addSubview(self.rankLabel_3)
				self.rankLabel_3.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*2)
				}

				if(favoriteArray[registeredNum].third != -1) {
					self.nameBtn_3.setTitle(maleNameArray[favoriteArray[registeredNum].third],
											for: .normal)
				} else {
					self.nameBtn_3.setTitle("未選択", for: .normal)
				}
				self.nameBtn_3.titleLabel?.adjustsFontSizeToFitWidth = true
				self.nameBtn_3.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_3.backgroundColor = UIColor.init(red: 99/255,
															  green: 78/255,
															  blue: 134/255,
															  alpha: 1)
				self.nameBtn_3.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_3.layer.borderWidth = 1.0
				self.nameBtn_3.layer.cornerRadius = 1.0
				self.nameBtn_3.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.nameBtn_3.tag = 3
				self.view.addSubview(self.nameBtn_3)
				self.nameBtn_3.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth*2))
				}
			}

			// 4位
			if(maleNum>=5) {
				self.rankLabel_4.text = "4位"
				self.rankLabel_4.textColor = UIColor.black
				self.rankLabel_4.textAlignment = NSTextAlignment.center
				self.rankLabel_4.font = self.rankLabel_4.font.withSize(25.0)
				self.rankLabel_4.adjustsFontSizeToFitWidth = true
				self.view.addSubview(self.rankLabel_4)
				self.rankLabel_4.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*3)
				}

				if(favoriteArray[registeredNum].fourth != -1) {
					self.nameBtn_4.setTitle(maleNameArray[favoriteArray[registeredNum].fourth],
											for: .normal)
				} else {
					self.nameBtn_4.setTitle("未選択", for: .normal)
				}
				self.nameBtn_4.titleLabel?.adjustsFontSizeToFitWidth = true
				self.nameBtn_4.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_4.backgroundColor = UIColor.init(red: 99/255,
															  green: 78/255,
															  blue: 134/255,
															  alpha: 1)
				self.nameBtn_4.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_4.layer.borderWidth = 1.0
				self.nameBtn_4.layer.cornerRadius = 1.0
				self.nameBtn_4.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.nameBtn_4.tag = 4
				self.view.addSubview(self.nameBtn_4)
				self.nameBtn_4.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*3)
				}
			}

		// 男の場合
		} else {
			// 1位
			self.rankLabel_1.text = "1位"
			self.rankLabel_1.textColor = UIColor.black
			self.rankLabel_1.textAlignment = NSTextAlignment.center
			self.rankLabel_1.font = self.rankLabel_1.font.withSize(35.0)
			self.rankLabel_1.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_1)
			self.rankLabel_1.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
			}
			
			if(favoriteArray[registeredNum].first != -1) {
				self.nameBtn_1.setTitle(femaleNameArray[favoriteArray[registeredNum].first],
										for: .normal)
			} else {
				self.nameBtn_1.setTitle("未選択", for: .normal)
			}
			self.nameBtn_1.titleLabel?.adjustsFontSizeToFitWidth = true
			self.nameBtn_1.setTitleColor(UIColor.white, for: .normal)
			self.nameBtn_1.backgroundColor = UIColor.init(red: 99/255,
														  green: 78/255,
														  blue: 134/255,
														  alpha: 1)
			self.nameBtn_1.layer.borderColor = UIColor.gray.cgColor
			self.nameBtn_1.layer.borderWidth = 1.0
			self.nameBtn_1.layer.cornerRadius = 1.0
			self.nameBtn_1.addTarget(self,
									 action: #selector(self.chooseFavorite(_:)),
									 for: .touchUpInside)
			self.nameBtn_1.tag = 1
			self.view.addSubview(self.nameBtn_1)
			self.nameBtn_1.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
			}
			
			// 2位
			if(femaleNum>=3) {
				self.rankLabel_2.text = "2位"
				self.rankLabel_2.textColor = UIColor.black
				self.rankLabel_2.textAlignment = NSTextAlignment.center
				self.rankLabel_2.font = self.rankLabel_2.font.withSize(32.0)
				self.rankLabel_2.adjustsFontSizeToFitWidth = true
				self.view.addSubview(self.rankLabel_2)
				self.rankLabel_2.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth))
				}
				
				if(favoriteArray[registeredNum].second != -1) {
					self.nameBtn_2.setTitle(femaleNameArray[favoriteArray[registeredNum].second],
											for: .normal)
				} else {
					self.nameBtn_2.setTitle("未選択", for: .normal)
				}
				self.nameBtn_2.titleLabel?.adjustsFontSizeToFitWidth = true
				self.nameBtn_2.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_2.backgroundColor = UIColor.init(red: 99/255,
															  green: 78/255,
															  blue: 134/255,
															  alpha: 1)
				self.nameBtn_2.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_2.layer.borderWidth = 1.0
				self.nameBtn_2.layer.cornerRadius = 1.0
				self.nameBtn_2.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.nameBtn_2.tag = 2
				self.view.addSubview(self.nameBtn_2)
				self.nameBtn_2.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth))
				}
			}
			
			// 3位
			if(femaleNum>=4) {
				self.rankLabel_3.text = "3位"
				self.rankLabel_3.textColor = UIColor.black
				self.rankLabel_3.textAlignment = NSTextAlignment.center
				self.rankLabel_3.font = self.rankLabel_3.font.withSize(30.0)
				self.rankLabel_3.adjustsFontSizeToFitWidth = true
				self.view.addSubview(self.rankLabel_3)
				self.rankLabel_3.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*2)
				}
				
				if(favoriteArray[registeredNum].third != -1) {
					self.nameBtn_3.setTitle(femaleNameArray[favoriteArray[registeredNum].third],
											for: .normal)
				} else {
					self.nameBtn_3.setTitle("未選択", for: .normal)
				}
				self.nameBtn_3.titleLabel?.adjustsFontSizeToFitWidth = true
				self.nameBtn_3.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_3.backgroundColor = UIColor.init(red: 99/255,
															  green: 78/255,
															  blue: 134/255,
															  alpha: 1)
				self.nameBtn_3.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_3.layer.borderWidth = 1.0
				self.nameBtn_3.layer.cornerRadius = 1.0
				self.nameBtn_3.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.nameBtn_3.tag = 3
				self.view.addSubview(self.nameBtn_3)
				self.nameBtn_3.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth*2))
				}
			}
			
			// 4位
			if(femaleNum>=5) {
				self.rankLabel_4.text = "4位"
				self.rankLabel_4.textColor = UIColor.black
				self.rankLabel_4.textAlignment = NSTextAlignment.center
				self.rankLabel_4.font = self.rankLabel_4.font.withSize(25.0)
				self.rankLabel_4.adjustsFontSizeToFitWidth = true
				self.view.addSubview(self.rankLabel_4)
				self.rankLabel_4.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*3)
				}
				
				if(favoriteArray[registeredNum].fourth != -1) {
					self.nameBtn_4.setTitle(femaleNameArray[favoriteArray[registeredNum].fourth],
											for: .normal)
				} else {
					self.nameBtn_4.setTitle("未選択", for: .normal)
				}
				self.nameBtn_4.titleLabel?.adjustsFontSizeToFitWidth = true
				self.nameBtn_4.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_4.backgroundColor = UIColor.init(red: 99/255,
															  green: 78/255,
															  blue: 134/255,
															  alpha: 1)
				self.nameBtn_4.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_4.layer.borderWidth = 1.0
				self.nameBtn_4.layer.cornerRadius = 1.0
				self.nameBtn_4.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.nameBtn_4.tag = 4
				self.view.addSubview(self.nameBtn_4)
				self.nameBtn_4.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*3)
				}
			}
		}

		// decide button
		self.decideBtn.setTitle(" 決定 ", for: .normal)
		self.decideBtn.setTitleColor(UIColor.black, for: .normal)
		self.decideBtn.backgroundColor = UIColor.green
		self.decideBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.decideBtn.layer.borderColor = UIColor.clear.cgColor
		self.decideBtn.layer.borderWidth = 2.0
		self.decideBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.decideBtn)
		self.decideBtn.addTarget(self,
								 action: #selector(self.decideBtnDidTap(_:)),
								 for: .touchUpInside)
		self.decideBtn.snp.makeConstraints { (make) in
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

	/// chooseFavoriteBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func chooseFavorite(_ sender: Any) {
		let chooseFavoritePopup = ChooseFavoritePopup()

		if let button = sender as? UIButton {
			switch button.tag {
				case 1:
					chooseFavoritePopup.rank = 1
				case 2:
					chooseFavoritePopup.rank = 2
				case 3:
					chooseFavoritePopup.rank = 3
				case 4:
					chooseFavoritePopup.rank = 4
				default:
					chooseFavoritePopup.rank = 0
			}
		}
		chooseFavoritePopup.sexIndex = memberData[registeredNum].sexIndex

		chooseFavoritePopup.modalPresentationStyle = .overCurrentContext
		self.present(chooseFavoritePopup, animated: false)
	}

	/// decideBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func decideBtnDidTap(_ sender: UIButton) {
		var choiceComplete	= false
		if(memberData[registeredNum].sexIndex == 0) {
			if(favoriteArray[registeredNum].first < 0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "1位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else if(femaleNum>=3 && favoriteArray[registeredNum].second<0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "2位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else if(femaleNum>=4 && favoriteArray[registeredNum].third<0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "3位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else if(femaleNum>=5 && favoriteArray[registeredNum].fourth<0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "4位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else {
				choiceComplete = true
			}
		} else if(memberData[registeredNum].sexIndex == 1) {
			if(favoriteArray[registeredNum].first < 0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "1位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else if(maleNum>=3 && favoriteArray[registeredNum].second<0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "2位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else if(maleNum>=4 && favoriteArray[registeredNum].third<0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "3位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else if(maleNum>=5 && favoriteArray[registeredNum].fourth<0) {
				let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "4位が設定されていません。",
													preferredStyle: UIAlertController.Style.alert)
				alert.addAction(defaultAction)
				present(alert, animated: true, completion: nil)
			} else {
				choiceComplete = true
			}
		} else {
			let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "予期せぬエラーが発生しました。",
													preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}
		
		// registered number count up
		if(choiceComplete) {
			registeredNum += 1
			if(registeredNum == joinNumSum) {
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
}
