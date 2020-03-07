//
//  Setting1ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/02/24.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

/// 設定画面①
class Setting1ViewController: ViewController, UITextFieldDelegate {

	// MARK: Views
	let smallTitle = UILabel()		// title
	let settingMsg = UILabel()		// setting message
	let joinNumLabel = UILabel()	// 参加人数 label
	let maleLabel = UILabel()		// 男 label
	let maleNum = UITextField()		// 男参加人数
	let femaleLabel = UILabel()		// 女 label
	let femaleNum = UITextField()	// 女参加人数
	let joinNumSumLabel = UILabel()	// 合計人数 label
	let tableTypeLabel = UILabel()	// テーブルタイプ label
	let nextBtn = UIButton()		// 次へボタン

	var joinNumSum = 0

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
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(100)
		}

		// setting message
		self.settingMsg.text = "最初に以下の設定をして下さい。"
		self.settingMsg.textColor = UIColor.black
		self.view.addSubview(settingMsg)
		self.settingMsg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(250)
		}
		
		// 参加人数
		self.joinNumLabel.text = "参加人数"
		self.joinNumLabel.textColor = UIColor.purple
		self.view.addSubview(joinNumLabel)
		self.joinNumLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
		}
		
		// 男
		self.maleLabel.text = "男: "
		self.maleLabel.textColor = UIColor.black
		self.view.addSubview(maleLabel)
		self.maleLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(80)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
		}
		
		// 男参加人数
		self.maleNum.keyboardType = .numberPad
		self.maleNum.borderStyle = .roundedRect
		self.maleNum.returnKeyType = .done
		self.maleNum.clearButtonMode = .always
		self.view.addSubview(maleNum)
		self.maleNum.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(345)
		}
		self.maleNum.delegate = self

		// 女
		self.femaleLabel.text = "女: "
		self.femaleLabel.textColor = UIColor.black
		self.view.addSubview(femaleLabel)
		self.femaleLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(180)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
		}
		
		// 女参加人数
		self.femaleNum.keyboardType = .numberPad
		self.femaleNum.borderStyle = .roundedRect
		self.femaleNum.returnKeyType = .done
		self.femaleNum.clearButtonMode = .always
		self.view.addSubview(femaleNum)
		self.femaleNum.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(220)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(345)
		}
		self.femaleNum.delegate = self
		
		// 合計人数
		self.joinNumSumLabel.text = "合計人数: "
		self.joinNumSumLabel.textColor = UIColor.black
		self.view.addSubview(joinNumSumLabel)
		self.joinNumSumLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(80)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(400)
		}

		// テーブルタイプ
		self.tableTypeLabel.text = "テーブルタイプ"
		self.tableTypeLabel.textColor = UIColor.purple
		self.view.addSubview(tableTypeLabel)
		self.tableTypeLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(450)
		}
		
		// next button
		self.nextBtn.setTitle("次へ", for: .normal)
		self.nextBtn.setTitleColor(UIColor.black, for: .normal)
		self.nextBtn.backgroundColor = UIColor.white
		self.nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.nextBtn.layer.borderColor = UIColor.gray.cgColor
		self.nextBtn.layer.borderWidth = 2.0
		self.nextBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.nextBtn)
		self.nextBtn.addTarget(self, action: #selector(self.nextBtnDidTap(_:)), for: .touchUpInside)
		self.nextBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100)
		}
	}
	
	@objc func nextBtnDidTap(_ sender: UIButton) {
		let setting2ViewController = Setting2ViewController()
		setting2ViewController.modalPresentationStyle = .fullScreen
		self.present(setting2ViewController, animated: true)
	}
}
