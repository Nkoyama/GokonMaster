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
	let ngWordBtn			= UIButton()	// NGワードボタン
	let kingGameBtn			= UIButton()	// 王様ゲームボタン
	let message				= UILabel()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation controller */
		title = "game menu"
		gameMenuLayerNum = navigationController!.viewControllers.count - 1

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
		bannerView.adUnitID = adUnitID
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
	}

	/// ngWordBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func ngWordBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let ngWordsInitViewController = NGWordsInitViewController()
		self.navigationController?.pushViewController(ngWordsInitViewController,
													  animated: true)
	}

	/// kingGameBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func kingGameBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let kingGameInitViewController = KingGameInitViewController()
		self.navigationController?.pushViewController(kingGameInitViewController,
													  animated: true)
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
