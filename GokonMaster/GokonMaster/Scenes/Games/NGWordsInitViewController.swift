//
//  NGWordsInitViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class NGWordsInitViewController: UIViewController, GADBannerViewDelegate {
	
	// MARK: Views
	let backBtn				= UIButton()
	let smallTitle			= UILabel()
	let ruleLabel			= UILabel()
	let ruleDetail			= UILabel()
	let startBtn			= UIButton()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// back button
		self.backBtn.setTitle(" ゲーム選択に戻る ", for: .normal)
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
		self.smallTitle.text = "NGワード"
		self.smallTitle.textColor = UIColor.init(red: 0/255,
												 green: 167/255,
												 blue: 113/255,
												 alpha: 1)
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 30.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// rule
		self.ruleLabel.text = "ルール"
		self.ruleLabel.textColor = UIColor.orange
		self.ruleLabel.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.view.addSubview(self.ruleLabel)
		self.ruleLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(150)
		}

		// rule detail
		self.ruleDetail.numberOfLines = 10
		self.ruleDetail.text = "まず、全員に別々のNGワードが割り振られます。\n"
							 + "NGワードはゲーム終了まで覚えておき、\n"
							 + "誰にも教えないで下さい。\n"
							 + "自分だけのNGワードを、誰かに言わせたら勝ち、\n"
							 + "NGワードを言った人が負けとなります。\n"
							 + "他の人のNGワードを言わないようにしながら、\n"
							 + "自分のNGワードを言わせましょう。\n"
							 + "(自分のNGワードを自分で言うのはOK)\n\n"
							 + "最初に全員のNGワードを確認していきましょう！"
		self.ruleDetail.textColor = UIColor.black
		self.ruleDetail.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.ruleDetail)
		self.ruleDetail.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// start button
		self.startBtn.setTitle(" start ", for: .normal)
		self.startBtn.setTitleColor(UIColor.black, for: .normal)
		self.startBtn.backgroundColor = UIColor.green
		self.startBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.startBtn.layer.borderColor = UIColor.clear.cgColor
		self.startBtn.layer.borderWidth = 2.0
		self.startBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.startBtn)
		self.startBtn.addTarget(self,
								action: #selector(self.startBtnDidTap(_:)),
								for: .touchUpInside)
		self.startBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomHeight)
		}

		// banner ad
		bannerView = GADBannerView(adSize: kGADAdSizeBanner)
		addBannerViewToView(bannerView)
		bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		let gameMenuViewController = GameMenuViewController()
		gameMenuViewController.modalPresentationStyle = .fullScreen
		self.present(gameMenuViewController, animated: true)
	}

	/// starttn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func startBtnDidTap(_ sender: UIButton) {
		// assign NG words
		ngWordAssignMainLogic()

		let ngWordsAssignInitViewController = NGWordsAssignInitViewController()
		ngWordsAssignInitViewController.modalPresentationStyle = .fullScreen
		self.present(ngWordsAssignInitViewController, animated: true)
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
