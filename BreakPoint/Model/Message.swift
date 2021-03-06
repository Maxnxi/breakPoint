//
//  Message.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 26.11.2020.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId : String {
        return _senderId
    }
    
    init(content:String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
}
