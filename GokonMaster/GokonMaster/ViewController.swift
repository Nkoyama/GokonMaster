//
//  ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/02/24.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

/// 初期画面
class ViewController: UIViewController {

	// MARK: Views
	let startBtn = UIButton()
	let titleLabel = UILabel()
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		// background color
		self.view.backgroundColor = UIColor.green
		
		// title
		titleLabel.numberOfLines = 2
		titleLabel.text = "合コン\n    master"
		titleLabel.textColor = UIColor.blue
		titleLabel.font = UIFont.italicSystemFont(ofSize: 50.0)
		self.view.addSubview(titleLabel)
		self.titleLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()		//X軸中心を親Viewに合わせる
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(250)	//上から250ポイント
		}

		// start button
		self.startBtn.setTitle("合コンスタート", for: .normal)
		self.view.addSubview(self.startBtn)
		self.startBtn.addTarget(self, action: #selector(self.buttonDidTap(_:)), for: .touchUpInside)
		self.startBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()		//X軸中心を親Viewに合わせる
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100)	//下から100ポイント
		}
	}
	
	/// startBtn action
	/// - Parameter sender:
	/// - Authors: Nozomi Koyama
	@objc func buttonDidTap(_ sender: UIButton) {
		let setting1ViewController = Setting1ViewController()
		self.present(setting1ViewController, animated: true, completion: nil)
	}
}
