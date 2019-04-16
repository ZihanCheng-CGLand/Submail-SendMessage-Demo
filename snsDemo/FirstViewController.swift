//
//  FirstViewController.swift
//  snsDemo
//
//  Created by cgland on 2019/4/15.
//  Copyright © 2019年 cgland. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tapButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        MessageXSendDemo.demo()
    }
    
}

