//
//  KingGameJobAssignViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/11.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class KingGameJobAssignViewController: UIViewController, UINavigationControllerDelegate, GADBannerViewDelegate {

	// MARK: Views
	let registeredNickname	= UILabel()
	let message1			= UILabel()
	let jobLabel			= UILabel()
	let message2			= UILabel()
	let message3			= UILabel()
	let okBtn				= UIButton()

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation controller */
		title = "王様ゲーム"
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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(150)
		}

		// message1
		self.message1.text = "あなたの役職は"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(180)
		}

		// job
		self.jobLabel.text = assignedJobs[registeredNum]
		self.jobLabel.textColor = UIColor.purple
		self.jobLabel.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.jobLabel.adjustsFontSizeToFitWidth = true
		self.jobLabel.textAlignment = NSTextAlignment.center
		self.view.addSubview(self.jobLabel)
		self.jobLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(220)
		}

		// message2
		self.message2.text = "です。"
		self.message2.textColor = UIColor.black
		self.view.addSubview(self.message2)
		self.message2.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(270)
		}

		// message3
		if( registeredNum + 1 == joinNumSum ) {
			self.message3.text = "役職を確認したら、OKボタンを押してください。"
		} else {
			self.message3.numberOfLines = 2
			self.message3.text = "役職を確認したら、OKボタンを押してから\n"
				+ memberData[registeredNum+1].nickname + " さんに渡してください。"
		}
		self.message3.textColor = UIColor.black
		self.message3.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.message3)
		self.message3.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
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
		bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"	//develop
//		bannerView.adUnitId = "ca-app-pub-7688401383404240/1790495836"	//deploy
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
			let kingGameJobAssignFinishViewController = KingGameJobAssignFinishViewController()
			self.navigationController?.pushViewController(kingGameJobAssignFinishViewController,
														  animated: true)
		} else {
			let kingGameJobAssignInitViewController = KingGameJobAssignInitViewController()
			self.navigationController?.pushViewController(kingGameJobAssignInitViewController,
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
								constant: 0)]
		)
	}
}
