//
//  LiveGiftListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/15.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
//禮物列表dto
class LiveGiftsDto: Codable{
    
    let code: Int?
    
    let info:[LiveGiftListDto]?
    
    let msg: String?
    
    init(info: [LiveGiftListDto] = [LiveGiftListDto()], code: Int = 0, msg: String = "") {
        self.info = info
        self.code = code
        self.msg = msg
    }
    
}
class LiveGiftListDto: Codable{
    static var share:LiveGiftListDto?
    {
        didSet {
            guard let share = share else { return }
            subject.onNext(share)
        }
    }
    static var rxShare:Observable<LiveGiftListDto?> = subject
        .do(onNext: { value in
            if share == nil {
                _ = update()
            }
        })
    static let disposeBag = DisposeBag()
    static private let subject = BehaviorSubject<LiveGiftListDto?>(value: nil)
    static func update() -> Observable<()>{
        let subject = PublishSubject<Void>()
        Beans.liveServer.fetchLiveGiftList().subscribeSuccess { (dto) in
            Log.v("Fetch GiftList")
            guard let data = dto else {return}
            share = data
            subject.onNext(())
        }.disposed(by: disposeBag)
        return subject.asObservable()
    }
    
    
    let banana:Int?
    let coin: JSONValue?
    let giftlist: [LiveGiftListItemDto]?
    
    init(
        banana:Int = 0,
        coin: JSONValue = JSONValue.int(0),
        giftlist: [LiveGiftListItemDto] = [LiveGiftListItemDto()]
    ) {
        self.banana = banana
        self.coin = coin
        self.giftlist = giftlist
    }
    
}
class LiveGiftListItemDto: Codable{
    
    let id: JSONValue? //id
    let mark: JSONValue? //0:普通,1:熱門,2:守護
    let type: JSONValue?//0:普通禮物, 1:豪華禮物
    let needcoin: JSONValue?//價格
    let gifticon: String?//禮物圖
    let giftname: String?//禮物名
    
    let sid: Int?//分類id
    let gifticon_mini: String?//禮物小圖
    let orderno: Int?//序號
    let addtime: Int?//添加時間
    let swftype: Int?//動畫類型 0:gif, 1:svga
    let swf: String? //動畫連結
    let swftime: Float?//動畫時長
    // 1027
    let giftexplain:String? // 禮物說明
    
    init(id: JSONValue = JSONValue.string(""),
         mark: JSONValue = JSONValue.int(0),
         type: JSONValue = JSONValue.int(0),
         needcoin: JSONValue = JSONValue.int(0),
         gifticon: String = "",
         giftname: String = "",
        
        sid: Int = 0,
        gifticon_mini: String = "",
        orderno: Int = 0,
        addtime: Int = 0,
        swftype: Int = 0,
        swf: String = "",
        swftime: Float = 0.0,
        giftexplain:String = ""
    ) {
        self.id = id
        self.mark = mark
        self.type = type
        self.needcoin = needcoin
        self.giftname = giftname
        self.gifticon = gifticon
        
        self.sid = sid
        self.gifticon_mini = gifticon_mini
        self.orderno = orderno
        self.addtime = addtime
        self.swftype = swftype
        self.swf = swf
        self.swftime = swftime
        self.giftexplain = giftexplain
    }
}
