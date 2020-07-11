//
//  MemberRegisterViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/22.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class MemberRegisterViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, GADBannerViewDelegate{

	// MARK: Views
	let smallTitle			= UILabel()				// title
	let message1			= UILabel()				// message1
	let message2			= UILabel()				// message2
	let nicknameLabel		= UILabel()				// nickname label
	let nicknameTF			= UITextField()			// nickname
	let sexLabel			= UILabel()				// sex label
	var sexSC				= UISegmentedControl()	// sex segmented control
	let pinCodeLabel		= UILabel()				// PIN code label
	let pinCodeTF			= UITextField()			// PIN code
	let nextBtn				= UIButton()			// 次へボタン

	let SCREEN_SIZE			= UIScreen.main.bounds.size

	var bannerView: GADBannerView!

	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

		// title
		self.smallTitle.text = "メンバー登録"
		self.smallTitle.textColor = UIColor.init(red: 0/255,
												 green: 167/255,
												 blue: 113/255,
												 alpha: 1)
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 30.0)
		self.view.addSubview(self.smallTitle)
		self.smallTitle.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(70)
		}

		// message1
		self.message1.text = String(registeredNum+1) + "人目"
		self.message1.textColor = UIColor.red
		self.message1.font = self.message1.font.withSize(20)
		self.view.addSubview(message1)
		self.message1.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(188)
		}
		// message2
		self.message2.text = "の情報を登録してください。"
		self.message2.textColor = UIColor.black
		self.view.addSubview(message2)
		self.message2.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(100)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(190)
		}

		// nickname
		self.nicknameLabel.text = "ニックネーム"
		self.nicknameLabel.textColor = UIColor.purple
		self.view.addSubview(nicknameLabel)
		self.nicknameLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(290)
		}
		self.nicknameTF.keyboardType = .asciiCapable
		self.nicknameTF.borderStyle = .roundedRect
		self.view.addSubview(nicknameTF)
		self.nicknameTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(160)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(285)
		}
		self.nicknameTF.delegate = self

		// 性別
		self.sexLabel.text = "性別"
		self.sexLabel.textColor = UIColor.purple
		self.view.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(340)
		}
		// 性別選択
		let options = ["男", "女"]
		self.sexSC = UISegmentedControl(items: options)
		self.view.addSubview(self.sexSC)
		self.sexSC.selectedSegmentIndex = 0
		self.sexSC.addTarget(self, action: #selector(self.sexChanged(_:)), for: .valueChanged)
		self.sexSC.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(160)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(335)
		}

		// PIN code
		self.pinCodeLabel.text = "暗証番号(最大6桁)"
		self.pinCodeLabel.textColor = UIColor.purple
		self.view.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(390)
		}
		self.pinCodeTF.keyboardType = .numberPad
		self.pinCodeTF.borderStyle = .roundedRect
		self.view.addSubview(pinCodeTF)
		self.pinCodeTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(200)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(385)
		}
		self.pinCodeTF.delegate = self

		// next button
		self.nextBtn.setTitle(" 次へ ", for: .normal)
		self.nextBtn.setTitleColor(UIColor.black, for: .normal)
		self.nextBtn.backgroundColor = UIColor.green
		self.nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
		self.nextBtn.layer.borderColor = UIColor.clear.cgColor
		self.nextBtn.layer.borderWidth = 2.0
		self.nextBtn.layer.cornerRadius = 2.0
		self.view.addSubview(self.nextBtn)
		self.nextBtn.addTarget(self, action: #selector(self.nextBtnDidTap(_:)), for: .touchUpInside)
		self.nextBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomHeight)
		}

		// banner ad
		bannerView = GADBannerView(adSize: kGADAdSizeBanner)
		addBannerViewToView(bannerView)
		bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"	//develop
//		bannerView.adUnitId = "ca-app-pub-7688401383404240/1790495836"	//deploy
		bannerView.rootViewController = self
		bannerView.load(GADRequest())
		bannerView.delegate = self
	}

	/// 性別が変更された時に、sexIndexを変更
	/// - Parameter sender: Any
	/// - Authors: Nozomi Koyama
	@objc func sexChanged(_ sender: Any) {
		memberData[registeredNum].sexIndex = self.sexSC.selectedSegmentIndex
	}

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		// 男女の人数をカウント
		if( memberData[registeredNum].sexIndex != 1 ) {
			memberData[registeredNum].sexIndex = 0
		}
		var maleSelectedCount = 0
		var femaleSelectedCount = 0
		for oneMemberData in memberData {
			if(oneMemberData.sexIndex == 0) {
				maleSelectedCount += 1
			} else if(oneMemberData.sexIndex == 1) {
				femaleSelectedCount += 1
			}
		}
		// 参加人数を超えていた場合にエラーメッセージ表示
		if( maleSelectedCount > maleNum ) {
			let alert: UIAlertController = UIAlertController(title: "エラー",
													 message: "男性は全員登録済みです。",
													 preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if( femaleSelectedCount > femaleNum ) {
			let alert: UIAlertController = UIAlertController(title: "エラー",
													 message: "女性は全員登録済みです。",
													 preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}

		if( self.nicknameTF.text!.count < 1 ){
			let alert: UIAlertController = UIAlertController(title: "エラー",
														message: "ニックネームが未入力です。",
														preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if( self.pinCodeTF.text!.count > 6 ){
			let alert: UIAlertController = UIAlertController(title: "エラー",
														message: "暗証番号は6桁以下にしてください。",
														preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if( self.pinCodeTF.text!.count < 1 ) {
			/* define actions */
			// PIN code alert message：Yesボタン押下
			let reset = UIAlertAction(title: "Yes",
									  style: .default,
									  handler:{
										(action: UIAlertAction!) -> Void in
										// get values
										memberData[registeredNum].nickname		= self.nicknameTF.text!
										memberData[registeredNum].pinCode		= self.pinCodeTF.text!

										let memberRegisterFinViewController = MemberRegisterFinishViewController()
										memberRegisterFinViewController.modalPresentationStyle = .fullScreen
										self.present(memberRegisterFinViewController, animated: true)
			})
			// PIN code alert message：Noボタン押下
			let notReset = UIAlertAction(title: "No",
										 style: .default,
										 handler: {
											(action: UIAlertAction!) -> Void in
			})
			let alert = UIAlertController(title: "",
										  message: "暗証番号が未登録です。よろしいですか？",
										  preferredStyle: .alert)
			alert.addAction(notReset)
			alert.addAction(reset)
			present(alert, animated: true, completion: nil)
		}else{
			// get values
			memberData[registeredNum].nickname		= self.nicknameTF.text!
			memberData[registeredNum].pinCode		= self.pinCodeTF.text!

			let memberRegisterFinViewController = MemberRegisterFinishViewController()
			memberRegisterFinViewController.modalPresentationStyle = .fullScreen
			self.present(memberRegisterFinViewController, animated: true)
		}
	}

	/// TextField以外の部分をタッチした時の処理
	/// - Parameters:
	///   - touches: Set<UITouch>
	///   - event: UIEvent
	/// - Authors: Nozomi Koyama
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		// close keyboard
		self.nicknameTF.resignFirstResponder()
		self.pinCodeTF.resignFirstResponder()
		keyWindow?.endEditing(true)
		// 選択されているTextField名をクリア
		initEditingTextFieldName()
		initKeyboardHeight()
	}

	/// returnキーが押された時にキーボードを閉じる
	/// - Parameter textField:
	/// - Returns: (boolean)
	/// - Authors: Nozomi Koyama
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// キーボードを閉じる
		textField.resignFirstResponder()
		keyWindow?.endEditing(true)
		// 選択されているTextField名をクリア
		initEditingTextFieldName()
		initKeyboardHeight()
		return true
	}
	
	/// 選択中のtextfieldを設定
	/// - Parameter textField:
	/// - Returns: true
	/// - Authors: Nozomi Koyama
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		if(textField == self.nicknameTF || textField == self.pinCodeTF){
			editingTextFieldName = "ignore"
		}
		return true
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	/// make GADBannerView
	/// - Parameter bannerView: GADBannerView
	/// - Authors: Nozomi Koyama
	func addBannerViewToView(_ bannerView: GADBannerView) {
		bannerView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(bannerView)
		view.addConstraints(
			[NSLayoutConstraint(item: bannerView,
								attribute: .bottom,
								relatedBy: .equal,
								toItem: view.safeAreaLayoutGuide,
								attribute: .bottom,
								multiplier: 1,
								constant: 0),
			 NSLayoutConstraint(item: bannerView,
								attribute: .centerX,
								relatedBy: .equal,
								toItem: view,
								attribute: .centerX,
								multiplier: 1,
								constant: 0)
		])
	}
}
