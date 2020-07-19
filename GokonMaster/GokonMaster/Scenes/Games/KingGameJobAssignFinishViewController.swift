//
//  KingGameJobAssignFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/11.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class KingGameJobAssignFinishViewController: UIViewController, UINavigationControllerDelegate, GADBannerViewDelegate {

	// MARK: Views
	let message1			= UILabel()
	let checkBtn			= UIButton()

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

		// message1
		self.message1.numberOfLines = 2
		self.message1.text = "全員の役職確認が完了しました。\n"
							+ "王様は以下の役割の人に命令しましょう！"
		self.message1.textColor = UIColor.black
		self.message1.font = UIFont.systemFont(ofSize: 20.0)
		self.message1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(140)
		}

		for i in 0...9 {
			if( assignedJobs[9-i] == "" ) {
				assignedJobs.remove(at: 9-i)
			}
		}
		let shuffledAssignedJobs = assignedJobs.shuffled()
		var j = 0
		for idx in 0..<joinNumSum {
			if( shuffledAssignedJobs[idx] != "王様" ) {
				let job	= UILabel()
				job.text = shuffledAssignedJobs[idx]
				job.textColor = UIColor.black
				job.adjustsFontSizeToFitWidth = true
				self.view.addSubview(job)
				job.snp.makeConstraints { (make) in
					make.centerX.equalToSuperview()
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30*j + 200)
				}
				j += 1
			}
		}

		// check button
		self.checkBtn.setTitle(" 全員の役職を確認 ", for: .normal)
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
		bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"	//develop
//		bannerView.adUnitID = "ca-app-pub-7688401383404240/1790495836"	//deploy
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
	}

	/// checkBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func checkBtnDidTap(_ sender: UIButton) {
		let kingGameCheckJobsViewController = KingGameCheckJobsViewController()
		let backBarButtonItem = UIBarButtonItem()
		backBarButtonItem.title = "戻る"
		self.navigationItem.backBarButtonItem = backBarButtonItem
		self.navigationController?.pushViewController(kingGameCheckJobsViewController,
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
