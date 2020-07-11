//
//  MatchingResultInitViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/06/27.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class MatchingResultInitViewController: UIViewController, UITextFieldDelegate, GADBannerViewDelegate {

	// MARK: Views
	let smallTitle			= UILabel()			// title
	let dearName			= UILabel()
	let message				= UILabel()
	let pinCodeTF			= UITextField()		// PIN code
	let okBtn				= UIButton()		// OK button

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// title
		self.smallTitle.text = "マッチング結果"
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

		// dear name
		self.dearName.text = memberData[registeredNum].nickname + " さん"
		self.dearName.textColor = UIColor.red
		self.dearName.font = self.dearName.font.withSize(20)
		self.view.addSubview(dearName)
		self.dearName.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}
		// message
		self.message.numberOfLines = 3
		self.message.text = "最初に登録した暗証番号を\n入力してください。\n"
						  + "※未登録の場合はそのままOKをタップ。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(250)
		}

		// PIN code
		self.pinCodeTF.keyboardType = .numberPad
		self.pinCodeTF.borderStyle = .roundedRect
		self.view.addSubview(pinCodeTF)
		self.pinCodeTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(330)
		}
		self.pinCodeTF.delegate = self

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
		if( self.pinCodeTF.text == memberData[registeredNum].pinCode ) {
			let matchingResultViewController = MatchingResultViewController()
			matchingResultViewController.modalPresentationStyle = .fullScreen
			self.present(matchingResultViewController, animated: true)
		} else {
			let alert: UIAlertController = UIAlertController(title: "Error",
															 message: "暗証番号が一致しません。",
															 preferredStyle: .alert)
			alert.addAction(defaultAction)
			self.present(alert, animated: true, completion: nil)
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
