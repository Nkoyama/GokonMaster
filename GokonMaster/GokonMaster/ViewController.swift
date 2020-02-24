//
//  ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/02/24.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

	// views
	let button = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// background color
		self.view.backgroundColor = UIColor.green

		/* start button */
		self.view.addSubview(self.button)
		self.button.setTitle("合コンスタート", for: .normal)
		self.button.addTarget(self, action: #selector(self.buttonDidTap(_:)), for: .touchUpInside)
		self.button.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview() // X軸中心を親Viewに合わせる
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(100) //下から100ポイント上に配置
		}
	}
	
	// start button action
	@objc func buttonDidTap(_ sender: UIButton) {
		let setting1ViewController = Setting1ViewController()
		self.present(setting1ViewController, animated: true, completion: nil)
	}
}
