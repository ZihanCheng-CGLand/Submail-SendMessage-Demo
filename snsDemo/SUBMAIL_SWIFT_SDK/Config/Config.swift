//
//  Config.swift
//  Submail
//
//  Created by jin.shang on 14-11-23.
//  Copyright (c) 2014年 jin.shang. All rights reserved.
//

import Foundation

// Mail Config
let mail_appid = "your_mail_app_id"

let mail_appkey = "your_mail_app_key"

let mail_sign_type = "normal"


// Message Config
let message_appid = "xxx"

let message_appkey = "xxx"

let message_sign_type = "normal"



class MailConfig {
    var params = [ String: Any ]()
    init() {
        params["appid"] = mail_appid
        params["appkey"] = mail_appkey
        params["sign_type"] = mail_sign_type
    }
}

class MessageConfig {
    var params = [String: Any]()
    init() {
        params["appid"] = message_appid
        params["appkey"] = message_appkey
        params["sign_type"] = message_sign_type
    }
}
