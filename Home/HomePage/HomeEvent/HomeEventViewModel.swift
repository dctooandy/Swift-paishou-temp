//
//  HomeEventViewModel.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2021/1/8.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Toaster
class HomeEventViewModel: BaseViewModel{
    
    private var fetchHomeEventCategorySuccess: PublishRelay<Void> = PublishRelay()
    private var fetchHomeEventTopSuccess: PublishRelay<HomeEventItemDto> = PublishRelay()
    private var fetchHomeEventListSuccess: PublishRelay<Void> = PublishRelay()
    private var fetchFirstHomeEventListSuccess: PublishRelay<Void> = PublishRelay()
    var categoryList: [HomeEventCategoryListDto] = []
    var eventList: [HomeEventItemDto] = []
    var topImageViewData: HomeEventItemDto?
    
    func fetchHomeEventCategory(){
        LoadingViewController.show()
        Beans.homeServer.fetchHomeEventCategory().subscribeSuccess { [weak self](dto) in
            if let topDto = dto?.top{
                self?.topImageViewData = topDto
                self?.fetchHomeEventTopSuccess.accept(topDto)
            }
            if let listDto = dto?.list{
                self?.categoryList = listDto
            }else{
                self?.categoryList = []
            }
            self?.fetchHomeEventCategorySuccess.accept(())
        }.disposed(by: disposeBag)
    }
    
    func fetchHomeEventList(cid: Int){
        LoadingViewController.show()
        
        Beans.homeServer.fetchHomeEventList(cid: cid).subscribeSuccess { [weak self](dto) in
            if let listDto = dto?.list{
                if let name = self?.categoryList.filter({$0.id?.intValue == cid}).first?.title
                {
                    Beans.matomoServer.track(eventWithCategory: MCategory.ActivityArea.rawValue,
                                             action: MAction.checkCategory.rawValue,
                                             name: name,
                                             value: Float(cid))
                }
                self?.eventList = listDto
            }else{
                self?.eventList = []
            }
            self?.fetchHomeEventListSuccess.accept(())
        }.disposed(by: disposeBag)
    }
    func fetchFirstHomeEventList(cid: Int = 0){
        //LoadingViewController.show()
        Beans.homeServer.fetchHomeEventList(cid: cid).subscribeSuccess { [weak self](dto) in
            if let listDto = dto?.list{
                self?.eventList = listDto
            }else{
                self?.eventList = []
            }
            self?.fetchFirstHomeEventListSuccess.accept(())
        }.disposed(by: disposeBag)
    }
}
extension HomeEventViewModel{
    func rxFetchHomeEventCategorySuccess() -> Observable<Void>{
        return self.fetchHomeEventCategorySuccess.asObservable()
    }
    func rxFetchHomeEventTopSuccess() -> Observable<HomeEventItemDto>{
        return self.fetchHomeEventTopSuccess.asObservable()
    }
    func rxFetchHomeEventListSuccess() -> Observable<Void>{
        return self.fetchHomeEventListSuccess.asObservable()
    }
    func rxFetchFirstHomeEventListSuccess() -> Observable<Void>{
        return self.fetchFirstHomeEventListSuccess.asObservable()
    }
}
