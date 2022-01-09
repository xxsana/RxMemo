//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Haru on 2022/01/04.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    // 의존성을 주입하는 생성자와 바인딩에 사용하는 속성,메소드가 추가
    // 뷰모델은 화면전환과 메모전환을 모두 처리하는데 구현한 씬코디네이터와 메모스토리지를 사용함
    // 그래서 뷰모델을 생성하는 시점에 생성자를 통해 의존성 주입 필요. 나머지도 마찬가지
    
    // table view와 바인딩 할수 있는 속성 추가
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
