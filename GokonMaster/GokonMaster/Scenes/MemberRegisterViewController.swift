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

	let SCREEN_SIZE			= UIScreen.main.bounds.size

	// contactInfoScrollV内
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


	// MARK: Life Cycle
	override func viewDidLoad() {
		// background color
		self.view.backgroundColor = UIColor.white

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
		self.contactInfoScrollV.backgroundColor = UIColor.yellow
		self.contactInfoScrollV.layer.borderWidth = 1.0
		self.contactInfoScrollV.contentSize = CGSize(width: self.view.frame.width-100, height: 245)
		self.contactInfoScrollV.delegate = self
		self.view.addSubview(self.contactInfoScrollV)
		self.contactInfoScrollV.frame.origin.y		= 570
		self.contactInfoScrollV.frame.origin.x		= 50
		self.contactInfoScrollV.frame.size.height	= SCREEN_SIZE.height - 700
		self.contactInfoScrollV.frame.size.width	= SCREEN_SIZE.width - 100
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

		// 通知イベントUIKeyboardWillShowをオブザーバー登録
		NotificationCenter.default.addObserver(self,
							selector: #selector(self.keyboardWillShow(_:)),
							name: UIResponder.keyboardWillChangeFrameNotification,
							object: nil)
		// 通知イベントUIKeyboardWillHideをオブザーバー登録
		NotificationCenter.default.addObserver(self,
							selector: #selector(self.keyboardWillHide(_:)),
							name: UIResponder.keyboardWillHideNotification,
							object: nil)

		return contactInfoListView
	}

	/// nextBtn action
	/// - Parameter sender: UIButton
	/// - Authors: Nozomi Koyama
	@objc func nextBtnDidTap(_ sender: UIButton) {
		// 男女の人数をカウント
		if(sexIndexArray[registeredNum] != 1) {
			sexIndexArray[registeredNum] = 0
		}
		var maleSelectedCount = 0
		var femaleSelectedCount = 0
		for sexIndex in sexIndexArray {
			if(sexIndex == 0) {
				maleSelectedCount += 1
			} else if(sexIndex == 1) {
				femaleSelectedCount += 1
			}
		}
		// 参加人数を超えていた場合にエラーメッセージ表示
		if(maleSelectedCount>maleNum) {
			let alert: UIAlertController = UIAlertController(title: "エラー",
													 message: "男性は全員登録済みです。",
													 preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		} else if(femaleSelectedCount>femaleNum) {
			let alert: UIAlertController = UIAlertController(title: "エラー",
													 message: "女性は全員登録済みです。",
													 preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}

		if(self.nicknameTF.text!.count<1){
			let alert: UIAlertController = UIAlertController(title: "エラー",
														message: "ニックネームが未入力です。",
														preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}else if(self.pinCodeTF.text!.count<1 || self.pinCodeTF.text!.count>6){
			let alert: UIAlertController = UIAlertController(title: "エラー",
														message: "暗証番号は1桁以上6桁以下にしてください。",
														preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}else if(self.lineIdTF.text!.count<1
			&& self.emailAddressTF.text!.count<1
			&& self.phoneNumberTF.text!.count<1
			&& self.instagramIdTF.text!.count<1
			&& self.twitterIdTF.text!.count<1
			&& self.otherTF.text!.count<1){
		}else if((self.otherNameTF.text!.count<1 && self.otherTF.text!.count>0)
				|| (self.otherNameTF.text!.count>0 && self.otherTF.text!.count<1)){
			let alert: UIAlertController = UIAlertController(title: "エラー",
														message: "otherの情報が不完全です。",
														preferredStyle: UIAlertController.Style.alert)
			alert.addAction(defaultAction)
			present(alert, animated: true, completion: nil)
		}else{
			// get values
			memberData[registeredNum].nickname		= self.nicknameTF.text!
			memberData[registeredNum].pinCode		= self.pinCodeTF.text!
			memberData[registeredNum].lineId		= self.lineIdTF.text!
			memberData[registeredNum].emailAddress	= self.emailAddressTF.text!
			memberData[registeredNum].phoneNumber	= self.phoneNumberTF.text!
			memberData[registeredNum].instagramId	= self.instagramIdTF.text!
			memberData[registeredNum].twitterId		= self.twitterIdTF.text!
			memberData[registeredNum].otherName		= self.otherNameTF.text!
			memberData[registeredNum].other			= self.otherTF.text!
//			nicknameArray[registeredNum]				= self.nicknameTF.text!
//			pinCodeArray[registeredNum]					= self.pinCodeTF.text!
//			lineIdArray[registeredNum]					= self.lineIdTF.text!
//			emailAddressArray[registeredNum]			= self.emailAddressTF.text!
//			phoneNumberArray[registeredNum]				= self.phoneNumberTF.text!
//			instagramIdArray[registeredNum]				= self.instagramIdTF.text!
//			twitterIdArray[registeredNum]				= self.twitterIdTF.text!
//			contactInfoOtherNameArray[registeredNum]	= self.otherNameTF.text!
//			contactInfoOtherArray[registeredNum]		= self.otherTF.text!

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
		UIApplication.shared.keyWindow?.endEditing(true)	//iOS13.0以降のみ
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
		UIApplication.shared.keyWindow?.endEditing(true)	//iOS13.0以降のみ
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

	/// キーボードが現れた時にviewをずらす
	@objc func keyboardWillShow(_ notification: NSNotification) {
		keyboardHeight = Double((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.height)
		// contactInfoScrollV内のTextFieldが選択された場合のみずらす
		if(editingTextFieldName != "ignore"){
			self.contactInfoScrollV.frame.origin.y = SCREEN_SIZE.height - CGFloat(keyboardHeight) - self.contactInfoScrollV.frame.height
		}
	}

	/// キーボードが消えた時にviewを戻す
	@objc func keyboardWillHide(_ notification: NSNotification) {
		if(editingTextFieldName != "ignore"){
			self.contactInfoScrollV.frame.origin.y = 570
		}
		// 選択されているTextField名をクリア
		initEditingTextFieldName()
		initKeyboardHeight()
	}
}
