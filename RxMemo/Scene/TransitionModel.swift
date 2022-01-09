//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Haru on 2022/01/09.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

// 화면전환시 문제 발생하면
enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
