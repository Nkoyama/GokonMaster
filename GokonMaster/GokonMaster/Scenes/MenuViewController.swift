//
//  MenuViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/10.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {

	// MARK: Views
	let smallTitle			= UILabel()		// title
	let changeSeatBtn		= UIButton()	// 席替えボタン
	let gameBtn				= UIButton()	// ゲームボタン
	let matchingBtn			= UIButton()	// マッチングボタン
	let returnTopBtn		= UIButton()	// トップに戻るボタン


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// title
		self.smallTitle.numberOfLines = 2
		self.smallTitle.text = "合コン\n    master"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// 席替えボタン
		self.changeSeatBtn.setTitle("席替え", for: .normal)
		self.changeSeatBtn.setTitleColor(UIColor.black, for: .normal)
		self.changeSeatBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.changeSeatBtn.backgroundColor = UIColor.init(red: 255/255,
														  green: 187/255,
														  blue: 0/255,
														  alpha: 1)
		self.changeSeatBtn.layer.borderColor = UIColor.gray.cgColor
		self.changeSeatBtn.layer.borderWidth = 2.0
		self.changeSeatBtn.layer.cornerRadius = 2.0
		self.view.addSubview(changeSeatBtn)
		self.changeSeatBtn.addTarget(self,
									 action: #selector(self.changeSeatBtnDidTap(_:)),
									 for: .touchUpInside)
		self.changeSeatBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}

		// ゲームボタン
		self.gameBtn.setTitle("ゲーム", for: .normal)
		self.gameBtn.setTitleColor(UIColor.black, for: .normal)
		self.gameBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.gameBtn.backgroundColor = UIColor.init(red: 255/255,
													green: 187/255,
													blue: 0/255,
													alpha: 1)
		self.gameBtn.layer.borderColor = UIColor.gray.cgColor
		self.gameBtn.layer.borderWidth = 2.0
		self.gameBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.gameBtn)
		self.gameBtn.addTarget(self,
							   action: #selector(self.gameBtnDidTap(_:)),
							   for: .touchUpInside)
		self.gameBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(290)
		}

		// マッチングボタン
		self.matchingBtn.setTitle("マッチング", for: .normal)
		self.matchingBtn.setTitleColor(UIColor.black, for: .normal)
		self.matchingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.matchingBtn.backgroundColor = UIColor.init(red: 255/255,
														green: 187/255,
														blue: 0/255,
														alpha: 1)
		self.matchingBtn.layer.borderColor = UIColor.gray.cgColor
		self.matchingBtn.layer.borderWidth = 2.0
		self.matchingBtn.layer.cornerRadius = 2.0
		self.view.addSubview(matchingBtn)
		self.matchingBtn.addTarget(self,
									 action: #selector(self.matchingBtnDidTap(_:)),
									 for: .touchUpInside)
		self.matchingBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
		}

		// トップに戻るボタン
		self.returnTopBtn.setTitle("トップに戻る", for: .normal)
		self.returnTopBtn.setTitleColor(UIColor.black, for: .normal)
		self.returnTopBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.returnTopBtn.backgroundColor = UIColor.init(red: 255/255,
														 green: 187/255,
														 blue: 0/255,
														 alpha: 1)
		self.returnTopBtn.layer.borderColor = UIColor.gray.cgColor
		self.returnTopBtn.layer.borderWidth = 2.0
		self.returnTopBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.returnTopBtn)
		self.returnTopBtn.addTarget(self,
									action: #selector(self.returnTopBtnDidTap(_:)),
									for: .touchUpInside)
		self.returnTopBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(550)
		}
	}

	/// changeSeatBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func changeSeatBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()
		initFavoriteArray(joinNum: joinNumSum)

		let registerFavoriteViewController = RegisterFavoriteViewController()
		registerFavoriteViewController.favoriteType = 0
		registerFavoriteViewController.modalPresentationStyle = .fullScreen
		self.present(registerFavoriteViewController, animated: true)
	}

	/// gameBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func gameBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let gameMenuViewController = GameMenuViewController()
		gameMenuViewController.modalPresentationStyle = .fullScreen
		self.present(gameMenuViewController, animated: true)
	}

	/// matchingBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func matchingBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()
		initFavoriteArray(joinNum: joinNumSum)

		let registerFavoriteViewController = RegisterFavoriteViewController()
		registerFavoriteViewController.favoriteType = 1
		registerFavoriteViewController.modalPresentationStyle = .fullScreen
		self.present(registerFavoriteViewController, animated: true)
	}

	/// returnTopBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func returnTopBtnDidTap(_ sender: UIButton) {
		/* define actions */
		// reset alert message：Yesボタン押下
		let reset = UIAlertAction(title: "Yes",
								  style: .default,
								  handler:{
									(action: UIAlertAction!) -> Void in
									initAllPublicValues()
									let topViewController = ViewController()
									topViewController.modalPresentationStyle = .fullScreen
									self.present(topViewController, animated: true)
		})
		// reset alert message：Noボタン押下
		let notReset = UIAlertAction(title: "No",
									 style: .default,
									 handler: {
										(action: UIAlertAction!) -> Void in
		})
		let alert = UIAlertController(title: "Alert",
								message: "登録された情報がリセットされます。よろしいですか？",
								preferredStyle: .alert)
		alert.addAction(notReset)
		alert.addAction(reset)
		present(alert, animated: true, completion: nil)
	}
}
