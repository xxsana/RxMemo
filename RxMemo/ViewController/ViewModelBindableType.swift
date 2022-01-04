//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by Haru on 2022/01/04.
//

import UIKit

protocol ViewModelBinableType {
    // 뷰모델의 타입은 뷰컨마다 달라지므로 프로토콜을 제네릭으로 선언
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBinableType where Self: UIViewController {
    // VC에 추가된 VM속성의 실제 VM을 저장,
    // BindViewModel 메소드를 자동으로 호출하는 메소드 구현
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
