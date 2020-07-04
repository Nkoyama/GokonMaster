//
//  GameMenuViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class GameMenuViewController: UIViewController {

	// MARK: Views
	let backBtn				= UIButton()
	let smallTitle			= UILabel()		// title
	let ngWordBtn			= UIButton()	// NGワードボタン
	
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// back button
		self.backBtn.setTitle(" メニューに戻る ", for: .normal)
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
		self.smallTitle.text = "ゲーム"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// NGワードボタン
		self.ngWordBtn.setTitle("NGワード", for: .normal)
		self.ngWordBtn.setTitleColor(UIColor.black, for: .normal)
		self.ngWordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.ngWordBtn.backgroundColor = UIColor.init(red: 255/255,
													  green: 187/255,
													  blue: 0/255,
													  alpha: 1)
		self.ngWordBtn.layer.borderColor = UIColor.gray.cgColor
		self.ngWordBtn.layer.borderWidth = 2.0
		self.ngWordBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.ngWordBtn)
		self.ngWordBtn.addTarget(self,
								 action: #selector(self.ngWordBtnDidTap(_:)),
								 for: .touchUpInside)
		self.ngWordBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		let menuViewController = MenuViewController()
		menuViewController.modalPresentationStyle = .fullScreen
		self.present(menuViewController, animated: true)
	}

	/// ngWordBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func ngWordBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let ngWordsInitViewController = NGWordsInitViewController()
		ngWordsInitViewController.modalPresentationStyle = .fullScreen
		self.present(ngWordsInitViewController, animated: true)
	}
}
