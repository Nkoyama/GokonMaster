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
	let matchingBtn			= UIButton()	// 最終マッチングボタン


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
		self.changeSeatBtn.backgroundColor = UIColor.init(red: 255/255, green: 187/255, blue: 0/255, alpha: 1)
		self.changeSeatBtn.layer.borderColor = UIColor.gray.cgColor
		self.changeSeatBtn.layer.borderWidth = 2.0
		self.changeSeatBtn.layer.cornerRadius = 2.0
		self.view.addSubview(changeSeatBtn)
		self.changeSeatBtn.addTarget(self, action: #selector(self.changeSeatBtnDidTap(_:)), for: .touchUpInside)
		self.changeSeatBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}

		// 最終マッチングボタン
		self.matchingBtn.setTitle("マッチング", for: .normal)
		self.matchingBtn.setTitleColor(UIColor.black, for: .normal)
		self.matchingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.matchingBtn.backgroundColor = UIColor.init(red: 255/255, green: 187/255, blue: 0/255, alpha: 1)
		self.matchingBtn.layer.borderColor = UIColor.gray.cgColor
		self.matchingBtn.layer.borderWidth = 2.0
		self.matchingBtn.layer.cornerRadius = 2.0
		self.view.addSubview(matchingBtn)
		self.matchingBtn.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(400)
		}
	}

	/// changeSeatBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func changeSeatBtnDidTap(_ sender: UIButton) {
		initRegisteredNum()
		initFavoriteArray(joinNum: joinNumSum)

		let registerFavoriteViewController = RegisterFavoriteViewController()
		registerFavoriteViewController.modalPresentationStyle = .fullScreen
		self.present(registerFavoriteViewController, animated: true)
	}
}
