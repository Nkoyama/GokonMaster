//
//  Setting2ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/07.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class Setting2ViewController: UIViewController, UITextFieldDelegate{

	// MARK: Views
	let returnBtn	= UIButton()	// return button
	let smallTitle	= UILabel()		// title
	let settingMsg	= UILabel()		// setting message

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// return button
		self.returnBtn.setTitle(" 戻る ", for: .normal)
		self.returnBtn.setTitleColor(UIColor.green, for: .normal)
		self.returnBtn.backgroundColor = UIColor.clear
		self.returnBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
		self.returnBtn.layer.borderColor = UIColor.clear.cgColor
		self.returnBtn.layer.borderWidth = 2.0
		self.returnBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.returnBtn)
		self.returnBtn.addTarget(self, action: #selector(self.returnBtnDidTap(_:)), for: .touchUpInside)
		self.returnBtn.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(5)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(0)
		}

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
		self.settingMsg.text = "席の配置を設定をして下さい。"
		self.settingMsg.textColor = UIColor.black
		self.view.addSubview(settingMsg)
		self.settingMsg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(250)
		}

		// テーブル分岐
		if(tableTypeIndex == 0) {
			// 四角テーブル
			let screenWidth = self.view.bounds.width
			let tableSquareDraw = TableSquareDrawView(frame: CGRect(x: screenWidth/2-80, y: 350, width: 160, height: 400))
			self.view.addSubview(tableSquareDraw)
		} else if(tableTypeIndex == 1) {
			// 丸テーブル
			let screenWidth = self.view.bounds.width
			let tableCircleDraw = TableCircleDrawView(frame: CGRect(x: screenWidth/2-80, y: 450, width: 160, height: 160))
			self.view.addSubview(tableCircleDraw)
		}
	}

	/// returnBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func returnBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}
}
