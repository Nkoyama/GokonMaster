//
//  RegisterFavoriteViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/17.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class RegisterFavoriteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	// MARK: Views
	let backBtn				= UIButton()	// back button
	let smallTitle			= UILabel()		// title
	let secondTitle			= UILabel()		// secondary title
	let dearName			= UILabel()
	let message				= UILabel()

	let SCREEN_SIZE			= UIScreen.main.bounds.size


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// return button
		if(registeredNum <= 0) {
			self.backBtn.setTitle(" メニュー ", for: .normal)
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
		}

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

		// secondary title
		self.secondTitle.text = "お気に入り登録"
		self.secondTitle.textColor = UIColor.init(red: 0/255, green: 167/255, blue: 113/255, alpha: 1)
		self.secondTitle.font = UIFont.italicSystemFont(ofSize: 25.0)
		self.view.addSubview(secondTitle)
		self.secondTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
		}

		// dear name
		self.dearName.text = memberData[registeredNum].nickname + " さん"
		self.dearName.textColor = UIColor.red
		self.dearName.font = self.dearName.font.withSize(20)
		self.view.addSubview(dearName)
		self.dearName.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(240)
		}
		// message
		self.message.text = "気に入っている方を登録してください。"
		self.message.textColor = UIColor.black
		self.view.addSubview(message)
		self.message.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(270)
		}

		/* select favorite */
		// 行の間隔を計算
		let lineWidth = (SCREEN_SIZE.height - 500) / 5


		// 女の場合
		if(memberData[registeredNum].sexIndex == 1) {
			for i in 1...maleNum {
				let lankLabel		= UILabel()			// 順位 label
				var selectMalePV	= UIPickerView()	// select male picker view

				// 順位 label
				lankLabel.text = String(i) + "位"
				lankLabel.textColor = UIColor.black
				lankLabel.textAlignment = NSTextAlignment.center
				lankLabel.font = lankLabel.font.withSize(40.0 - 5.0*CGFloat(i))
				self.view.addSubview(lankLabel)
				lankLabel.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(310+Int(lineWidth)*(i-1))
				}

				// select male picker view
				let selectMalePV_startY = 310 + Int(lineWidth)*(i-1) - Int(lineWidth/2-5)
				let selectMalePV_width = SCREEN_SIZE.width - 140
				selectMalePV.frame = CGRect(x: 120, y: CGFloat(selectMalePV_startY), width: selectMalePV_width, height: lineWidth-10)
				selectMalePV.delegate = self
				selectMalePV.dataSource = self
				self.view.addSubview(selectMalePV)
			}
		// 男の場合
		} else {
			for i in 1...femaleNum {
				let lankLabel	= UILabel()		// 順位 label
				lankLabel.text = String(i) + "位"
				lankLabel.textColor = UIColor.black
				lankLabel.textAlignment = NSTextAlignment.center
				lankLabel.font = lankLabel.font.withSize(40.0 - 5.0*CGFloat(i))
				self.view.addSubview(lankLabel)
				lankLabel.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(300+Int(lineWidth)*(i-1))
				}
			}
		}
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}

}
