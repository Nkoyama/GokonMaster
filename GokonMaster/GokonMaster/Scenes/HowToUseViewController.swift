//
//  closerViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/25.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

/// 使い方画面
class HowToUseViewController: UIViewController {

	// MARK: Views
	let closeBtn		= UIButton()	// close button
	let howToUse1Label	= UILabel()
	let howToUse1Text	= UILabel()
	let howToUse2Label	= UILabel()
	let howToUse2Text	= UILabel()
	let howToUse3Label	= UILabel()
	let howToUse3Text	= UILabel()

	override func viewDidLoad() {

		// background color
		self.view.backgroundColor = UIColor.white

		// close button
		self.closeBtn.setTitle(" ×close ", for: .normal)
		self.closeBtn.setTitleColor(UIColor.blue, for: .normal)
		self.closeBtn.backgroundColor = UIColor.clear
		self.closeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
		self.closeBtn.layer.borderColor = UIColor.clear.cgColor
		self.view.addSubview(self.closeBtn)
		self.closeBtn.addTarget(self,
								   action: #selector(self.closeBtnDidTap(_:)),
								   for: .touchUpInside)
		self.closeBtn.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(10)
		}

		// hot to use 1
		self.howToUse1Label.text = "①"
		self.howToUse1Label.textColor = UIColor.black
		self.view.addSubview(howToUse1Label)
		self.howToUse1Label.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(30)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight)
		}
		self.howToUse1Text.numberOfLines = 3
		self.howToUse1Text.text = "初期設定\n人数とテーブルタイプ(四角または丸)を設定します。"
		self.howToUse1Text.textColor = UIColor.black
		self.view.addSubview(howToUse1Text)
		self.howToUse1Text.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(30)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight)
		}

		// hot to use 2
		self.howToUse2Label.text = "②"
		self.howToUse2Label.textColor = UIColor.black
		self.view.addSubview(howToUse2Label)
		self.howToUse2Label.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(30)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+80)
		}
		self.howToUse2Text.numberOfLines = 10
		self.howToUse2Text.text = "参加者登録\n"
								+ "1人目のニックネームと暗証番号を登録します。"
								+ "暗証番号は未入力でもOKです。\n"
								+ "1人目の登録が完了したら、2人目の参加者にiPhoneを渡し、"
								+ "1人目と同様に登録します。\n"
								+ "これを全員の登録が完了するまで繰り返します。\n"
								+ "これで最初の準備は完了です。"
		self.howToUse2Text.textColor = UIColor.black
		self.view.addSubview(howToUse2Text)
		self.howToUse2Text.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(30)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+80)
		}

		// hot to use 3
		self.howToUse3Label.text = "③"
		self.howToUse3Label.textColor = UIColor.black
		self.view.addSubview(howToUse3Label)
		self.howToUse3Label.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(30)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+280)
		}
		self.howToUse3Text.numberOfLines = 9
		self.howToUse3Text.text = "全員の登録が完了後、メインメニューが表示されます。\n"
								+ "メニューからやりたいことを適宜選択してください。"
								+ "各機能の使い方は基本的には参加者登録と同じです。\n"
								+ "例えば、「席替え」の場合は、"
								+ "②と同じ要領で各参加者がお気に入りの方を登録していきます。"
								+ "全員が登録後、最適な座席順が表示されます。"
		self.howToUse3Text.textColor = UIColor.black
		self.view.addSubview(howToUse3Text)
		self.howToUse3Text.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(30)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(topHeight+280)
		}
	}

	/// closeBtn action
	/// - Parameter sender:
	/// - Authors: Nozomi Koyama
	@objc func closeBtnDidTap(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
}
