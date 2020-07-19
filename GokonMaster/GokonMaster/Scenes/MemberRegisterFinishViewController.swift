//
//  MemberRegisterFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/04/12.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class MemberRegisterFinishViewController: UIViewController, UITextFieldDelegate, GADBannerViewDelegate {

	// MARK: Views
	let backBtn					= UIButton()		// back button
	let registeredNickname		= UILabel()			// registered nickname
	let message1				= UILabel()			// message1
	let contactInfoScrollV		= UIScrollView()	// contact information scroll view
	let nextBtn					= UIButton()		// 次へボタン
	let nickname				= UILabel()			// nickname
	let sexLabel				= UILabel()			// sex label
	let sex						= UILabel()			// sex
	let pinCodeLabel			= UILabel()			// PIN code label
	let pinCode					= UILabel()			// PIN code

	let SCREEN_SIZE				= UIScreen.main.bounds.size

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		/* navigation bar */
		title = "メンバー登録"

		// registered nickname
		self.registeredNickname.text = memberData[registeredNum].nickname + " さん"
		self.registeredNickname.textColor = UIColor.red
		self.registeredNickname.font = self.registeredNickname.font.withSize(20)
		self.view.addSubview(registeredNickname)
		self.registeredNickname.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// message1
		self.message1.text = "以下の情報が登録されました。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(130)
		}

		// sex
		self.sexLabel.text = "性別 : "
		self.sexLabel.textColor = UIColor.black
		self.view.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2-10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}
		if(memberData[registeredNum].sexIndex == 1){
			self.sex.text = "女"
		}else{
			self.sex.text = "男"
		}
		self.sex.textColor = UIColor.black
		self.view.addSubview(sex)
		self.sex.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// PIN code
		self.pinCodeLabel.text = "暗証番号 : "
		self.pinCodeLabel.textColor = UIColor.black
		self.view.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2-10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}
		self.pinCode.text = String(memberData[registeredNum].pinCode)
		self.pinCode.textColor = UIColor.black
		self.view.addSubview(pinCode)
		self.pinCode.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}

		// next button
		self.nextBtn.setTitle(" 次へ ", for: .normal)
		self.nextBtn.setTitleColor(UIColor.black, for: .normal)
		self.nextBtn.backgroundColor = UIColor.green
		self.nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.nextBtn.layer.borderColor = UIColor.clear.cgColor
		self.nextBtn.layer.borderWidth = 2.0
		self.nextBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.nextBtn)
		self.nextBtn.addTarget(self,
							   action: #selector(self.nextBtnDidTap(_:)),
							   for: .touchUpInside)
		self.nextBtn.snp.makeConstraints { (make) in
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

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		registeredNum += 1
		if( registeredNum == joinNumSum ) {
			let settingFinishViewController = SettingFinishViewController()
			self.navigationController?.pushViewController(settingFinishViewController,
														  animated: true)
		} else {
			let memberRegisterViewController = MemberRegisterViewController()
			self.navigationController?.pushViewController(memberRegisterViewController,
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
