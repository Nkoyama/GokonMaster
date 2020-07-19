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
	let ruleLabel			= UILabel()
	let ruleDetail			= UILabel()
	let startBtn			= UIButton()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation controller */
		title = "NGワード"

		// rule
		self.ruleLabel.text = "ルール"
		self.ruleLabel.textColor = UIColor.orange
		self.ruleLabel.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.view.addSubview(self.ruleLabel)
		self.ruleLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight)
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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+120)
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
		bannerView.adUnitID = adUnitID
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
	}

	/// starttn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func startBtnDidTap(_ sender: UIButton) {
		// assign NG words
		ngWordAssignMainLogic()

		let ngWordsAssignInitViewController = NGWordsAssignInitViewController()
		self.navigationController?.pushViewController(ngWordsAssignInitViewController,
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
