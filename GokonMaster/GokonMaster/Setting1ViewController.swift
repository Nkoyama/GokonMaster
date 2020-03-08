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
class Setting1ViewController: UIViewController, UITextFieldDelegate {

	// MARK: Views
	let smallTitle		= UILabel()		// title
	let settingMsg		= UILabel()		// setting message
	let joinNumLabel	= UILabel()		// 参加人数 label
	let maleLabel		= UILabel()		// 男 label
	let maleNumTF		= UITextField()	// 男参加人数
	let femaleLabel		= UILabel()		// 女 label
	let femaleNumTF		= UITextField()	// 女参加人数
	let joinNumSumLabel	= UILabel()		// 合計人数 label
	let tableTypeLabel	= UILabel()		// テーブルタイプ label
	let nextBtn			= UIButton()	// 次へボタン

	public var maleNum = 0
	public var femaleNum = 0
	public var joinNumSum = 0

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
		self.maleNumTF.keyboardType = .numberPad
		self.maleNumTF.borderStyle = .roundedRect
		self.view.addSubview(maleNumTF)
		self.maleNumTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(110)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(345)
		}
		self.maleNumTF.delegate = self

		// 女
		self.femaleLabel.text = "女: "
		self.femaleLabel.textColor = UIColor.black
		self.view.addSubview(femaleLabel)
		self.femaleLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(180)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
		}
		
		// 女参加人数
		self.femaleNumTF.keyboardType = .numberPad
		self.femaleNumTF.borderStyle = .roundedRect
		self.view.addSubview(femaleNumTF)
		self.femaleNumTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(210)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(345)
		}
		self.femaleNumTF.delegate = self
		
		// 合計人数
		self.joinNumSumLabel.text = "合計人数: 0 人"
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
		self.nextBtn.setTitle(" 次へ ", for: .normal)
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
	
	/// nextBtn action
	/// - Parameter sender:
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		let setting2ViewController = Setting2ViewController()
		setting2ViewController.modalPresentationStyle = .fullScreen
		self.present(setting2ViewController, animated: true)
	}
	
	
	/// TextField以外の部分をタッチした時の処理
	/// - Parameters:
	///   - touches: <#touches description#>
	///   - event: <#event description#>
	/// - Authors: Nozomi Koyama
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		// close keyboard
		self.maleNumTF.resignFirstResponder()
		self.femaleNumTF.resignFirstResponder()

		// get values
		do {
			try maleNum = String2Int(str: self.maleNumTF.text!)
		} catch {
			maleNum  = 0
		}
		do {
			try femaleNum = String2Int(str: self.femaleNumTF.text!)
		} catch {
			femaleNum  = 0
		}
		joinNumSum = maleNum + femaleNum
		self.joinNumSumLabel.text = "合計人数: " + String(joinNumSum) + " 人"
	}

}
