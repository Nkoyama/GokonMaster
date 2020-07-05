//
//  NGWordsCheckViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class NGWordsCheckViewController: UIViewController {
	
	// MARK: Views
	let smallTitle			= UILabel()
	let message1			= UILabel()
	let againBtn			= UIButton()		// もう一度ボタン
	let finishBtn			= UIButton()		// 終了ボタン

	let SCREEN_SIZE		= UIScreen.main.bounds.size

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
		self.message1.text = "皆さんのNGワードはこのようになっていました。"
		self.message1.textColor = UIColor.black
		self.message1.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(140)
		}

		for i in 0..<joinNumSum {
			let memberName	= UILabel()
			let ngWord		= UILabel()
			memberName.text = memberData[i].nickname
			memberName.textColor = UIColor.black
			memberName.adjustsFontSizeToFitWidth = true
			self.view.addSubview(memberName)
			memberName.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(30)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(SCREEN_SIZE.width/3)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30*i + 200)
			}

			ngWord.text = ": " + assignedNGWords[i]
			ngWord.textColor = UIColor.black
			ngWord.adjustsFontSizeToFitWidth = true
			self.view.addSubview(ngWord)
			ngWord.snp.makeConstraints { (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/3)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(30)
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30*i + 200)
			}
		}

		// again button
		self.againBtn.setTitle(" もう一度 ", for: .normal)
		self.againBtn.setTitleColor(UIColor.black, for: .normal)
		self.againBtn.backgroundColor = UIColor.green
		self.againBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.againBtn.layer.borderColor = UIColor.clear.cgColor
		self.againBtn.layer.borderWidth = 2.0
		self.againBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.againBtn)
		self.againBtn.addTarget(self,
								action: #selector(self.againBtnDidTap(_:)),
								for: .touchUpInside)
		self.againBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
		}

		// finish button
		self.finishBtn.setTitle(" 終了 ", for: .normal)
		self.finishBtn.setTitleColor(UIColor.black, for: .normal)
		self.finishBtn.backgroundColor = UIColor.green
		self.finishBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.finishBtn.layer.borderColor = UIColor.clear.cgColor
		self.finishBtn.layer.borderWidth = 2.0
		self.finishBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.finishBtn)
		self.finishBtn.addTarget(self,
								action: #selector(self.finishBtnDidTap(_:)),
								for: .touchUpInside)
		self.finishBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
		}
	}

	/// againBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func againBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()
		
		let ngWordsInitViewController = NGWordsInitViewController()
		ngWordsInitViewController.modalPresentationStyle = .fullScreen
		self.present(ngWordsInitViewController, animated: true)
	}

	/// finishBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func finishBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()

		let gameMenuViewController = GameMenuViewController()
		gameMenuViewController.modalPresentationStyle = .fullScreen
		self.present(gameMenuViewController, animated: true)
	}
}