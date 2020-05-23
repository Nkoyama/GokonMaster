//
//  RegisterFavoriteViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/17.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class RegisterFavoriteViewController: UIViewController {
	// MARK: Views
	let backBtn				= UIButton()	// back button
	let smallTitle			= UILabel()		// title
	let secondTitle			= UILabel()		// secondary title
	let dearName			= UILabel()
	let message				= UILabel()
	let lankLabel_1			= UILabel()		// 1位 label
	let lankLabel_2			= UILabel()		// 2位 label
	let lankLabel_3			= UILabel()		// 3位 label
	let lankLabel_4			= UILabel()		// 4位 label
	let lankLabel_5			= UILabel()		// 5位 label
	let nameBtn_1			= UIButton()	// 1位 ボタン
	let nameBtn_2			= UIButton()	// 2位 ボタン
	let nameBtn_3			= UIButton()	// 3位 ボタン
	let nameBtn_4			= UIButton()	// 4位 ボタン
	let nameBtn_5			= UIButton()	// 5位 ボタン

	let SCREEN_SIZE			= UIScreen.main.bounds.size

	var nameArray	= [[String]]()
	var rankArray	= [String]()


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
			// 1位
			self.lankLabel_1.text = "1位"
			self.lankLabel_1.textColor = UIColor.black
			self.lankLabel_1.textAlignment = NSTextAlignment.center
			self.lankLabel_1.font = self.lankLabel_1.font.withSize(35.0)
			self.view.addSubview(self.lankLabel_1)
			self.lankLabel_1.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
			}

			self.nameBtn_1.setTitle("未選択", for: .normal)
			self.nameBtn_1.setTitleColor(UIColor.white, for: .normal)
			self.nameBtn_1.backgroundColor = UIColor.init(red: 99/255, green: 78/255, blue: 134/255, alpha: 1)
			self.nameBtn_1.layer.borderColor = UIColor.gray.cgColor
			self.nameBtn_1.layer.borderWidth = 1.0
			self.nameBtn_1.layer.cornerRadius = 1.0
			self.nameBtn_1.addTarget(self,
								action: #selector(self.chooseFavorite(_:)),
								for: .touchUpInside)
			self.view.addSubview(self.nameBtn_1)
			self.nameBtn_1.snp.makeConstraints{ (make) in
				make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
				make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
				make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350)
			}

			// 2位
			if(maleNum>=2) {
				self.lankLabel_2.text = "2位"
				self.lankLabel_2.textColor = UIColor.black
				self.lankLabel_2.textAlignment = NSTextAlignment.center
				self.lankLabel_2.font = self.lankLabel_2.font.withSize(32.0)
				self.view.addSubview(self.lankLabel_2)
				self.lankLabel_2.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth))
				}

				self.nameBtn_2.setTitle("未選択", for: .normal)
				self.nameBtn_2.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_2.backgroundColor = UIColor.init(red: 99/255, green: 78/255, blue: 134/255, alpha: 1)
				self.nameBtn_2.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_2.layer.borderWidth = 1.0
				self.nameBtn_2.layer.cornerRadius = 1.0
				self.nameBtn_2.addTarget(self,
								  action: #selector(self.chooseFavorite(_:)),
								  for: .touchUpInside)
				self.view.addSubview(self.nameBtn_2)
				self.nameBtn_2.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth))
				}
			}

			// 3位
			if(maleNum>=3) {
				self.lankLabel_3.text = "3位"
				self.lankLabel_3.textColor = UIColor.black
				self.lankLabel_3.textAlignment = NSTextAlignment.center
				self.lankLabel_3.font = self.lankLabel_3.font.withSize(30.0)
				self.view.addSubview(self.lankLabel_3)
				self.lankLabel_3.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*2)
				}

				self.nameBtn_3.setTitle("未選択", for: .normal)
				self.nameBtn_3.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_3.backgroundColor = UIColor.init(red: 99/255, green: 78/255, blue: 134/255, alpha: 1)
				self.nameBtn_3.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_3.layer.borderWidth = 1.0
				self.nameBtn_3.layer.cornerRadius = 1.0
				self.nameBtn_3.addTarget(self,
									action: #selector(self.chooseFavorite(_:)),
									for: .touchUpInside)
				self.view.addSubview(self.nameBtn_3)
				self.nameBtn_3.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth*2))
				}
			}

			// 4位
			if(maleNum>=4) {
				self.lankLabel_4.text = "4位"
				self.lankLabel_4.textColor = UIColor.black
				self.lankLabel_4.textAlignment = NSTextAlignment.center
				self.lankLabel_4.font = self.lankLabel_4.font.withSize(25.0)
				self.view.addSubview(self.lankLabel_4)
				self.lankLabel_4.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*3)
				}

				self.nameBtn_4.setTitle("未選択", for: .normal)
				self.nameBtn_4.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_4.backgroundColor = UIColor.init(red: 99/255, green: 78/255, blue: 134/255, alpha: 1)
				self.nameBtn_4.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_4.layer.borderWidth = 1.0
				self.nameBtn_4.layer.cornerRadius = 1.0
				self.nameBtn_4.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.view.addSubview(self.nameBtn_4)
				self.nameBtn_4.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*3)
				}
			}

			// 5位
			if(maleNum>=5) {
				self.lankLabel_5.text = "5位"
				self.lankLabel_5.textColor = UIColor.black
				self.lankLabel_5.textAlignment = NSTextAlignment.center
				self.lankLabel_5.font = self.lankLabel_5.font.withSize(25.0)
				self.view.addSubview(self.lankLabel_5)
				self.lankLabel_5.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*4)
				}

				self.nameBtn_5.setTitle("未選択", for: .normal)
				self.nameBtn_5.setTitleColor(UIColor.white, for: .normal)
				self.nameBtn_5.backgroundColor = UIColor.init(red: 99/255, green: 78/255, blue: 134/255, alpha: 1)
				self.nameBtn_5.layer.borderColor = UIColor.gray.cgColor
				self.nameBtn_5.layer.borderWidth = 1.0
				self.nameBtn_5.layer.cornerRadius = 1.0
				self.nameBtn_5.addTarget(self,
										 action: #selector(self.chooseFavorite(_:)),
										 for: .touchUpInside)
				self.view.addSubview(self.nameBtn_5)
				self.nameBtn_5.snp.makeConstraints{ (make) in
					make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(120)
					make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
					make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(350+Int(lineWidth)*4)
				}
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

	/// chooseFavoriteBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func chooseFavorite(_ sender: UIButton) {
		let chooseFavoritePopup = ChooseFavoritePopup()
		view.addSubview(chooseFavoritePopup.view)
	}
}
