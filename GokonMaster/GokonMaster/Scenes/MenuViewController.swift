//
//  MenuViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/10.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class MenuViewController: UIViewController, GADBannerViewDelegate {

	// MARK: Views
	let smallTitle			= UILabel()		// title
	let changeSeatBtn		= UIButton()	// 席替えボタン
	let changeTableTypeBtn	= UIButton()	// テーブルタイプ変更ボタン
	let gameBtn				= UIButton()	// ゲームボタン
	let matchingBtn			= UIButton()	// マッチングボタン
	let returnTopBtn		= UIButton()	// トップに戻るボタン

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation controller */
		menuLayerNum = navigationController!.viewControllers.count - 1

		// title
		self.smallTitle.numberOfLines = 2
		self.smallTitle.text = "合コン\n    master"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(50)
		}

		// 席替えボタン
		self.changeSeatBtn.setTitle("席替え", for: .normal)
		self.changeSeatBtn.setTitleColor(UIColor.black, for: .normal)
		self.changeSeatBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.changeSeatBtn.backgroundColor = UIColor.init(red: 255/255,
														  green: 187/255,
														  blue: 0/255,
														  alpha: 1)
		self.changeSeatBtn.layer.borderColor = UIColor.gray.cgColor
		self.changeSeatBtn.layer.borderWidth = 2.0
		self.changeSeatBtn.layer.cornerRadius = 2.0
		self.view.addSubview(changeSeatBtn)
		self.changeSeatBtn.addTarget(self,
									 action: #selector(self.changeSeatBtnDidTap(_:)),
									 for: .touchUpInside)
		self.changeSeatBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(180)
		}

		// テーブルタイプ変更ボタン
		self.changeTableTypeBtn.setTitle("テーブルタイプ変更(店移動)", for: .normal)
		self.changeTableTypeBtn.setTitleColor(UIColor.black, for: .normal)
		self.changeTableTypeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.changeTableTypeBtn.titleLabel?.adjustsFontSizeToFitWidth = true
		self.changeTableTypeBtn.backgroundColor = UIColor.init(red: 255/255,
															  green: 187/255,
															  blue: 0/255,
															  alpha: 1)
		self.changeTableTypeBtn.layer.borderColor = UIColor.gray.cgColor
		self.changeTableTypeBtn.layer.borderWidth = 2.0
		self.changeTableTypeBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.changeTableTypeBtn)
		self.changeTableTypeBtn.addTarget(self,
										 action: #selector(self.changeTableTypeBtnDidTap(_:)),
										 for: .touchUpInside)
		self.changeTableTypeBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(240)
		}

		// ゲームボタン
		self.gameBtn.setTitle("ゲーム", for: .normal)
		self.gameBtn.setTitleColor(UIColor.black, for: .normal)
		self.gameBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.gameBtn.backgroundColor = UIColor.init(red: 255/255,
													green: 187/255,
													blue: 0/255,
													alpha: 1)
		self.gameBtn.layer.borderColor = UIColor.gray.cgColor
		self.gameBtn.layer.borderWidth = 2.0
		self.gameBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.gameBtn)
		self.gameBtn.addTarget(self,
							   action: #selector(self.gameBtnDidTap(_:)),
							   for: .touchUpInside)
		self.gameBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}

		// マッチングボタン
		self.matchingBtn.setTitle("マッチング", for: .normal)
		self.matchingBtn.setTitleColor(UIColor.black, for: .normal)
		self.matchingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.matchingBtn.backgroundColor = UIColor.init(red: 255/255,
														green: 187/255,
														blue: 0/255,
														alpha: 1)
		self.matchingBtn.layer.borderColor = UIColor.gray.cgColor
		self.matchingBtn.layer.borderWidth = 2.0
		self.matchingBtn.layer.cornerRadius = 2.0
		self.view.addSubview(matchingBtn)
		self.matchingBtn.addTarget(self,
									 action: #selector(self.matchingBtnDidTap(_:)),
									 for: .touchUpInside)
		self.matchingBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(420)
		}

		// トップに戻るボタン
		self.returnTopBtn.setTitle("トップに戻る", for: .normal)
		self.returnTopBtn.setTitleColor(UIColor.black, for: .normal)
		self.returnTopBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.returnTopBtn.backgroundColor = UIColor.init(red: 255/255,
														 green: 187/255,
														 blue: 0/255,
														 alpha: 1)
		self.returnTopBtn.layer.borderColor = UIColor.gray.cgColor
		self.returnTopBtn.layer.borderWidth = 2.0
		self.returnTopBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.returnTopBtn)
		self.returnTopBtn.addTarget(self,
									action: #selector(self.returnTopBtnDidTap(_:)),
									for: .touchUpInside)
		self.returnTopBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
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

	/// changeSeatBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func changeSeatBtnDidTap(_ sender: UIButton) {
		if( joinNumSum<=2 ){
			let alert: UIAlertController = UIAlertController(
				title: "",
				message: "人数が少ない場合、この機能はご利用いただけません。",
				preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if( maleNum==1 && femaleNum==2 && tableTypeIndex==1 ){
			let alert: UIAlertController = UIAlertController(
				title: "",
				message: "人数が少ない場合、この機能はご利用いただけません。\n"
						+ "女性 男性 女性 の順に席替えしてください。",
				preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if( maleNum==2 && femaleNum==1 && tableTypeIndex==1 ){
			let alert: UIAlertController = UIAlertController(
				title: "",
				message: "人数が少ない場合、この機能はご利用いただけません。\n"
						+ "男性 女性 男性 の順に席替えしてください。",
				preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else {
			initRegisteredNum()
			initFavoriteArray(joinNum: joinNumSum)

			let registerFavoriteViewController = RegisterFavoriteViewController()
			registerFavoriteViewController.favoriteType = 0
			let backBarButtonItem = UIBarButtonItem()
			backBarButtonItem.title = "menu"
			self.navigationItem.backBarButtonItem = backBarButtonItem
			self.navigationController?.pushViewController(registerFavoriteViewController,
														  animated: true)
		}
	}

	/// changeSeatTypeBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func changeTableTypeBtnDidTap(_ sender: UIButton) {
		var newTableTypeName = ""
		var message = ""

		// alert message：Yesボタン押下
		let changeAction = UIAlertAction(title: "Yes",
										 style: .default,
										 handler: { (action: UIAlertAction) in
											tableTypeIndex = 1 - tableTypeIndex
											message = "テーブルタイプを" + newTableTypeName + "に変更しました。"
											let alert = UIAlertController(title: "",
																		  message: message,
																		  preferredStyle: .alert)
											alert.addAction(defaultAction)
											self.present(alert, animated: true, completion: nil)
		})
		// alert message：Noボタン押下
		let notChangeAction = UIAlertAction(title: "No",
											style: .default,
											handler: { (action: UIAlertAction) in
												message = "テーブルタイプの変更をキャンセルしました。"
												let alert = UIAlertController(title: "",
																			  message: message,
																			  preferredStyle: .alert)
												alert.addAction(defaultAction)
												self.present(alert, animated: true, completion: nil)
		})
		if( tableTypeIndex == 0 ) {
			let alert = UIAlertController(title: "",
										  message: "現在、テーブルタイプは四角が設定されています。\n"
													+ "テーブルタイプを丸に変更しますか？",
										  preferredStyle: .alert)
			alert.addAction(changeAction)
			alert.addAction(notChangeAction)
			present(alert, animated: true, completion: nil)
			newTableTypeName = "丸"
		} else {
			let alert = UIAlertController(title: "",
										  message: "現在、テーブルタイプは丸が設定されています。\n"
													+ "テーブルタイプを四角に変更しますか？",
										  preferredStyle: .alert)
			alert.addAction(changeAction)
			alert.addAction(notChangeAction)
			present(alert, animated: true, completion: nil)
			newTableTypeName = "四角"
		}
	}

	/// gameBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func gameBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let gameMenuViewController = GameMenuViewController()
		let backBarButtonItem = UIBarButtonItem()
		backBarButtonItem.title = "main menu"
		self.navigationItem.backBarButtonItem = backBarButtonItem
		self.navigationController?.pushViewController(gameMenuViewController,
													  animated: true)
	}

	/// matchingBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func matchingBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()
		initFavoriteArray(joinNum: joinNumSum)

		let registerFavoriteViewController = RegisterFavoriteViewController()
		registerFavoriteViewController.favoriteType = 1
		let backBarButtonItem = UIBarButtonItem()
		backBarButtonItem.title = "menu"
		self.navigationItem.backBarButtonItem = backBarButtonItem
		self.navigationController?.pushViewController(registerFavoriteViewController,
													  animated: true)
	}

	/// returnTopBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func returnTopBtnDidTap(_ sender: UIButton) {
		/* define actions */
		// reset alert message：Yesボタン押下
		let reset = UIAlertAction(title: "Yes",
								  style: .default,
								  handler:{
									(action: UIAlertAction!) -> Void in
									initAllPublicValues()
									self.navigationController?.setNavigationBarHidden(true,
																					  animated: false)
									self.navigationController?.popToRootViewController(animated: true)
		})
		// reset alert message：Noボタン押下
		let notReset = UIAlertAction(title: "No",
									 style: .default,
									 handler: {
										(action: UIAlertAction!) -> Void in
		})
		let alert = UIAlertController(title: "Alert",
								message: "登録された情報がリセットされます。よろしいですか？",
								preferredStyle: .alert)
		alert.addAction(notReset)
		alert.addAction(reset)
		present(alert, animated: true, completion: nil)
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
								constant: 0)
		])
	}
}
