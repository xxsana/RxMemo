//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by Haru on 2022/01/04.
//

import Foundation
import RxSwift

// 메모리에 메모를 저장하는 클래스

// 배열을 변경한 다음 서브젝트에서 새로운 넥스트 이벤트를 방출하는 패턴이
// 테이블뷰와 바인딩 할 때 새로운 '배열'을 방출해야 정상적으로 업데이트됨. reload안쓸거임
class MemoryStorage: MemoStorageType {
    
    // class 외부에서 배열에 직접 접근할 필요가 없기 때문에 private 선언
    // 배열은 observable을 통해 외부에 공개. 이는 배열의 상태가 업데이트되면 새로운 next event를 방출해야함
    // 그냥 observable이면 이가 불가능해서 subject로 만들어야함 (?)
    // 초기에 더미데이터를 표시하기 위해 subject 중 BehaviorSubject로 함
    private var list = [
        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    // class 외부에서 subject에 접근하기 위한 함수
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(updated)
    }
    
    // list배열에서 memo를 삭제, subject에서 새로운 next event를 방출
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo}) {
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    
}
