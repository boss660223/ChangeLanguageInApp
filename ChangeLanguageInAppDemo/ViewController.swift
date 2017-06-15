//
//  ViewController.swift
//  ChangeLanguageInAppDemo
//
//  Created by Ray on 2017/6/15.
//  Copyright © 2017年 Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func changeBtn(_ sender: UIButton) {
        
        if Language.share.appLanguage.contains("en") {
            Language.share.setLanguage("zh-Hant")
        } else {
            Language.share.setLanguage("en")
        }
        NotificationCenter.default.post(name: NSNotification.Name("LanguageChanged"), object: nil)
    }
    @IBOutlet weak var showLable: UILabel!
    
    @objc private func getSetLanguage() {
        self.showLable.text = Language.getString("Good_Morning")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.getSetLanguage()
        /// 註冊通知
        NotificationCenter.default.addObserver(self, selector: #selector(getSetLanguage), name: NSNotification.Name("LanguageChanged"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

