//
//  GameMenuViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class GameMenuViewController: UIViewController, GADBannerViewDelegate {

	// MARK: Views
	let backBtn				= UIButton()
	let smallTitle			= UILabel()		// title
	let ngWordBtn			= UIButton()	// NGワードボタン
	let kingGameBtn			= UIButton()	// 王様ゲームボタン
	let message				= UILabel()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// back button
		self.backBtn.setTitle(" メニューに戻る ", for: .normal)
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
		self.smallTitle.text = "ゲーム"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// NGワードボタン
		self.ngWordBtn.setTitle("NGワード", for: .normal)
		self.ngWordBtn.setTitleColor(UIColor.black, for: .normal)
		self.ngWordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.ngWordBtn.backgroundColor = UIColor.init(red: 255/255,
													  green: 187/255,
													  blue: 0/255,
													  alpha: 1)
		self.ngWordBtn.layer.borderColor = UIColor.gray.cgColor
		self.ngWordBtn.layer.borderWidth = 2.0
		self.ngWordBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.ngWordBtn)
		self.ngWordBtn.addTarget(self,
								 action: #selector(self.ngWordBtnDidTap(_:)),
								 for: .touchUpInside)
		self.ngWordBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// 王様ゲームボタン
		self.kingGameBtn.setTitle("王様ゲーム", for: .normal)
		self.kingGameBtn.setTitleColor(UIColor.black, for: .normal)
		self.kingGameBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.kingGameBtn.backgroundColor = UIColor.init(red: 255/255,
													  green: 187/255,
													  blue: 0/255,
													  alpha: 1)
		self.kingGameBtn.layer.borderColor = UIColor.gray.cgColor
		self.kingGameBtn.layer.borderWidth = 2.0
		self.kingGameBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.kingGameBtn)
		self.kingGameBtn.addTarget(self,
								   action: #selector(self.kingGameBtnDidTap(_:)),
								   for: .touchUpInside)
		self.kingGameBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(280)
		}

		// message
		self.message.numberOfLines = 2
		self.message.text = "他のゲームも続々追加予定！\nお楽しみに！"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(200)
		}

		// banner ad
		bannerView = GADBannerView(adSize: kGADAdSizeBanner)
		addBannerViewToView(bannerView)
		bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"	//develop
//		bannerView.adUnitId = "ca-app-pub-7688401383404240/1790495836"	//deploy
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		let menuViewController = MenuViewController()
		menuViewController.modalPresentationStyle = .fullScreen
		self.present(menuViewController, animated: true)
	}

	/// ngWordBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func ngWordBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let ngWordsInitViewController = NGWordsInitViewController()
		ngWordsInitViewController.modalPresentationStyle = .fullScreen
		self.present(ngWordsInitViewController, animated: true)
	}

	/// kingGameBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func kingGameBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let ngWordsInitViewController = NGWordsInitViewController()
		ngWordsInitViewController.modalPresentationStyle = .fullScreen
		self.present(ngWordsInitViewController, animated: true)
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
