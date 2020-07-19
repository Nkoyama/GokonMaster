//
//  RegisterFavoriteViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/17.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class RegisterFavoriteViewController: UIViewController, UINavigationControllerDelegate, GADBannerViewDelegate {
	// MARK: Views
	let dearName			= UILabel()
	let message				= UILabel()
	let rankLabel_1			= UILabel()		// 1位 label
	let rankLabel_2			= UILabel()		// 2位 label
	let rankLabel_3			= UILabel()		// 3位 label
	let rankLabel_4			= UILabel()		// 4位 label
	let nameBtn_1			= UIButton()	// 1位 button
	let nameBtn_2			= UIButton()	// 2位 button
	let nameBtn_3			= UIButton()	// 3位 button
	let nameBtn_4			= UIButton()	// 4位 button
	let decideBtn			= UIButton()	// decide button

	let SCREEN_SIZE			= UIScreen.main.bounds.size

	var nameArray			= [[String]]()
	var rankArray			= [String]()
	var favoriteType: Int	= Int()		// 0:seat change, 1:matching

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation bar */
		title = "お気に入り登録"
		if( registeredNum >= 1 ) {
			self.navigationItem.hidesBackButton = true	//hide back button
			self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		}
		navigationController?.delegate = self

		// dear name
		self.dearName.text = memberData[registeredNum].nickname + " さん"
		self.dearName.textColor = UIColor.red
		self.dearName.font = self.dearName.font.withSize(20)
		self.view.addSubview(dearName)
		self.dearName.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight)
		}
		// message
		self.message.text = "気に入っている方を登録してください。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+30)
		}

		/* select favorite */
		// 行の間隔を計算
		let lineWidth = (SCREEN_SIZE.height - 300) / 5

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
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100)
			}

			if(favoriteArray[registeredNum].first >= 0) {
				self.nameBtn_1.setTitle(maleArray[favoriteArray[registeredNum].first].nickname,
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
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100)
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth))
				}

				if(favoriteArray[registeredNum].second >= 0) {
					self.nameBtn_2.setTitle(maleArray[favoriteArray[registeredNum].second].nickname,
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth))
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth)*2)
				}

				if(favoriteArray[registeredNum].third >= 0) {
					self.nameBtn_3.setTitle(maleArray[favoriteArray[registeredNum].third].nickname,
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth*2))
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth)*3)
				}

				if(favoriteArray[registeredNum].fourth >= 0) {
					self.nameBtn_4.setTitle(maleArray[favoriteArray[registeredNum].fourth].nickname,
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth)*3)
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
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100)
			}
			
			if(favoriteArray[registeredNum].first >= 0) {
				self.nameBtn_1.setTitle(femaleArray[favoriteArray[registeredNum].first].nickname,
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
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100)
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth))
				}
				
				if(favoriteArray[registeredNum].second >= 0) {
					self.nameBtn_2.setTitle(femaleArray[favoriteArray[registeredNum].second].nickname,
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth))
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth)*2)
				}
				
				if(favoriteArray[registeredNum].third >= 0) {
					self.nameBtn_3.setTitle(femaleArray[favoriteArray[registeredNum].third].nickname,
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth*2))
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth)*3)
				}
				
				if(favoriteArray[registeredNum].fourth >= 0) {
					self.nameBtn_4.setTitle(femaleArray[favoriteArray[registeredNum].fourth].nickname,
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
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+100+Int(lineWidth)*3)
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
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomHeight)
		}

		// banner ad
		bannerView = GADBannerView(adSize: kGADAdSizeBanner)
		addBannerViewToView(bannerView)
		bannerView.adUnitID = adUnitID
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
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
		chooseFavoritePopup.callBack = { () in
			self.callBack()
		}
		chooseFavoritePopup.modalPresentationStyle = .overCurrentContext
		self.present(chooseFavoritePopup, animated: false)
	}

	/// 画面遷移から戻ってきたときに実行する関数
	func callBack() {
		// 画面再読み込み
		self.viewDidLoad()
	}

	/// decideBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func decideBtnDidTap(_ sender: UIButton) {
		var choiceComplete	= false

		/* define actions */
		// no favorite alert message：Yesボタン押下
		let noFavoriteAction = UIAlertAction(title: "Yes",
											 style: .default,
											 handler:{
				(action: UIAlertAction!) -> Void in
				let registerFavoriteFinishViewController = RegisterFavoriteFinishViewController()
				registerFavoriteFinishViewController.favoriteType = self.favoriteType
				let backBarButtonItem = UIBarButtonItem()
				backBarButtonItem.title = "お気に入り修正"
				self.navigationItem.backBarButtonItem = backBarButtonItem
				self.navigationController?.pushViewController(registerFavoriteFinishViewController,
															  animated: true)
		})
		// no favorite alert message：Noボタン押下
		let existFavoriteAction = UIAlertAction(title: "No",
												style: .default,
												handler: {
				(action: UIAlertAction!) -> Void in
		})

		// 誰も選択なし
		if(favoriteArray[registeredNum].first < 0 &&
			favoriteArray[registeredNum].second < 0 &&
			favoriteArray[registeredNum].third < 0 &&
			favoriteArray[registeredNum].fourth < 0) {
			let alert = UIAlertController(title: "!!!",
										  message: "気に入った方がいませんでしたか？",
										  preferredStyle: .alert)
			alert.addAction(noFavoriteAction)
			alert.addAction(existFavoriteAction)
			present(alert, animated: true, completion: nil)
		}

		// 1位が未選択
		if(favoriteArray[registeredNum].first < 0) {
			let alert: UIAlertController = UIAlertController(title: "Error",
															 message: "1位が設定されていません。",
															 preferredStyle: .alert)
			alert.addAction(defaultAction)
			self.present(alert, animated: true, completion: nil)
		} else {
			// 下位が登録されているのに上位に未登録がないかチェック
			if(favoriteArray[registeredNum].second < 0 &&
				(favoriteArray[registeredNum].third >= 0 ||
					favoriteArray[registeredNum].fourth >= 0)) {
				let alert: UIAlertController = UIAlertController(title: "Error",
											message: "3位以下が設定されているのに2位が設定されていません。",
											preferredStyle: .alert)
				alert.addAction(defaultAction)
				self.present(alert, animated: true, completion: nil)
			} else if(favoriteArray[registeredNum].third < 0 &&
				favoriteArray[registeredNum].fourth >= 0) {
				let alert: UIAlertController = UIAlertController(title: "Error",
											message: "4位が設定されているのに3位が設定されていません。",
											preferredStyle: .alert)
				alert.addAction(defaultAction)
				self.present(alert, animated: true, completion: nil)
			} else {
				// all check ok
				choiceComplete = true
			}
		}

		if(choiceComplete) {
			let registerFavoriteFinishViewController = RegisterFavoriteFinishViewController()
			registerFavoriteFinishViewController.favoriteType = self.favoriteType
			let backBarButtonItem = UIBarButtonItem()
			backBarButtonItem.title = "お気に入り修正"
			self.navigationItem.backBarButtonItem = backBarButtonItem
			self.navigationController?.pushViewController(registerFavoriteFinishViewController,
														  animated: true)
		}
	}

	/// make GADBannerView
	/// - Parameter bannerView: GADBannerView
	/// - Authors: Nozomi Koyama
	func addBannerViewToView(_ bannerView: GADBannerView) {
		bannerView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(bannerView)
		view.addConstraints(
			[NSLayoutConstraint(item: bannerView,
								attribute: .bottom,
								relatedBy: .equal,
								toItem: view.safeAreaLayoutGuide,
								attribute: .bottom,
								multiplier: 1,
								constant: 0),
			 NSLayoutConstraint(item: bannerView,
								attribute: .centerX,
								relatedBy: .equal,
								toItem: view,
								attribute: .centerX,
								multiplier: 1,
								constant: 0)]
		)
	}
}
