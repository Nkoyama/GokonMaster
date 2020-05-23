//
//  ChooseFavoritePopup.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/23.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class ChooseFavoritePopup: UIViewController, UIGestureRecognizerDelegate {
	// MARK: Views
	let rankLabel		= UILabel()

	var rank: Int		= 0
	let SCREEN_SIZE		= UIScreen.main.bounds.size


	// MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()

		// 画面のどこかがタップされたらポップアップを消す
		let tapGesture = UITapGestureRecognizer(target: self,
												action: #selector(removePopup(_:)))
		self.view.isUserInteractionEnabled = true
		// デリゲートをセット
		tapGesture.delegate = self
		self.view.addGestureRecognizer(tapGesture)

		self.view.backgroundColor = UIColor(red: 150/255,
											green: 150/255,
											blue: 150/255,
											alpha: 0.6)

		let popupWidth	= SCREEN_SIZE.width * 2/3
		let popupHeight	= SCREEN_SIZE.height / 2

		let popupView = createFavoritePopupView()
		popupView.frame = CGRect(x: SCREEN_SIZE.width / 6,
								 y: SCREEN_SIZE.height / 4,
								 width: popupWidth,
								 height: popupHeight)
		popupView.layer.cornerRadius = 10.0
		self.view.addSubview(popupView)
	}
	
	/// ポップアップを消す
	/// - Parameter sender:
	/// - Authors: Nozomi Koyama
	@objc func removePopup(_ sendar: UITapGestureRecognizer){
		print("remove popup")
		self.dismiss(animated: true, completion: nil)
		self.view.removeFromSuperview()
	}

	func createFavoritePopupView() -> UIView {
		let chooseFavoriteView = UIView()
		
		chooseFavoriteView.backgroundColor = UIColor.init(red: 99/255,
														  green: 78/255,
														  blue: 134/255,
														  alpha: 1)

		// 順位
		self.rankLabel.text = "お気に入り 第 " + String(rank) + " 位"
		self.rankLabel.textColor = UIColor.white
		chooseFavoriteView.addSubview(rankLabel)
		self.rankLabel.snp.makeConstraints{ (make) in
			make.left.equalTo(chooseFavoriteView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(chooseFavoriteView.safeAreaLayoutGuide.snp.top).inset(10)
		}

		return chooseFavoriteView
	}
}
