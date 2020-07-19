//
//  MatchingResultViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/06/27.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class MatchingResultViewController: UIViewController, UINavigationControllerDelegate, GADBannerViewDelegate {

	// MARK: Views
	let dearName			= UILabel()
	let message				= UILabel()
	let message2			= UILabel()
	let matchedName			= UILabel()
	let message3			= UILabel()
	let message4			= UILabel()
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

		// failed to match
		if( matchingResult[registeredNum] < 0 ) {
			// message2
			self.message2.numberOfLines = 2
			self.message2.text = "残念ながら、\n誰ともマッチングしませんでした。"
			self.message2.textColor = UIColor.black
			self.view.addSubview(message2)
			self.message2.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(100)
			}

			// message3
			self.message3.text = "(> <)"
			self.message3.textColor = UIColor.black
			self.view.addSubview(self.message3)
			self.message3.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(150)
			}
		// seucceed to match
		} else {
			// message2
			self.message2.text = "おめでとうございます！"
			self.message2.textColor = UIColor.orange
			self.view.addSubview(message2)
			self.matchedName.font = UIFont.systemFont(ofSize: 25.0)
			self.message2.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(100)
			}

			// matched name
			self.matchedName.text = memberData[matchingResult[registeredNum]].nickname + "さん"
			self.matchedName.textColor = UIColor.red
			self.matchedName.font = UIFont.systemFont(ofSize: 35.0)
			self.view.addSubview(self.matchedName)
			self.matchedName.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(140)
			}

			// message3
			self.message3.text = "とマッチしました！"
			self.message3.textColor = UIColor.black
			self.view.addSubview(self.message3)
			self.matchedName.font = UIFont.systemFont(ofSize: 25.0)
			self.message3.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
			}
		}

		// message4
		if( registeredNum+1 != joinNumSum ) {
			self.message4.numberOfLines = 2
			self.message4.text = "OKボタンを押して、\n"
					+ memberData[registeredNum+1].nickname + "さんに渡してください。"
		} else {
			self.message4.text = "全員のマッチング結果確認が終了しました。"
		}
			self.message4.textColor = UIColor.black
			self.view.addSubview(self.message4)
			self.message4.snp.makeConstraints { (make) in
				make.centerX.equalToSuperview()
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(280)
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
			self.navigationController?.popToViewController(navigationController!.viewControllers[menuLayerNum],
														   animated: true)
		} else {
			let matchingResultInitViewController = MatchingResultInitViewController()
			self.navigationController?.pushViewController(matchingResultInitViewController,
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
