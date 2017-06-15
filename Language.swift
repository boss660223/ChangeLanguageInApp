//
//  Language.swift
//  ChangeLanguageInAppDemo
//
//  Created by Ray on 2017/6/15.
//  Copyright © 2017年 Ray. All rights reserved.
//

import UIKit

class Language: NSObject {
    static let share = Language()
    
    private let languageKey: String = "AppleLanguages"
    private let def = UserDefaults.standard
    
    var appLanguage: String {
        guard let app = self.def.array(forKey: self.languageKey) else {
            return ""
        }
        return app.first as! String
    }
    
    func setLanguage(_ lag: String) {
        self.def.setValue([lag], forKey: self.languageKey)
        self.def.synchronize()
    }
    
    class func getString(_ key: String) -> String {
        
        guard let path = Bundle.main.path(forResource: Language.share.appLanguage, ofType: "lproj"), let bundle = Bundle(path: path) else {
            // 回傳基本文件資料
            guard let path = Bundle.main.path(forResource: "Base", ofType: "lproj"), let bundle = Bundle(path: path) else {
                return ""
            }
            return bundle.localizedString(forKey: key, value: nil, table: nil)
        }
        
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }
}
