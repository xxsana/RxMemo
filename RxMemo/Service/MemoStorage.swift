//
//  MemoStorage.swift
//  RxMemo
//
//  Created by Haru on 2022/01/04.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    // 리턴값을 Observable로 함으로써
    // 구독자가 작업 결과물을 원하는 방식으로 처리할 수 있게 됨
    @discardableResult  // return값 필요없을 때
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
