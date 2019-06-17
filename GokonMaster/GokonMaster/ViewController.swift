//
//  ViewController.swift
//  GokonMaster
//
//  Created by Nozomi Koyama on 2019/05/01.
//  Copyright © 2019 Nozomi Koyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gokon: UILabel!
    @IBOutlet weak var master: UILabel!
    @IBOutlet weak var gokonStartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ボタンの装飾
        let rgba = UIColor(red: 200/255, green: 200/255, blue: 255/255, alpha: 1.0) // ボタン背景色設定
        gokonStartBtn.backgroundColor = rgba                                               // 背景色
        gokonStartBtn.layer.borderWidth = 0.5                                              // 枠線の幅
        gokonStartBtn.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        gokonStartBtn.layer.cornerRadius = 5.0                                             // 角丸のサイズ
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

