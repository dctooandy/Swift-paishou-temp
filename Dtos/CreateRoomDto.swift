//
//  CreateRoomDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2021/1/6.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
class CreateRoomDto: Codable{
    static var share:CreateRoomDto?
    {
        didSet {
            guard let share = share else { return }
            subject.onNext(share)
        }
    }
    static var rxShare:Observable<CreateRoomDto?> = subject
        .do(onNext: { value in
            if share == nil {
                _ = update()
            }
        })
    static let disposeBag = DisposeBag()
    static private let subject = BehaviorSubject<CreateRoomDto?>(value: nil)
    static func update() -> Observable<()>{
        let subject = PublishSubject<Void>()

        return subject.asObservable()
    }
    
    let live: LiveRoomLiveDto?
    let info: LiveRoomPeopleDto?
    init(
        live: LiveRoomLiveDto = LiveRoomLiveDto(),
        info:LiveRoomPeopleDto = LiveRoomPeopleDto()
        )
    {
        self.live = live
        self.info = info
    }
}
