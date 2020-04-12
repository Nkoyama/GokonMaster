//
//  MemberRegisterFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/04/12.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MemberRegisterFinishViewController: UIViewController, UITextFieldDelegate{

	// MARK: Views
	let smallTitle			= UILabel()				// title
	let registeredNickname	= UILabel()				// registered nickname
	let message1			= UILabel()				// message1
	let nextBtn				= UIButton()			// 次へボタン

	
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
		
		// registered nickname
		self.registeredNickname.text = nicknameArray[registeredNum-1] + " さん"
		self.registeredNickname.textColor = UIColor.red
		self.registeredNickname.font = self.registeredNickname.font.withSize(20)
		self.view.addSubview(registeredNickname)
		self.registeredNickname.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}

		// message1
		self.message1.numberOfLines = 2
		self.message1.text = "あなたの情報が登録されました。\n次の方に渡してください。"
		self.message1.textColor = UIColor.black
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
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
		self.nextBtn.addTarget(self, action: #selector(self.nextBtnDidTap(_:)), for: .touchUpInside)
		self.nextBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
		}
	}

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		if(registeredNum == joinNumSum){
		}else{
			let memberRegisterViewController = MemberRegisterViewController()
			memberRegisterViewController.modalPresentationStyle = .fullScreen
			self.present(memberRegisterViewController, animated: true)
		}
	}
}
