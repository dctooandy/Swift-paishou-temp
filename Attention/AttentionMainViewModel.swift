//
//  AttentionMainViewModel.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/4.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class AttentionMainViewModel: BaseViewModel {
    var fetchAttentPageSuccess = PublishSubject<[Any]>()
    
    var fetchAttentDataSuccess = PublishSubject<AttentListDto?>()
    var fetchFollowDataSuccess = PublishSubject<Void>()
    var fetchFollowDataOnlySuccess = PublishSubject<FollowsListDto>()
    // 1118
    var fetchFollowV2DataSuccess = PublishSubject<FollowsListDto?>()
    private var setAttentSuccess = PublishSubject<AttentAnchorDto>()
    private var attentListData : AttentListDto?
    private var followsListData : FollowsListDto?
    private var followsV2ListData : FollowsListDto?
    
    func fetchAttentPageData()
    {
        Beans.userServer.fetchAttentList().subscribeSuccess { [weak self](dto) in
            Log.v("取得關注列表")
            if let data = dto
            {
                self?.attentListData = data
                self?.fetchAttentDataSuccess.onNext(data)
            }
        }.disposed(by: disposeBag)
        Beans.userServer.fetchFollowsList().subscribeSuccess { [weak self](dto) in
            Log.v("取得Follow列表")
            if let data = dto
            {
                self?.followsListData = data
                self?.fetchFollowDataSuccess.onNext(())
            }
        }.disposed(by: disposeBag)
    }
    func fetchFollowV2ListDataOnly(page:Int)
    {
        Beans.userServer.fetchFollowsV2List(with: page).subscribeSuccess { [weak self](dto) in
            Log.v("取得關注列表")
            if let data = dto
            {
                self?.followsV2ListData = data
                self?.fetchFollowV2DataSuccess.onNext(data)
            }else
            {
                self?.followsV2ListData = FollowsListDto()
                self?.fetchFollowV2DataSuccess.onNext(FollowsListDto())
            }
        }.disposed(by: disposeBag)
    }
    func fetchFollowsListDataOnly(page:Int)
    {
        Beans.userServer.fetchFollowsList(with: page).subscribeSuccess { [weak self](dto) in
            Log.v("取得Follow列表")
            if let data = dto
            {
                self?.followsListData = data
                self?.fetchFollowDataOnlySuccess.onNext(data)
            }
        }.disposed(by: disposeBag)
    }
    func setAttentAnchor(anchorID: String){
        Beans.userServer.setAttentionAnchor(toUid: anchorID).subscribeSuccess { [weak self](dto) in
            guard let data = dto ,
                let status = data.isattent else {return}
            data.liveUID = anchorID
            self?.setAttentSuccess.onNext(data)
        }.disposed(by: disposeBag)
    }
    override init() {
        super.init()
        bind()
    }
    func bind()
    {
        // 綜合
        Observable.zip(fetchAttentDataSuccess,fetchFollowDataSuccess).subscribeSuccess { [weak self](_) in
            if let attentData = self?.attentListData ,let followData = self?.followsListData
            {
                self?.fetchAttentPageSuccess.onNext([attentData,followData])
            }
            
        }.disposed(by: disposeBag)
        //分開
        
    }
    func rxFetchAttentPageSuccess() -> Observable<[Any]>
    {
        return fetchAttentPageSuccess.asObserver()
    }
    func rxFetchAttentDataSuccess() -> Observable<AttentListDto?>
    {
        return fetchAttentDataSuccess.asObserver()
    }
    func rxFetchFollowDataOnlySuccess() -> Observable<FollowsListDto>
    {
        return fetchFollowDataOnlySuccess.asObserver()
    }
    func rxFetchFollowV2DataSuccess() -> Observable<FollowsListDto?>
    {
        return fetchFollowV2DataSuccess.asObserver()
    }
    func rxSetAttentSuccess() -> Observable<AttentAnchorDto>{
        return setAttentSuccess.asObserver()
    }
}
