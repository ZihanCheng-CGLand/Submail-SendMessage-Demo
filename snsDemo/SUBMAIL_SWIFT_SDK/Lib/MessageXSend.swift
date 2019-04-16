//
//  MessageXSend.swift
//  Submail
//
//  Created by jins on 14/11/24.
//  Copyright (c) 2014年 jin.shang. All rights reserved.
//

import Foundation
import AFNetworking

class MessageXSend {
    var to = [String]()
    var addressbook = [String]()
    var project: String = ""
    var vars = [String: String]()
    
    var config: MessageConfig
    
    var params = [String: AnyObject]()
    
    init(config: MessageConfig) {
        self.config = config
    }
    
    // set message cellphone number
    func add_to(address: String) {
        self.to.append(address)
    }
    
    // set addressbook sign to array
    func add_addressbook(addressbook: String) {
        self.addressbook.append(addressbook)
    }
    
    // set project
    func set_project(project: String) {
        self.project = project
    }
    
    // set var to array
    func add_var(key: String, _ val: String) {
        self.vars[key] = val
    }
    
    // build request params
    func build_params() -> [String: AnyObject] {
        var params = [String: AnyObject]()
        if self.to.count > 0 {
            var toValue = ""
            for toItem in self.to {
                toValue += toItem + ","
            }
            
            let requestIndex = toValue.index(toValue.startIndex, offsetBy: toValue.count-1)
            params["to"] = toValue[..<requestIndex] as AnyObject
        }
        
        if self.addressbook.count > 0 {
            var addressbookValue = ""
            for addressbookItem in self.addressbook {
                addressbookValue += addressbookItem + ","
            }
            
            let requestIndex = addressbookValue.index(addressbookValue.startIndex, offsetBy: addressbookValue.count-1)
            params["addressbook"] = addressbookValue[..<requestIndex] as AnyObject
        }

        params["project"] = self.project as AnyObject
        
        if self.vars.count > 0 {
            let jsonData = try? JSONSerialization.data(withJSONObject: self.vars, options: [])
            if let data = jsonData {
                params["vars"] = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            }
        }
        
        return params
    }
    
    func xsend(completion: ((AnyObject?) -> Void)? = nil) {
        let message = Message(config: self.config)
        message.xsend(params: build_params()) {
            json in
            if completion != nil {
                completion!(json as AnyObject)
            }
        }
    }
}
