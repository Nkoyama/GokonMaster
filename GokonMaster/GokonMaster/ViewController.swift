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
		self.button.setTitle("Next", for: .normal)
		self.button.addTarget(self, action: #selector(self.buttonDidTap(_:)), for: .touchUpInside)
		
	}
	
	// start button action
	@objc func buttonDidTap(_ sender: UIButton) {
	}
}
