//
//  FullADViewModel.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/17.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
import RxCocoa
import RxSwift

class FullADViewModel: BaseViewModel {
    var adViewData: [HotInfoSlideDto]?
    private var fetchADViewDataSuccess = PublishSubject<[HotInfoSlideDto]?>()
    override init() {
        super.init()
        self.bind()
    }

    func bind() {
        
    }
    func fetchADViewData()
    {
        Beans.homeServer.getSlide(slideCid: "8").subscribeSuccess { [weak self](dto) in
            //            guard let itemDto = dto?.list?[0] else {return}
            if let itemDto =  dto?.list
            {
                self?.adViewData = itemDto
                self?.fetchADViewDataSuccess.onNext(itemDto)
            }else
            {
                self?.fetchADViewDataSuccess.onNext([HotInfoSlideDto()])
            }
            
        }.disposed(by: disposeBag)
    }
 
    func rxFetchADViewDataSuccess() -> Observable<[HotInfoSlideDto]?>
    {
        return self.fetchADViewDataSuccess.asObserver()
    }
}
