//
//  Setting1ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/02/24.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

public var maleNum = 0
public var femaleNum = 0
public var joinNumSum = 0
public var tableTypeIndex = 0

/// 設定画面①
class Setting1ViewController: UIViewController, UITextFieldDelegate {

	// MARK: Views
	let smallTitle		= UILabel()				// title
	let settingMsg		= UILabel()				// setting message
	let joinNumLabel	= UILabel()				// 参加人数 label
	let maleLabel		= UILabel()				// 男 label
	let maleNumTF		= UITextField()			// 男参加人数
	let femaleLabel		= UILabel()				// 女 label
	let femaleNumTF		= UITextField()			// 女参加人数
	let joinNumSumLabel	= UILabel()				// 合計人数 label
	let tableTypeLabel	= UILabel()				// テーブルタイプ label
	var tableTypeSC		= UISegmentedControl()	// テーブルタイプ選択 segmented control
	let nextBtn			= UIButton()			// 次へボタン

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

		// テーブルタイプ選択
		let options = ["四角", "丸"]
		self.tableTypeSC = UISegmentedControl(items: options)
		self.view.addSubview(self.tableTypeSC)
		self.tableTypeSC.selectedSegmentIndex = 0
		self.tableTypeSC.addTarget(self, action: #selector(self.tableTypeChanged(_:)), for: .valueChanged)
		self.tableTypeSC.snp.makeConstraints { (make) in
			make.width.equalTo(250)
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(480)
		}

		// テーブルタイプの（四角、丸）の描画
		let screenWidth = self.view.bounds.width	//Screen Size Width
		let tableTypeDraw = TableTypeDrawView(frame: CGRect(x: screenWidth/2-100, y: 570, width: 210, height: 100))
		self.view.addSubview(tableTypeDraw)

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
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(70)
		}
	}

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		if(maleNum <= 0) {
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "男性の人数を設定してください。", preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if(femaleNum <= 0) {
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "女性の人数を設定してください。", preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if(maleNum > 5 || femaleNum > 5) {
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "申し訳ございませんが、男性または女性が6人以上の合コンには対応しておりません。", preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else {
			let setting2ViewController = Setting2ViewController()
			setting2ViewController.modalPresentationStyle = .fullScreen
			self.present(setting2ViewController, animated: true)
		}
	}
	// エラーメッセージ：OKボタン押下
	let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
		(action: UIAlertAction!) -> Void in
	})

	/// TextField以外の部分をタッチした時の処理
	/// - Parameters:
	///   - touches: Set<UITouch>
	///   - event: UIEvent
	/// - Authors: Nozomi Koyama
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		// close keyboard
		self.maleNumTF.resignFirstResponder()
		self.femaleNumTF.resignFirstResponder()

		// get values
		do {
			try maleNum = String2Int(str: self.maleNumTF.text!)
		} catch {
			maleNum = 0
		}
		do {
			try femaleNum = String2Int(str: self.femaleNumTF.text!)
		} catch {
			femaleNum = 0
		}
		joinNumSum = maleNum + femaleNum
		self.joinNumSumLabel.text = "合計人数: " + String(joinNumSum) + " 人"
	}

	@objc func tableTypeChanged(_ sender: Any) {
		tableTypeIndex = self.tableTypeSC.selectedSegmentIndex
		print(tableTypeIndex)
	}
}
