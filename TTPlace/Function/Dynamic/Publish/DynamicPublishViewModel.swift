//
//  DynamicPublishViewModel.swift
//  TTPlace
//
//  Created by Mr.hong on 2021/6/24.
//  Copyright © 2021 Mr.hong. All rights reserved.
//

import Foundation

struct User: HandyJSON {
    
}

class DynamicPublishViewModel: ViewModel,ViewModelType {
    
    struct Input {
        let publishTrigger: Driver<()>
        // 照片变更
//        let photoChange: Observable<[TTAddPhotoBannerModel]>
        
//        let pulish: Observable<()>
    }
    
    struct Output {
        
        let items: BehaviorRelay<[DynamicSection]>
        
        // 照片变更
//        let photoChange: Driver<[TTAddPhotoBannerModel]>
        
        // 文章标题变更
        let articleTitleChange:  Driver<String>
    
        
        let publishComplete: Driver<User>
    }
    
    // 转化
    func transform(input: Input) -> Output {
        let title = BehaviorRelay<String>(value: "")
        var items: [DynamicSection] = []
//        let elements = BehaviorRelay<[DynamicSection]>(value: [])
//        Observalble -> Driver<NetData> -> Driver<User> -> bind.text
            
        
//<<<<<<< HEAD
//=======
//        // 点击按钮，处理事件，然后把sigle传出去
//        let sendEvent = input.publishTrigger.asObservable().flatMapLatest{ () -> Observable<()> in
//
////            return provider.rx.request(.publishArticle(content: "123")).filterSuccessfulStatusCodes().subscribe { (response) in
////
////            } onError: { (error) in
////
////            }.disposed(by: rx.disposeBag)
//
//        }.asDriver(onErrorJustReturn: ())
//>>>>>>> 1c3282be4d579c0dbe8c585ec8c176fd6477a1dd
        
        
        // 点击按钮，处理事件，然后把sigle传出去
        let sendEvent = input.publishTrigger.asObservable().flatMapLatest{ () -> Observable<User> in
            return TTNet.requst(type:.get,api: "\"").mapModel(User.self).asObservable()
        }.asDriver(onErrorJustReturn: (User()))
        
        
        let a = provider.request(.publishArticle(content: ""))
    
        
        let editTitleViewModel = DynamicPublishEditContentCellViewModel(with: "我是编辑昵称")
        items += [
            DynamicSection.setting(title: "", items: [DynamicSectionItem.editTitle(viewModel: editTitleViewModel)])
        ]
        
        return Output.init(items: BehaviorRelay.init(value: items),articleTitleChange: title.asDriver(),publishComplete: sendEvent)
    }
    
    
    
    
//    func publishRequest() -> Single<()> {
//        return Single<()>.create {(single) -> Disposable in
//            TTNet.requst(type:.post,api: "/", parameters: ["" : ""]).subscribe {[weak self] (model) in
//                single(.success(()))
//            } onError: { (error) in
//                single(.error(TTNetError("")))
//            }.disposed(by: DisposeBag())
//            return Disposables.create {}
//        }.observeOn(MainScheduler.instance)
//    }
    
}
