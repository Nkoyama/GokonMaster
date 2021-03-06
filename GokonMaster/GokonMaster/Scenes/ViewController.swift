//
//  ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/02/24.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

/// 初期画面
class ViewController: UIViewController, GADBannerViewDelegate {

	// MARK: Views
	let titleLabel		= UILabel()		// title
	let startBtn		= UIButton()	// 合コンスタートボタン
	let howToUseBtn		= UIButton()	// 使い方ボタン

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		/* navigation bar */
		title = "top"
		// 初期画面はnavigation bar非表示
		self.navigationController?.setNavigationBarHidden(true,
														  animated: false)

		// background color
		self.view.backgroundColor = UIColor.green

		// title
		self.titleLabel.numberOfLines = 2
		self.titleLabel.text = "合コン\n    master"
		self.titleLabel.textColor = UIColor.blue
		self.titleLabel.font = UIFont.italicSystemFont(ofSize: 50.0)
		self.view.addSubview(titleLabel)
		self.titleLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()		//X軸中心を親Viewに合わせる
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// 使い方button
		self.howToUseBtn.setTitle(" 使い方 ", for: .normal)
		self.howToUseBtn.setTitleColor(UIColor.black, for: .normal)
		self.howToUseBtn.backgroundColor = UIColor.white
		self.howToUseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
		self.howToUseBtn.layer.borderColor = UIColor.gray.cgColor	//枠線色
		self.howToUseBtn.layer.borderWidth = 2.0					//枠線太さ
		self.howToUseBtn.layer.cornerRadius = 2.0					//枠線丸み
		self.view.addSubview(self.howToUseBtn)
		self.howToUseBtn.addTarget(self,
								   action: #selector(self.howToUseBtnDidTap(_:)),
								   for: .touchUpInside)
		self.howToUseBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomHeight+70)
		}

		// start button
		self.startBtn.setTitle(" 合コンスタート ", for: .normal)
		self.startBtn.setTitleColor(UIColor.black, for: .normal)
		self.startBtn.backgroundColor = UIColor.white
		self.startBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.startBtn.layer.borderColor = UIColor.gray.cgColor	//枠線色
		self.startBtn.layer.borderWidth = 2.0					//枠線太さ
		self.startBtn.layer.cornerRadius = 2.0					//枠線丸み
		self.view.addSubview(self.startBtn)
		self.startBtn.addTarget(self, action: #selector(self.startButtonDidTap(_:)), for: .touchUpInside)
		self.startBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()		//X軸中心を親Viewに合わせる
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

	/// howToUseBtn action
	/// - Parameter sender:
	/// - Authors: Nozomi Koyama
	@objc func howToUseBtnDidTap(_ sender: UIButton) {
		let howToUseViewController = HowToUseViewController()
		self.present(howToUseViewController, animated: true)
	}

	/// startBtn action
	/// - Parameter sender:
	/// - Authors: Nozomi Koyama
	@objc func startButtonDidTap(_ sender: UIButton) {
		let setting1ViewController = Setting1ViewController()
		self.navigationController?.pushViewController(setting1ViewController, animated: true)
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
