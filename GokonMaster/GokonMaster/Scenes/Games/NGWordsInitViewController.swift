//
//  NGWordsInitViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/07/04.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class NGWordsInitViewController: UIViewController {
	
	// MARK: Views
	let backBtn				= UIButton()
	let smallTitle			= UILabel()
	let ruleLabel			= UILabel()
	let ruleDetail			= UILabel()


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// back button
		self.backBtn.setTitle(" ゲーム選択に戻る ", for: .normal)
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

		// title
		self.smallTitle.text = "NGワード"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// rule
		self.ruleLabel.text = "ルール"
		self.ruleLabel.textColor = UIColor.green
		self.ruleLabel.font = UIFont.italicSystemFont(ofSize: 30.0)
		self.view.addSubview(self.ruleLabel)
		self.ruleLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(150)
		}

		// rule detail
		self.ruleDetail.numberOfLines = 9
		self.ruleDetail.text = "まず、全員に別々のNGワードが割り振られます。\n"
							 + "NGワードはゲーム終了まで覚えておき、\n"
							 + "誰にも教えないで下さい。\n"
							 + "自分だけのNGワードを、誰かに言わせたら勝ち、\n"
							 + "NGワードを言った人が負けとなります。\n"
							 + "他の人のNGワードを言わないようにしながら、\n"
							 + "自分のNGワードを言わせましょう。\n\n"
							 + "最初に全員のNGワードを確認していきましょう！"
		self.ruleDetail.textColor = UIColor.black
		self.ruleDetail.adjustsFontSizeToFitWidth = true
		self.view.addSubview(self.ruleDetail)
		self.ruleDetail.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(200)
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
