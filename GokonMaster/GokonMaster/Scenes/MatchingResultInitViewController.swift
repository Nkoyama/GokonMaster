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

class MatchingResultInitViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, GADBannerViewDelegate {

	// MARK: Views
	let dearName			= UILabel()
	let message				= UILabel()
	let pinCodeTF			= UITextField()		// PIN code
	let okBtn				= UIButton()		// OK button

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation bar */
		title = "マッチング結果"
		self.navigationItem.hidesBackButton = true	//hide back button
		self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		navigationController?.delegate = self

		// dear name
		self.dearName.text = memberData[registeredNum].nickname + " さん"
		self.dearName.textColor = UIColor.red
		self.dearName.font = self.dearName.font.withSize(20)
		self.view.addSubview(dearName)
		self.dearName.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(100)
		}
		// message
		self.message.numberOfLines = 3
		self.message.text = "最初に登録した暗証番号を\n入力してください。\n"
						  + "※未登録の場合はそのままOKをタップ。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(150)
		}

		// PIN code
		self.pinCodeTF.keyboardType = .numberPad
		self.pinCodeTF.borderStyle = .roundedRect
		self.view.addSubview(pinCodeTF)
		self.pinCodeTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
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
		bannerView.adUnitID = adUnitID
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
			self.navigationController?.pushViewController(matchingResultViewController,
														  animated: true)
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
