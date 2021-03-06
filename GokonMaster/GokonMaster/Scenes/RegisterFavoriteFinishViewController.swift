//
//  RegisterFavoriteFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/30.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class RegisterFavoriteFinishViewController: UIViewController, UINavigationControllerDelegate, GADBannerViewDelegate {

	// MARK: Views
	let nickname		= UILabel()			// nickname
	let message1		= UILabel()			// message1
	let rankLabel_1		= UILabel()			// 1位 label
	let rankLabel_2		= UILabel()			// 2位 label
	let rankLabel_3		= UILabel()			// 3位 label
	let rankLabel_4		= UILabel()			// 4位 label
	let favoriteName_1	= UILabel()			// お気に入り 1位
	let favoriteName_2	= UILabel()			// お気に入り 2位
	let favoriteName_3	= UILabel()			// お気に入り 3位
	let favoriteName_4	= UILabel()			// お気に入り 4位
	let message2		= UILabel()			// message2
	let okBtn			= UIButton()		// OK button
	
	var favoriteType:Int	= Int()		// 0:seat change, 1:matching

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation bar */
		title = "お気に入り登録"
		navigationController?.delegate = self

		// message1
		self.message1.numberOfLines = 2
		self.message1.text = "気に入ったお相手が以下の通り\n登録されました。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight)
		}

		// 1位
		self.rankLabel_1.text = "1位"
		self.rankLabel_1.textColor = UIColor.black
		self.rankLabel_1.textAlignment = NSTextAlignment.center
		self.rankLabel_1.font = self.rankLabel_1.font.withSize(25.0)
		self.rankLabel_1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.rankLabel_1)
		self.rankLabel_1.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+140)
		}
		if(favoriteArray[registeredNum].first < 0){
			self.favoriteName_1.text = "未登録"
		} else {
			if(memberData[registeredNum].sexIndex == 0) {
				self.favoriteName_1.text = femaleArray[favoriteArray[registeredNum].first].nickname
			} else if(memberData[registeredNum].sexIndex == 1) {
				self.favoriteName_1.text = maleArray[favoriteArray[registeredNum].first].nickname
			}
		}
		self.favoriteName_1.textColor = UIColor.black
		self.favoriteName_1.font = self.favoriteName_1.font.withSize(25.0)
		self.favoriteName_1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.favoriteName_1)
		self.favoriteName_1.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+140)
		}

		// 2位
		if((memberData[registeredNum].sexIndex == 0 && femaleNum >= 3) ||
			(memberData[registeredNum].sexIndex == 1 && maleNum >= 3)) {
			self.rankLabel_2.text = "2位"
			self.rankLabel_2.textColor = UIColor.black
			self.rankLabel_2.textAlignment = NSTextAlignment.center
			self.rankLabel_2.font = self.rankLabel_2.font.withSize(25.0)
			self.rankLabel_2.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_2)
			self.rankLabel_2.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+180)
			}
			if(favoriteArray[registeredNum].second < 0){
				self.favoriteName_2.text = "未登録"
			} else {
				if(memberData[registeredNum].sexIndex == 0) {
					self.favoriteName_2.text = femaleArray[favoriteArray[registeredNum].second].nickname
				} else if(memberData[registeredNum].sexIndex == 1) {
					self.favoriteName_2.text = maleArray[favoriteArray[registeredNum].second].nickname
				}
			}
			self.favoriteName_2.textColor = UIColor.black
			self.favoriteName_2.font = self.favoriteName_2.font.withSize(25.0)
			self.favoriteName_2.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.favoriteName_2)
			self.favoriteName_2.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+180)
			}
		}

		// 3位
		if( ( (memberData[registeredNum].sexIndex == 0 && femaleNum >= 4) ||
			  (memberData[registeredNum].sexIndex == 1 && maleNum >= 4) )
			&& self.favoriteType == 0 ) {
			self.rankLabel_3.text = "3位"
			self.rankLabel_3.textColor = UIColor.black
			self.rankLabel_3.textAlignment = NSTextAlignment.center
			self.rankLabel_3.font = self.rankLabel_3.font.withSize(25.0)
			self.rankLabel_3.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_3)
			self.rankLabel_3.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+220)
			}
			if(favoriteArray[registeredNum].third < 0){
				self.favoriteName_3.text = "未登録"
			} else {
				if(memberData[registeredNum].sexIndex == 0) {
					self.favoriteName_3.text = femaleArray[favoriteArray[registeredNum].third].nickname
				} else if(memberData[registeredNum].sexIndex == 1) {
					self.favoriteName_3.text = maleArray[favoriteArray[registeredNum].third].nickname
				}
			}
			self.favoriteName_3.textColor = UIColor.black
			self.favoriteName_3.font = self.favoriteName_3.font.withSize(25.0)
			self.favoriteName_3.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.favoriteName_3)
			self.favoriteName_3.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+220)
			}
		}

		// 4位
		if( ( (memberData[registeredNum].sexIndex == 0 && femaleNum >= 5) ||
			  (memberData[registeredNum].sexIndex == 1 && maleNum >= 5) )
			&& self.favoriteType == 0 ) {
			self.rankLabel_4.text = "4位"
			self.rankLabel_4.textColor = UIColor.black
			self.rankLabel_4.textAlignment = NSTextAlignment.center
			self.rankLabel_4.font = self.rankLabel_4.font.withSize(25.0)
			self.rankLabel_4.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.rankLabel_4)
			self.rankLabel_4.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+260)
			}
			if(favoriteArray[registeredNum].fourth < 0){
				self.favoriteName_4.text = "未登録"
			} else {
				if(memberData[registeredNum].sexIndex == 0) {
					self.favoriteName_4.text = femaleArray[favoriteArray[registeredNum].fourth].nickname
				} else if(memberData[registeredNum].sexIndex == 1) {
					self.favoriteName_4.text = maleArray[favoriteArray[registeredNum].fourth].nickname
				}
			}
			self.favoriteName_4.textColor = UIColor.black
			self.favoriteName_4.font = self.favoriteName_4.font.withSize(25.0)
			self.favoriteName_4.adjustsFontSizeToFitWidth = true
			self.view.addSubview(self.favoriteName_4)
			self.favoriteName_4.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+260)
			}
		}

		// message2
		if( registeredNum+1 == joinNumSum ) {
			self.message2.text = "全員の登録が完了しました。"
		} else {
			self.message2.numberOfLines = 2
			self.message2.text = "OKボタンを押して、\n"
								+ memberData[registeredNum+1].nickname + " さんに渡してください。"
		}
		self.message2.lineBreakMode = .byWordWrapping
		self.message2.textColor = UIColor.black
		self.view.addSubview(message2)
		self.message2.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(200)
		}

		// OK button
		if( registeredNum+1 == joinNumSum && favoriteType == 0 ) {
			self.okBtn.setTitle(" 席替え ", for: .normal)
		} else {
			self.okBtn.setTitle(" OK ", for: .normal)
		}
		self.okBtn.setTitleColor(UIColor.black, for: .normal)
		self.okBtn.backgroundColor = UIColor.green
		self.okBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.okBtn.layer.borderColor = UIColor.clear.cgColor
		self.okBtn.layer.borderWidth = 2.0
		self.okBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.okBtn)
		self.okBtn.addTarget(self,
							 action: #selector(self.okBtnDidTap(_:)),
							 for: .touchUpInside)
		self.okBtn.snp.makeConstraints { (make) in
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

	/// okBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func okBtnDidTap(_ sender: UIButton) {
		// registered number count up
		registeredNum += 1
		if( registeredNum == joinNumSum ) {
			if( self.favoriteType == 0 ) {
				initRegisteredNum()
				let seatChangeResultViewController = SeatChangeResultViewController()
				self.navigationController?.pushViewController(seatChangeResultViewController,
															  animated: true)
			} else if( self.favoriteType == 1 ) {
				initRegisteredNum()
				//マッチング
				matchingMainLogic()
				let matchingResultInitViewController = MatchingResultInitViewController()
				self.navigationController?.pushViewController(matchingResultInitViewController,
															  animated: true)
			}
		} else {
			let registerFavoriteViewController = RegisterFavoriteViewController()
			registerFavoriteViewController.favoriteType = self.favoriteType
			self.navigationController?.pushViewController(registerFavoriteViewController,
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
								constant: 0)
		])
	}
}
