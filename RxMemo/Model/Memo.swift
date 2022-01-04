//
//  Memo.swift
//  RxMemo
//
//  Created by Haru on 2022/01/04.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var insertDate: Date    //생성날짜
    var identity: String    //메모 구분시 사용
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        //identity는 date의 time interval값을 String으로
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    // update된 메모 내용으로 새로운 instance 생성시 사용 
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
