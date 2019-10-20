//
//  ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2019/05/01.
//  Copyright © 2019 Nozomi Koyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var gokonStartBtn: UIButton!         //初期画面スタートボタン
    @IBOutlet weak var maleNumTF: UITextField!          //男人数入力欄
    var maleNumPickerView: UIPickerView = UIPickerView()
    @IBOutlet weak var femaleNumTF: UITextField!        //女人数入力欄
    var femaleNumPickerView: UIPickerView = UIPickerView()
    @IBOutlet weak var totalNum: UILabel!               //合計参加者数(ラベル)
    @IBOutlet weak var tabelTypeSelect: UISegmentedControl! //テーブルタイプ選択
    
    // 人数選択肢
    let numList = ["0", "1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*---------- 男性人数選択pickerView ----------*/
        maleNumPickerView.frame = CGRect(x: 0, y: 0,
                                         width: UIScreen.main.bounds.size.width,
                                         height: maleNumPickerView.bounds.size.height)
        maleNumPickerView.tag = 1
        maleNumPickerView.delegate = self
        maleNumPickerView.dataSource = self
//        maleNumPickerView.showsSelectionIndicator = true
        
        //
        let v1 = UIView(frame: maleNumPickerView.bounds)
        v1.backgroundColor = UIColor.white
        v1.addSubview(maleNumPickerView)
        if maleNumTF != nil {
            totalNum.text = "0"
            maleNumTF.text = "0"
            maleNumTF.inputView = v1
            //delegateを適用
            maleNumTF.delegate = self
        }

        /*---------- 女性人数選択pickerView ----------*/
        femaleNumPickerView.frame = CGRect(x: 0, y: 0,
                                         width: UIScreen.main.bounds.size.width,
                                         height: femaleNumPickerView.bounds.size.height)
        femaleNumPickerView.tag = 2
        femaleNumPickerView.delegate = self
        femaleNumPickerView.dataSource = self
//        femaleNumPickerView.showsSelectionIndicator = true

        //
        let v2 = UIView(frame: femaleNumPickerView.bounds)
        v2.backgroundColor = UIColor.white
        v2.addSubview(femaleNumPickerView)
        if femaleNumTF != nil {
            totalNum.text = "0"
            femaleNumTF.text = "0"
            femaleNumTF.inputView = v2
            //delegateを適用
            femaleNumTF.delegate = self
        }

    }
    
    // UIPickerViewの数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの要素の全数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return numList.count
        case 2:
            return numList.count
        default:
            return NSNotFound
        }
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return numList[row]
        case 2:
            return numList[row]
        default:
            return ""
        }
    }

    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.maleNumTF.text = numList[row]
        case 2:
            self.femaleNumTF.text = numList[row]
        default:
            break
        }
        // 合計人数に反映
        calcTotalNum(maleNum: maleNumTF.text ?? "0", femaleNum: femaleNumTF.text ?? "0")
    }

    // 合計参加者数を計算し、出力
    func calcTotalNum(maleNum: String, femaleNum: String) {
        totalNum.text = String((Int(maleNum) ?? 0) + (Int(femaleNum) ?? 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TextField以外の部分をタッチした場合に呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //returnキーが押された時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }

}

func textFieldDidEndEditing(_ textField: UITextField) ->Bool {
    print(#function)
    return true
}


private var maxLengths = [UITextField: Int]()

extension UITextField {
    //UITextFieldの max length を指定できるようにする
    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            addTarget(self, action: #selector(limitLength), for: .editingChanged)
        }
    }
    @objc func limitLength(textField: UITextField) {
        guard let prospectiveText = textField.text, prospectiveText.count > maxLength else {
            return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        
        #if swift(>=4.0)
        text = String(prospectiveText[..<maxCharIndex])
        #else
        text = prospectiveText.substring(to: maxCharIndex)
        #endif
        
        selectedTextRange = selection
    }
}
