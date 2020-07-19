//
//  NGWordsCheckViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class NGWordsCheckViewController: UIViewController, GADBannerViewDelegate {
	
	// MARK: Views
	let message1			= UILabel()
	let againBtn			= UIButton()		// もう一度ボタン
	let finishBtn			= UIButton()		// 終了ボタン

	let SCREEN_SIZE		= UIScreen.main.bounds.size

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation bar */
		title = "NGワード"

		// message1
		self.message1.text = "皆さんのNGワードはこのようになっていました。"
		self.message1.textColor = UIColor.black
		self.message1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(140)
		}

		for i in 0..<joinNumSum {
			let memberName	= UILabel()
			let ngWord		= UILabel()
			memberName.text = memberData[i].nickname
			memberName.textColor = UIColor.black
			memberName.adjustsFontSizeToFitWidth = true
			self.view.addSubview(memberName)
			memberName.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(30)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(SCREEN_SIZE.width/3)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30*i + 200)
			}

			ngWord.text = ": " + assignedNGWords[i]
			ngWord.textColor = UIColor.black
			ngWord.adjustsFontSizeToFitWidth = true
			self.view.addSubview(ngWord)
			ngWord.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/3)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(30)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30*i + 200)
			}
		}

		// again button
		self.againBtn.setTitle(" もう一度 ", for: .normal)
		self.againBtn.setTitleColor(UIColor.black, for: .normal)
		self.againBtn.backgroundColor = UIColor.green
		self.againBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.againBtn.layer.borderColor = UIColor.clear.cgColor
		self.againBtn.layer.borderWidth = 2.0
		self.againBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.againBtn)
		self.againBtn.addTarget(self,
								action: #selector(self.againBtnDidTap(_:)),
								for: .touchUpInside)
		self.againBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomHeight+50)
		}

		// finish button
		self.finishBtn.setTitle(" 終了 ", for: .normal)
		self.finishBtn.setTitleColor(UIColor.black, for: .normal)
		self.finishBtn.backgroundColor = UIColor.green
		self.finishBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.finishBtn.layer.borderColor = UIColor.clear.cgColor
		self.finishBtn.layer.borderWidth = 2.0
		self.finishBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.finishBtn)
		self.finishBtn.addTarget(self,
								action: #selector(self.finishBtnDidTap(_:)),
								for: .touchUpInside)
		self.finishBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomHeight)
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

	/// againBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func againBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		self.navigationController?.popToViewController(navigationController!.viewControllers[gameMenuLayerNum+1],
													   animated: true)
	}

	/// finishBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func finishBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		self.navigationController?.popToViewController(navigationController!.viewControllers[gameMenuLayerNum],
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
