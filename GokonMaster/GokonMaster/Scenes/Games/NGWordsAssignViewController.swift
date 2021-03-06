//
//  GNWordsAssignViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class NGWordsAssignViewController: UIViewController, UINavigationControllerDelegate, GADBannerViewDelegate {

	// MARK: Views
	let registeredNickname	= UILabel()
	let message1			= UILabel()
	let ngWordLabel			= UILabel()
	let message2			= UILabel()
	let message3			= UILabel()
	let okBtn				= UIButton()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation bar */
		title = "NGワード"
		self.navigationItem.hidesBackButton = true	//hide back button
		self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		navigationController?.delegate = self

		// registered nickname
		self.registeredNickname.text = memberData[registeredNum].nickname + " さん"
		self.registeredNickname.textColor = UIColor.red
		self.registeredNickname.font = self.registeredNickname.font.withSize(20)
		self.view.addSubview(registeredNickname)
		self.registeredNickname.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight)
		}

		// message1
		self.message1.text = "あなたのNGワードは"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+50)
		}

		// NG word
		self.ngWordLabel.text = assignedNGWords[registeredNum]
		self.ngWordLabel.textColor = UIColor.purple
		self.ngWordLabel.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.ngWordLabel.adjustsFontSizeToFitWidth = true
		self.ngWordLabel.textAlignment = NSTextAlignment.center
		self.view.addSubview(self.ngWordLabel)
		self.ngWordLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+90)
		}

		// message2
		self.message2.text = "です。"
		self.message2.textColor = UIColor.black
		self.view.addSubview(self.message2)
		self.message2.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+140)
		}

		// message3
		if( registeredNum + 1 == joinNumSum ) {
			self.message3.numberOfLines = 4
			self.message3.text = "NGワードはゲーム終了まで誰にも教えないで下さい。\n"
								+ "このNGワードを誰かに言わせたらあなたの勝ちです。\n\n"
								+ "NGワードを覚えたら、OKボタンを押してください。"
		} else {
			self.message3.numberOfLines = 5
			self.message3.text = "NGワードはゲーム終了まで誰にも教えないで下さい。\n"
								+ "このNGワードを誰かに言わせたらあなたの勝ちです。\n\n"
								+ "NGワードを覚えたら、OKボタンを押してから\n"
								+ memberData[registeredNum+1].nickname + " さんに渡してください。"
		}
		self.message3.textColor = UIColor.black
		self.message3.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.message3)
		self.message3.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+200)
		}

		// OK button
		self.okBtn.setTitle(" OK ", for: .normal)
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
		registeredNum += 1
		if( registeredNum == joinNumSum ) {
			let ngWordsAssignFinishViewController = NGWordsAssignFinishViewController()
			self.navigationController?.pushViewController(ngWordsAssignFinishViewController,
														  animated: true)
		} else {
			let ngWordsAssignInitViewController = NGWordsAssignInitViewController()
			self.navigationController?.pushViewController(ngWordsAssignInitViewController,
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
