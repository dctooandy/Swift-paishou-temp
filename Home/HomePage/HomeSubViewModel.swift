//
//  HomeSubViewModel.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/9/3.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Toaster

class HomeSubViewModel: BaseViewModel {
//    var categories: Categories!
    var liveclassDto : LiveclassDto!
    //熱門Banner
    var hotBannerDtos: [HotInfoSlideDto]?
    //全部直播
    var hotLiveDtos: [HotInfoListDto]?
    //熱門主播
    var hotStreamerDtos: [HotnanchourListDto]?
    //類別直播
    var categoryLiveDtos: [ClassLiveInfoDto]! = []
    
    var bullteinListData: [HomeBullteinItemDto] = []
    
    // 1208
    var activityAreaData:[HotInfoSlideDto] = []
    var eventHotListData: [HomeEventHotItemDto] = []
    
    private var fetchHotStreamerDto = PublishSubject<Void>()
    private var fetchCategoryLiveDto = PublishSubject<Void>()
    
    //單一類別刷新直播事件
    private var fetchHotLiveForRefresh = PublishSubject<Void>()
    private var fetchCategoryLiveDtoForRefresh = PublishSubject<Void>()
    // 1014
    // Hot類別
    private var fetchHotDataDtosSuccess = PublishSubject<Void>()
    //
    private var fetchCategoryLiveDtoForNormal = PublishSubject<Void>()
    
    private var fetchEventHotSuccess = PublishSubject<Void>()
    override init() {
        super.init()
        bind()
    }
    
    func bind() {
    }
    
    //MARK: - 單一類別直播
}
extension HomeSubViewModel
{
    func rxFetchHotDataDtosSuccess() -> Observable<Void> {
        return fetchHotDataDtosSuccess.asObserver()
    }
    //MARK: - 單一類別, 分類、熱門
    func rxFetchHotLiveForRefresh() -> Observable<Void> {
        return fetchHotLiveForRefresh.asObserver()
    }
    func rxFetchCategoryLiveDtoForNormal() -> Observable<Void> {
        return fetchCategoryLiveDtoForNormal.asObserver()
    }
    //MARK: - 單一類別, 其他
    func rxFetchCategoryLiveDtoForRefresh() -> Observable<Void> {
        return fetchCategoryLiveDtoForRefresh.asObserver()
    }
    func rxFetchEventHotSuccess() -> Observable<Void>{
        return fetchEventHotSuccess.asObservable()
    }
}
//MARK: - 上下拉刷新
extension HomeSubViewModel {
    //MARK: - 單一類別直播讀取顯示
    func fetchCategoryLiveData(direction: RefreshDirection,id: String = "1") {
        guard let caseInt = liveclassDto.id?.intValue else { return }
        switch caseInt {
        case 100 :
//            fetchHotLiveData()
            getUsersLiveClassWithID(id: "")
        case 101 :
            (direction == .down ? fetchHotData() : fetchHotLiveData())
        case 102 :
            fetchNewestData()
        default:
            getUsersLiveClassWithID(id: id)
        }
    }
}
extension HomeSubViewModel{
    // Banner / 直播主 / Live
    private func fetchHotData() {
        Observable.zip(
            Beans.homeServer.getSlide().asObservable(),
            Beans.homeServer.getHotnanchour().asObservable(),
            Beans.homeServer.getHotLive().asObservable(),
//            Beans.homeServer.getHomeBultein().asObservable()
            Beans.homeServer.getSlide(slideCid: "5").asObservable()
        )
            .subscribe(onNext: {  [weak self] (
                dto1,
                dto2,
                dto3,
                dto4
//                dto4
                )  in
                if let data1 = dto1?.list {
                    self?.hotBannerDtos = data1
                }
                if let data2 = dto2?.list {
                    self?.hotStreamerDtos = data2
                }
                if let data3 = dto3?.list {
                    self?.hotLiveDtos = data3
                }
                if let data4 = dto4?.list {
                    self?.activityAreaData = data4
                }
//                if let data4 = dto4?.list{
//                    self?.bullteinListData = data4
//                }
//                self?.fetchHotDataDtosSuccess.onNext(())
                self?.getBulltein()
                }, onError: { (Error) in
                    self.hotBannerDtos = [HotInfoSlideDto()]
                    self.hotStreamerDtos = [HotnanchourListDto()]
                    self.hotLiveDtos = [HotInfoListDto()]
                    self.bullteinListData = []
                    self.activityAreaData = []
                    self.fetchHotDataDtosSuccess.onNext(())
            }).disposed(by: disposeBag)
    }
    private func fetchHotLiveData()
    {
        Beans.homeServer.getHotLive().subscribe(onSuccess: { [weak self] (dto) in
            guard let self = self else { return }
            if let info = dto?.list {
                self.hotLiveDtos = info
            }
            self.fetchHotLiveForRefresh.onNext(())
        }) { [weak self] (error) in
            self?.hotLiveDtos = [HotInfoListDto()]
            self?.fetchHotLiveForRefresh.onNext(())
        }.disposed(by: disposeBag)
    }
    private func fetchNewestData()
    {
      Beans.homeServer.getNewLive().subscribe(onSuccess: { [weak self] (dto) in
          if let data = dto?.list {
              self?.categoryLiveDtos = data
          }
          self?.fetchCategoryLiveDtoForRefresh.onNext(())
      }) { [weak self] (error) in
          self?.categoryLiveDtos = [ClassLiveInfoDto()]
          self?.fetchCategoryLiveDtoForRefresh.onNext(())
      }.disposed(by: disposeBag)
    }
    private func getUsersLiveClassWithID(id:String)
    {
        Beans.homeServer.getUsersLiveClass(withLiveclassID: id).subscribe(onSuccess: { [weak self] (dto) in
            guard let self = self else { return }
            if let data = dto?.list {
                self.categoryLiveDtos = data
            }
            self.fetchCategoryLiveDtoForRefresh.onNext(())
        }) { [weak self] (error) in
            self?.categoryLiveDtos = [ClassLiveInfoDto()]
            self?.fetchCategoryLiveDtoForRefresh.onNext(())
        }.disposed(by: disposeBag)
    }
    //取得首頁公告
    func getBulltein(){
        Beans.homeServer.getHomeBultein().subscribe(onSuccess: {  [weak self](dto) in
            Log.v("取得首頁公告")
            if let data4 = dto?.list{
                self?.bullteinListData = data4
            }
            self?.fetchHotDataDtosSuccess.onNext(())
        }, onError: { [weak self](error) in
            self?.bullteinListData = []
            self?.fetchHotDataDtosSuccess.onNext(())
        }).disposed(by: disposeBag)
            
        
    }
    func getHomeEventHot(){
        Beans.homeServer.getHomeEventHot().subscribe(onSuccess: { [weak self](dto) in
            Log.v("取得熱門賽事")
            if let list = dto?.list{
                self?.eventHotListData = list
            }
            self?.fetchEventHotSuccess.onNext(())
        }, onError: { [weak self](error) in
            self?.eventHotListData = []
            self?.fetchEventHotSuccess.onNext(())
        }).disposed(by: disposeBag)
    }
    func fetchActivityAreaData()
    {
        Beans.homeServer.getSlide(slideCid: "5").subscribeSuccess  { [weak self](dto) in
            if let data = dto?.list {
                self?.activityAreaData = data
            }
            
        }.disposed(by: disposeBag)
    }
    func activityAreaAction()
    {
        if self.activityAreaData.count == 0
        {
            Toast.show(msg:"敬請期待".LocalizedString)
            
        }else if let currentData = self.activityAreaData.first,
                 let urlString = currentData.slide_url
        {
            DeepLinkManager.share.parserStringFromBroeser(urlString)
        }else
        {
            Toast.show(msg:"敬請期待".LocalizedString)
        }
    }
}
//enum Categories :Int,CaseIterable {
//    case category = 100
//    case hot = 101
//    case newLive = 102
//    case basketball = 2
//    case soccer = 1
//    case tennis = 4
//    case volleyball = 3
//    case billiards = 5
//    case gaming = 7
//    case others = 6
//    
//    var toStringValue:String{
//        return String(self.rawValue)
//    }
//}

enum RefreshDirection {
    case up
    case down
}
