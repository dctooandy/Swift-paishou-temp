//
//  PSTabBarViewModel.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/27.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import Foundation
import RxCocoa
import RxSwift

class PSTabBarViewModel: BaseViewModel {
    var limitTaskListData: [TaskLimitListDto] = []
    private var fetchLimitiedActivitySuccess = PublishSubject<[TaskLimitListDto]>()
    
    override init() {
        super.init()
        self.bind()
    }
    func bind() {
        TaskLimitDto.rxShare.subscribeSuccess { [weak self](dto) in
            if let limitListDto = dto?.list{
                self?.limitTaskListData = limitListDto.sorted(by: { (d1, d2) -> Bool in
                    d1.start_time! < d2.start_time!
                })
                if let limitNeedToDisplayArr = self?.limitTaskListData.filter({
                    $0.status == 0 || $0.status == 1
                }){
                    self?.limitTaskListData = limitNeedToDisplayArr
                }
                self?.fetchLimitiedActivitySuccess.onNext(self!.limitTaskListData)
            }else
            {
                Log.v("資料異常")
            }
            
        }.disposed(by: disposeBag)
    }
    func fetchLimitedActivityListData(){
//        TaskLimitDto.rxShare.subscribeSuccess { [weak self](dto) in
//            if let limitListDto = dto?.list{
//                self?.limitTaskListData = limitListDto.sorted(by: { (d1, d2) -> Bool in
//                    d1.start_time! < d2.start_time!
//                })
//                if let limitNeedToDisplayArr = self?.limitTaskListData.filter({
//                    $0.status == 0 || $0.status == 1
//                }){
//                    self?.limitTaskListData = limitNeedToDisplayArr
//                }
//                self?.fetchLimitiedActivitySuccess.onNext(self!.limitTaskListData)
//            }else
//            {
//                Log.v("資料異常")
//            }
//
//        }.disposed(by: disposeBag)
        Beans.userServer.fetchTaskLimitList().subscribeSuccess { [weak self](dto) in
            if let limitListDto = dto?.list{
                self?.limitTaskListData = limitListDto.sorted(by: { (d1, d2) -> Bool in
                    d1.start_time! < d2.start_time!
                })
                if let limitNeedToDisplayArr = self?.limitTaskListData.filter({
                    $0.status == 0 || $0.status == 1
                }){
                    self?.limitTaskListData = limitNeedToDisplayArr
                }
                self?.fetchLimitiedActivitySuccess.onNext(self!.limitTaskListData)
            }else
            {
                Log.v("資料異常")
            }
        }.disposed(by: disposeBag)
    }

    
    func rxFetchLimitiedActivitySuccess() -> Observable<[TaskLimitListDto]> {
        return fetchLimitiedActivitySuccess.asObserver()
    }

}
