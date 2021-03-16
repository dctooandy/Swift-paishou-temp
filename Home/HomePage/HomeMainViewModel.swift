//
//  HomeMainViewModel.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/24.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeMainViewModel: BaseViewModel {

    private var fetchTaskSuccess = PublishSubject<UserBonusDto>()
 
    override init() {
        super.init()
        bind()
    }
    private var _categoryArray: [LiveclassDto] = []
    var categoryArray:[LiveclassDto]  {
        set{
            self._categoryArray = newValue
        }
        get{
            if self._categoryArray.count < 1
               {
                self._categoryArray.append(LiveclassDto(id: JSONValue.int(100), name: "分類".LocalizedString, thumb: "", des: "", orderno: "",vcStr: "PSHotLiveVC"))
                self._categoryArray.append(LiveclassDto(id: JSONValue.int(101), name: "熱門".LocalizedString, thumb: "", des: "", orderno: "",vcStr: "PSHotLiveVC"))
                self._categoryArray.append(LiveclassDto(id: JSONValue.int(102), name: "最新".LocalizedString, thumb: "", des: "", orderno: "",vcStr: "PSHotLiveVC"))
               }
            return self._categoryArray
        }
        
        
    }
    private func bind() {
//        guard let liveClass = HomeConfigInfoDto.share?.info?.first?.liveclass else { return }
//        for i in 0...liveClass.count - 1 {
//            menus.append(liveClass[i].name ?? "")
//        }
        UserStatus.share.rxFetchDailyTaskSuccess().subscribeSuccess { [weak self] (dto) in
            self?.fetchTaskSuccess.onNext(dto)
        }.disposed(by: disposeBag)
    }
    
    func fetchHomeMainVCDailyTask() {
        UserStatus.share.fetchUserInfoDailyTask()        
    }
    
    func rxFetchTaskSuccess() -> Observable<UserBonusDto> {
        return fetchTaskSuccess.asObserver()
    }
    
}
