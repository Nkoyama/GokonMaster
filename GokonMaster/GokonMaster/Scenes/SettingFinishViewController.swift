//
//  SettingFinishViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/06.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

/// 設定完了画面
class SettingFinishViewController: UIViewController {

	// MARK: Views
	let smallTitle		= UILabel()				// title
	let message			= UILabel()				// message
	let maleLabel		= UILabel()				// male label
	let femaleLabel		= UILabel()				// female label
	let maleMember		= UILabel()				// mele member
	let femaleMember	= UILabel()				// female member
	let nextBtn			= UIButton()			// 次へボタン

	let SCREEN_SIZE				= UIScreen.main.bounds.size

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

		// message
		self.message.numberOfLines = 3
		self.message.text = "全員の登録が完了しました。\nメンバーは以下の" + String(joinNumSum) + "人です。\nしばしご歓談ください。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
		}

		// member information
		self.maleLabel.text = "男"
		self.maleLabel.textColor = UIColor.init(red: 80/255, green: 85/255, blue: 150/255, alpha: 1)
		self.maleLabel.font = UIFont.systemFont(ofSize: 20.0)
		self.view.addSubview(maleLabel)
		self.maleLabel.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2 - 10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}
		self.femaleLabel.text = "女"
		self.femaleLabel.textColor = UIColor.init(red: 224/255, green: 88/255, blue: 129/255, alpha: 1)
		self.femaleLabel.font = UIFont.systemFont(ofSize: 20.0)
		self.view.addSubview(femaleLabel)
		self.femaleLabel.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(SCREEN_SIZE.width/2 - 10)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300)
		}
		var maleMemberTxt = ""
		var femaleMemberTxt = ""
		for oneMemberData in memberData {
			if(oneMemberData.sexIndex == 0) {
				maleMemberTxt += oneMemberData.nickname + "\n"
			} else {
				femaleMemberTxt += oneMemberData.nickname + "\n"
			}
		}
		self.maleMember.numberOfLines = maleNum + 1
		self.maleMember.text = maleMemberTxt
		self.maleMember.textColor = UIColor.init(red: 80/255, green: 85/255, blue: 150/255, alpha: 1)
		self.maleMember.font = UIFont.systemFont(ofSize: 20.0)
		self.maleMember.adjustsFontSizeToFitWidth = true
		self.view.addSubview(maleMember)
		self.maleMember.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(SCREEN_SIZE.width/2 - 10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(330)
		}
		self.femaleMember.numberOfLines = femaleNum + 1
		self.femaleMember.text = femaleMemberTxt
		self.femaleMember.textColor = UIColor.init(red: 224/255, green: 88/255, blue: 129/255, alpha: 1)
		self.femaleMember.font = UIFont.systemFont(ofSize: 20.0)
		self.femaleMember.adjustsFontSizeToFitWidth = true
		self.view.addSubview(femaleMember)
		self.femaleMember.snp.makeConstraints{ (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(SCREEN_SIZE.width/2 - 10)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(330)
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
	}

}
