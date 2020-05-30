//
//  ChooseFavoritePopup.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/05/23.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class ChooseFavoritePopup: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
	// MARK: Views
	let rankLabel			= UILabel()
	let finishBtn			= UIButton()

	var rank: Int				= Int()
	var sexIndex: Int			= Int()
	var choiceList: [String]	= []
	let SCREEN_SIZE				= UIScreen.main.bounds.size


	// MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor(red: 150/255,
											green: 150/255,
											blue: 150/255,
											alpha: 0.6)

		// set choice list
		if(sexIndex == 0) {
			choiceList = femaleNameArray
		} else if(sexIndex == 1) {
			choiceList = maleNameArray
		}

		let popupWidth	= SCREEN_SIZE.width * 2/3
		let popupHeight	= SCREEN_SIZE.height / 2

		let popupView = createFavoritePopupView(width: popupWidth, height: popupHeight)
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
	@objc func removePopup(_ sender: Any){
		// 元画面の再描画
		let parentVC = presentingViewController
		parentVC?.viewDidLoad()
		// 現在の画面削除
		self.dismiss(animated: false, completion: nil)
	}
	
	/// お気に入り選択ポップアップ画面
	/// - Parameters:
	///   - width: 画面幅
	///   - height: 画面高さ
	/// - Returns: UIView
	/// - Authors: Nozomi Koyama
	func createFavoritePopupView(width: CGFloat, height: CGFloat) -> UIView {
		let chooseFavoriteView = UIView()
		
		chooseFavoriteView.backgroundColor = UIColor.init(red: 99/255,
														  green: 78/255,
														  blue: 134/255,
														  alpha: 1)

		// 順位
		self.rankLabel.text = "お気に入り 第 " + String(rank) + " 位"
		self.rankLabel.textColor = UIColor.white
		chooseFavoriteView.addSubview(self.rankLabel)
		self.rankLabel.snp.makeConstraints{ (make) in
			make.left.equalTo(chooseFavoriteView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(chooseFavoriteView.safeAreaLayoutGuide.snp.top).inset(10)
		}

		// お気に入り選択リスト
		let favoriteChoiceTV: UITableView = UITableView(frame: CGRect(x: 10,
																	  y: 50,
																	  width: width-20,
																	  height: height-120))
		favoriteChoiceTV.register(UITableViewCell.self, forCellReuseIdentifier: "data")
		favoriteChoiceTV.rowHeight = (height-120)/5
		chooseFavoriteView.addSubview(favoriteChoiceTV)
		favoriteChoiceTV.delegate = self
		favoriteChoiceTV.dataSource = self

		// 完了ボタン
		self.finishBtn.setTitle(" 完了 ", for: .normal)
		self.finishBtn.setTitleColor(UIColor.black, for: .normal)
		self.finishBtn.backgroundColor = UIColor.green
		self.finishBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
		self.finishBtn.layer.borderColor = UIColor.clear.cgColor
		self.finishBtn.layer.borderWidth = 2.0
		self.finishBtn.layer.cornerRadius = 2.0
		chooseFavoriteView.addSubview(self.finishBtn)
		self.finishBtn.addTarget(self, action: #selector(removePopup(_:)), for: .touchUpInside)
		self.finishBtn.snp.makeConstraints{ (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(chooseFavoriteView.safeAreaLayoutGuide.snp.bottom).inset(20)
		}

		return chooseFavoriteView
	}

	/// セルの行数設定
	func tableView(_ favoriteChoiceTV: UITableView, numberOfRowsInSection section: Int) -> Int {
		return choiceList.count
	}

	/// セルの値設定
	func tableView(_ favoriteChoiceTV: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = choiceList[indexPath.row]

		if(indexPath.row == favoriteArray[registeredNum].first ||
			indexPath.row == favoriteArray[registeredNum].second ||
			indexPath.row == favoriteArray[registeredNum].third ||
			indexPath.row == favoriteArray[registeredNum].fourth) {
			// すでに選択済みの場合、セルを選択不可にする
			cell.selectionStyle = .none
			cell.backgroundColor = .gray
		} else {
			// セルの選択を許可
			cell.selectionStyle = .default
		}

		return cell
	}

	/// セル選択時のアクション
	func tableView(_ favoriteChoiceTV: UITableView, didSelectRowAt indexPath: IndexPath) {
		if(indexPath.row == favoriteArray[registeredNum].first ||
			indexPath.row == favoriteArray[registeredNum].second ||
			indexPath.row == favoriteArray[registeredNum].third ||
			indexPath.row == favoriteArray[registeredNum].fourth) {
			let alert: UIAlertController = UIAlertController(title: "エラー",
													message: "この方は既に他の順位で選択済みです。",
													preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else {
			switch rank {
				case 1:
					favoriteArray[registeredNum].first = indexPath.row
				case 2:
					favoriteArray[registeredNum].second = indexPath.row
				case 3:
					favoriteArray[registeredNum].third = indexPath.row
				case 4:
					favoriteArray[registeredNum].fourth = indexPath.row
				default:
					print("error")
			}
		}
	}
}
