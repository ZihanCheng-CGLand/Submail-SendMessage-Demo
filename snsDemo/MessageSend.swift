//
//  MessageSend.swift
//  messageDemo
//
//  Created by cgland on 2019/4/11.
//  Copyright © 2019年 cgland. All rights reserved.
//

import Foundation

public class MessageXSendDemo {
    public class func demo() {
        let submail = MessageXSend(config: MessageConfig())
        submail.add_to(address: "xxx")
        submail.set_project(project: "xxx")
        submail.add_var(key: "code", "xxx")
        submail.add_var(key: "time", "xxx")
        submail.xsend()
    }
}
