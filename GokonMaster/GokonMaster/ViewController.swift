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
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		// background color
		self.view.backgroundColor = UIColor.green

		// start button
		self.view.addSubview(self.startBtn)
		self.startBtn.setTitle("合コンスタート", for: .normal)
		self.startBtn.addTarget(self, action: #selector(self.buttonDidTap(_:)), for: .touchUpInside)
		self.startBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview() // X軸中心を親Viewに合わせる
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100) //下から100ポイント上に配置
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
