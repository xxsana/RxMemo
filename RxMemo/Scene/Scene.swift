//
//  Scene.swift
//  RxMemo
//
//  Created by Haru on 2022/01/09.
//

import UIKit

// 앱에서 구현할 씬들 with 연관값
enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    // storyboard에 있는 씬 생성, 연관값에 저장된 뷰모델을 바인딩해서 리턴하는 뷰모델
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            // 메모목록 씬 생성 후 뷰모델을 바인딩해 리턴
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav")
                    as? UINavigationController else {
                fatalError()
            }
            
            guard var listVC = nav.viewControllers.first
                    as? MemoListViewController else {
                fatalError()
            }
            
            listVC.bind(viewModel: viewModel)
            return nav
            
        case .detail(let viewModel):
            guard var detailVC =
                    storyboard.instantiateViewController(withIdentifier: "DetailVC")
                    as? MemoDetailViewController else {
                    fatalError()
                }
                
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav")
                    as? UINavigationController else {
                fatalError()
            }
            
            guard var composeVC = nav.viewControllers.first
                    as? MemoComposeViewController else {
                fatalError()
            }
            
            composeVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
