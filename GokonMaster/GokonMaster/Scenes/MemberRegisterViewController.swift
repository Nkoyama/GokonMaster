//
//  MemberRegisterViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2020/03/22.
//  Copyright © 2020 Nozomi Koyama. All rights reserved.
//

import UIKit
import SnapKit

class MemberRegisterViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate{

	// MARK: Views
	let backBtn				= UIButton()			// back button
	let smallTitle			= UILabel()				// title
	let message1			= UILabel()				// message1
	let message2			= UILabel()				// message2
	let settingMsg			= UILabel()				// setting message
	let nicknameLabel		= UILabel()				// nickname label
	let nicknameTF			= UITextField()			// nickname
	let sexLabel			= UILabel()				// sex label
	var sexSC				= UISegmentedControl()	// sex segmented control
	let pinCodeLabel		= UILabel()				// PIN code label
	let pinCodeTF			= UITextField()			// PIN code
	let contactInfoLabel	= UILabel()				// contact information label
	let contactInfoMsg		= UILabel()				// contact information message
	let contactInfoScrollV	= UIScrollView()		// contact information scroll view
	let nextBtn				= UIButton()			// 次へボタン


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white
		
		// return button
		self.backBtn.setTitle(" 戻る ", for: .normal)
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
		self.smallTitle.numberOfLines = 2
		self.smallTitle.text = "合コン\n    master"
		self.smallTitle.textColor = UIColor.blue
		self.smallTitle.font = UIFont.italicSystemFont(ofSize: 40.0)
		self.view.addSubview(smallTitle)
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
		// setting message
		self.settingMsg.numberOfLines = 2
		self.settingMsg.text = "※登録された連絡先は合コン終了後、\n  マッチした相手にのみ表示されます。"
		self.settingMsg.textColor = UIColor.black
		self.view.addSubview(settingMsg)
		self.settingMsg.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(230)
		}

		// nickname
		self.nicknameLabel.text = "ニックネーム"
		self.nicknameLabel.textColor = UIColor.purple
		self.view.addSubview(nicknameLabel)
		self.nicknameLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(320)
		}
		self.nicknameTF.keyboardType = .asciiCapable
		self.nicknameTF.borderStyle = .roundedRect
		self.view.addSubview(nicknameTF)
		self.nicknameTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(160)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(315)
		}
		self.nicknameTF.delegate = self

		// 性別
		self.sexLabel.text = "性別"
		self.sexLabel.textColor = UIColor.purple
		self.view.addSubview(sexLabel)
		self.sexLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(370)
		}
		// 性別選択
		let options = ["男", "女"]
		self.sexSC = UISegmentedControl(items: options)
		self.view.addSubview(self.sexSC)
		self.sexSC.selectedSegmentIndex = 0
		self.sexSC.addTarget(self, action: #selector(self.sexChanged(_:)), for: .valueChanged)
		self.sexSC.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(160)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(365)
		}

		// PIN code
		self.pinCodeLabel.text = "暗証番号(最大6桁)"
		self.pinCodeLabel.textColor = UIColor.purple
		self.view.addSubview(pinCodeLabel)
		self.pinCodeLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(420)
		}
		self.pinCodeTF.keyboardType = .numberPad
		self.pinCodeTF.borderStyle = .roundedRect
		self.view.addSubview(pinCodeTF)
		self.pinCodeTF.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(200)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(415)
		}
		self.pinCodeTF.delegate = self

		/* contact information */
		self.contactInfoLabel.text = "連絡先"
		self.contactInfoLabel.textColor = UIColor.purple
		self.view.addSubview(contactInfoLabel)
		self.contactInfoLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(470)
		}
		// contact information message
		self.contactInfoMsg.text = "(以下のうち、最低1つ登録してください。)"
		self.contactInfoMsg.textColor = UIColor.black
		self.view.addSubview(contactInfoMsg)
		self.contactInfoMsg.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(40)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(490)
		}
		// scroll view
		self.contactInfoScrollV.layer.borderColor = UIColor.black.cgColor
		self.contactInfoScrollV.layer.borderWidth = 1.0
		self.contactInfoScrollV.contentSize = CGSize(width: self.view.frame.width-100, height: 245)
		self.contactInfoScrollV.delegate = self
		self.view.addSubview(self.contactInfoScrollV)
		self.contactInfoScrollV.snp.makeConstraints { (make) in
			make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(50)
			make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(50)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(520)
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
		}
		let contactInfoView = createContactInfoListView()
		self.contactInfoScrollV.addSubview(contactInfoView)
		// ドラッグ開始時にキーボードを閉じる
		self.contactInfoScrollV.keyboardDismissMode = .onDrag
		// キーボードを下にドラッグした時にキーボードを閉じる
		self.contactInfoScrollV.keyboardDismissMode = .interactive

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
			make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
		}

	}

	/// 性別が変更された時に、sexIndexを変更
	/// - Parameter sender: Any
	/// - Authors: Nozomi Koyama
	@objc func sexChanged(_ sender: Any) {
		sexIndexArray[registeredNum] = self.sexSC.selectedSegmentIndex
	}
	
	/// 連絡先を入力するスクロール部分のViewを作成
	/// - Authors: Nozomi Koyama
	func createContactInfoListView() -> UIView {
		// MARK: Views
		let contactInfoListView = UIView()
		contactInfoListView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-100, height: 245)
		let lineIdLabel			= UILabel()			// LINE ID label
		let lineIdTF			= UITextField()		// LINE ID
		let emailAddressLabel	= UILabel()			// e-mail address label
		let emailAddressTF		= UITextField()		// e-mail address
		let phoneNumberLabel	= UILabel()			// phone number label
		let phoneNumberTF		= UITextField()		// phone number
		let instagramIdLabel	= UILabel()			// Instagram ID label
		let instagramIdTF		= UITextField()		// Instagram ID
		let twitterIdLabel		= UILabel()			// Twitter ID label
		let twitterIdTF			= UITextField()		// twitter ID
		let otherLabel			= UILabel()			// other label
		let otherNameTF			= UITextField()		// other name
		let otherTF				= UITextField()		// other

		contactInfoListView.backgroundColor = UIColor.yellow

		// LINE ID
		lineIdLabel.text = "LINE ID"
		lineIdLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(lineIdLabel)
		lineIdLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(10)
		}
		lineIdTF.keyboardType = .alphabet
		lineIdTF.returnKeyType = .done
		lineIdTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(lineIdTF)
		lineIdTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.right).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(5)
		}

		// e-mail address
		emailAddressLabel.text = "e-mail address"
		emailAddressLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(emailAddressLabel)
		emailAddressLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(50)
		}
		emailAddressTF.keyboardType = .emailAddress
		emailAddressTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(emailAddressTF)
		emailAddressTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.right).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(45)
		}

		// phone number
		phoneNumberLabel.text = "phone number"
		phoneNumberLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(phoneNumberLabel)
		phoneNumberLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(90)
		}
		phoneNumberTF.keyboardType = .phonePad
		phoneNumberTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(phoneNumberTF)
		phoneNumberTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.right).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(85)
		}

		// Instagram ID
		instagramIdLabel.text = "Instagram ID"
		instagramIdLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(instagramIdLabel)
		instagramIdLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(130)
		}
		instagramIdTF.keyboardType = .alphabet
		instagramIdTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(instagramIdTF)
		instagramIdTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.right).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(125)
		}

		// Twitter ID
		twitterIdLabel.text = "Twitter ID"
		twitterIdLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(twitterIdLabel)
		twitterIdLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(170)
		}
		twitterIdTF.keyboardType = .alphabet
		twitterIdTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(twitterIdTF)
		twitterIdTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.right).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(165)
		}

		// other
		otherLabel.text = "other(               )"
		otherLabel.textColor = UIColor.purple
		contactInfoListView.addSubview(otherLabel)
		otherLabel.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(210)
		}
		otherNameTF.keyboardType = .default
		otherNameTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(otherNameTF)
		otherNameTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(60)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(120)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(205)
		}
		otherTF.keyboardType = .default
		otherTF.borderStyle = .roundedRect
		contactInfoListView.addSubview(otherTF)
		otherTF.snp.makeConstraints { (make) in
			make.left.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.left).inset(140)
			make.right.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.right).inset(10)
			make.top.equalTo(contactInfoListView.safeAreaLayoutGuide.snp.top).inset(205)
		}

		return contactInfoListView
	}

	/// backBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func backBtnDidTap(_ sender: UIButton) {
		// 現在の画面を破棄
		self.dismiss(animated: true, completion: nil)
	}

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		if(self.nicknameTF.text!.count<1){
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "ニックネームが未入力です。", preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}else if(self.pinCodeTF.text!.count<1 || self.pinCodeTF.text!.count>6){
			let alert: UIAlertController = UIAlertController(title: "エラー", message: "暗証番号は1桁以上6桁以下にしてください。", preferredStyle:  UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}else{
			// get values
			nicknameArray[registeredNum] = self.nicknameTF.text!
			sexIndexArray[registeredNum] = self.sexSC.selectedSegmentIndex
			pinCodeArray[registeredNum] = self.pinCodeTF.text!

			// registered number count up
			registeredNum += 1;
			
			if(registeredNum == joinNumSum){
				
			}else{
				let memberRegisterFinViewController = MemberRegisterFinishViewController()
				memberRegisterFinViewController.modalPresentationStyle = .fullScreen
				self.present(memberRegisterFinViewController, animated: true)
			}
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
		UIApplication.shared.keyWindow?.endEditing(true)	//iOS13.0以降のみ
	}

	/// returnキーが押された時にキーボードを閉じる
	/// - Parameter textField:
	/// - Returns: (boolean)
	/// - Authors: Nozomi Koyama
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// キーボードを閉じる
		textField.resignFirstResponder()
		UIApplication.shared.keyWindow?.endEditing(true)	//iOS13.0以降のみ
		return true
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		// Notificationの発行
		self.configureObserver()
	}

	/// notificationを設定
	/// - Authors: Nozomi Koyama
	func configureObserver() {
		let notification = NotificationCenter.default

		notification.addObserver(
			self,
			selector: #selector(self.keyboardWillShow(notification:)),
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)

		notification.addObserver(
			self,
			selector: #selector(self.keyboardWillHide(notification:)),
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
	}

	/// notificationを削除
	func removeObserver() {
		NotificationCenter.default.removeObserver(self)
	}

	/// キーボードが現れた時にviewをずらす
	@objc func keyboardWillShow(notification: Notification?) {
		let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
		let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
		UIView.animate(withDuration: duration!) {
			self.view.transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
		}
	}

	/// キーボードが消えた時にviewを戻す
	@objc func keyboardWillHide(notification: Notification?) {
		let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
		UIView.animate(withDuration: duration!) {
			self.view.transform = CGAffineTransform.identity
		}
	}
}
