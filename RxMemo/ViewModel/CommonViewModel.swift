//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by Haru on 2022/01/09.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
    // nav item에 쉽게 바인딩 하기 위함
    let title: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorageType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
