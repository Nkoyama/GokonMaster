//
//  NGWordsAssignFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class NGWordsAssignFinishViewController: UIViewController, GADBannerViewDelegate {
	
	// MARK: Views
	let smallTitle			= UILabel()
	let message1			= UILabel()
	let checkBtn			= UIButton()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white
		
		// title
		self.smallTitle.text = "NGワード"
		self.smallTitle.textColor = UIColor.init(red: 0/255,
												 green: 167/255,
												 blue: 113/255,
												 alpha: 1)
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 30.0)
		self.view.addSubview(self.smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// message1
		self.message1.numberOfLines = 2
		self.message1.text = "全員のNGワード確認が完了しました。\n"
							+ "自分のNGワードを誰かに言わせましょう！"
		self.message1.textColor = UIColor.black
		self.message1.font = UIFont.systemFont(ofSize: 20.0)
		self.message1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(180)
		}

		// check button
		self.checkBtn.setTitle(" 全員のNGワードを確認 ", for: .normal)
		self.checkBtn.setTitleColor(UIColor.black, for: .normal)
		self.checkBtn.backgroundColor = UIColor.green
		self.checkBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.checkBtn.layer.borderColor = UIColor.clear.cgColor
		self.checkBtn.layer.borderWidth = 2.0
		self.checkBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.checkBtn)
		self.checkBtn.addTarget(self,
							 action: #selector(self.checkBtnDidTap(_:)),
							 for: .touchUpInside)
		self.checkBtn.snp.makeConstraints { (make) in
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

	/// checkBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func checkBtnDidTap(_ sender: UIButton) {
		let ngWordsCheckViewController = NGWordsCheckViewController()
		ngWordsCheckViewController.modalPresentationStyle = .fullScreen
		self.present(ngWordsCheckViewController, animated: true)
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
								toItem: bottomLayoutGuide,
								attribute: .top,
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
