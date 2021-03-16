//
//  HomeConfigDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/24.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift

//class HomeConfigDto: Codable {
//    static var share:HomeConfigDto?
//    {
//        didSet {
//            guard let share = share else { return }
//            subject.onNext(share)
//        }
//    }
//    static var rxShare:Observable<HomeConfigDto?> = subject
//        .do(onNext: { value in
//            if share == nil {
//                _ = update()
//            }
//        })
//    static let disposeBag = DisposeBag()
//    static private let subject = BehaviorSubject<HomeConfigDto?>(value: nil)
//    static func update() -> Observable<()>{
//        let subject = PublishSubject<Void>()
//        Beans.homeServer.getConfig().subscribeSuccess({ (configDto) in
//            share = configDto
//            subject.onNext(())
//        }).disposed(by: disposeBag)
//        return subject.asObservable()
//    }
//
//    let code:Int?
//    let msg:String?
//    let info:[HomeConfigInfoDto]?
//
//    init(code:Int = 0,
//         msg:String = "",
//         info:[HomeConfigInfoDto] = [HomeConfigInfoDto()])
//    {
//        self.code = code
//        self.msg = msg
//        self.info = info
//    }
//}
class HomeConfigInfoDto: Codable {
    static var share:HomeConfigInfoDto?
    {
        didSet {
            guard let share = share else { return }
            subject.onNext(share)
        }
    }
    static var rxShare:Observable<HomeConfigInfoDto?> = subject
        .do(onNext: { value in
            if share == nil {
                _ = update()
            }
        })
    static let disposeBag = DisposeBag()
    static private let subject = BehaviorSubject<HomeConfigInfoDto?>(value: nil)
    static func update() -> Observable<()>{
        let subject = PublishSubject<Void>()
//        Beans.homeServer.getConfig().subscribeSuccess({ (configDto) in
//            share = configDto
//            subject.onNext(())
//        }).disposed(by: disposeBag)
        
        Observable.zip(
            Beans.homeServer.getConfig().asObservable(),
            Beans.homeServer.getClassData().asObservable()
        ).subscribeSuccess { (configDto, classDto) in
            HomeConfigInfoDto.share = configDto
            guard let classData = classDto?.list else {return}
            configDto?.liveclass = classData
            UserDefaults.UserInfo.set(value: configDto?.toJsonString ?? "", forKey: .kConfigInfo)
            share = configDto
            subject.onNext(())
        }.disposed(by: disposeBag)
        
        
        
        return subject.asObservable()
    }
    let maintain_switch:JSONValue?
    let maintain_tips:String?
    let sitename:String?
    let site:String?
    let copyright:String?
    let name_coin:String?
    let name_votes:String?
    let mobile:String?
    let address:String?
    let apk_ewm:String?
    let ipa_ewm:String?
    let apk_ver:String?
    let apk_url:String?
    let apk_des:String?
    let ipa_ver:String?
    let ios_shelves:String?
    let ipa_url:String?
    let ipa_des:String?
    let wx_siteurl:String?
    let app_siteurl:String?
    let share_title:String?
    let share_des:String?
    let app_android:String?
    let app_ios:String?
    let video_share_title:String?
    let video_share_des:String?
    let sprout_key:String?
    let sprout_white:String?
    let sprout_skin:String?
    let sprout_saturated:String?
    let sprout_pink:String?
    let sprout_eye:String?
    let sprout_face:String?
    let tximgfolder:String?
    let txvideofolder:String?
    let txcloud_appid:String?
    let txcloud_region:String?
    let txcloud_bucket:String?
    let cloudtype:String?
    let qiniu_domain:String?
    let video_audit_switch:String?
    let share_type:[String]?
    let live_type:[[String]]?
    let live_time_coin:[String]?
    let login_type:[String]?
    var liveclass:[LiveclassDto]?
    let level:[LevelDto]?
    let levelanchor:[LevelanchorDto]?
    let guide:GuideDto?
    let gifts:[LiveGiftListItemDto]?

    init(
    maintain_switch:JSONValue = JSONValue.string("0"),
    maintain_tips:String = "",
    sitename:String = "",
    site:String = "",
    copyright:String = "",
    name_coin:String = "",
    name_votes:String = "",
    mobile:String = "",
    address:String = "",
    apk_ewm:String = "",
    ipa_ewm:String = "",
    apk_ver:String = "",
    apk_url:String = "",
    apk_des:String = "",
    ipa_ver:String = "",
    ios_shelves:String = "",
    ipa_url:String = "",
    ipa_des:String = "",
    wx_siteurl:String = "",
    app_siteurl:String = "",
    share_title:String = "",
    share_des:String = "",
    app_android:String = "",
    app_ios:String = "",
    video_share_title:String = "",
    video_share_des:String = "",
    sprout_key:String = "",
    sprout_white:String = "",
    sprout_skin:String = "",
    sprout_saturated:String = "",
    sprout_pink:String = "",
    sprout_eye:String = "",
    sprout_face:String = "",
    tximgfolder:String = "",
    txvideofolder:String = "",
    txcloud_appid:String = "",
    txcloud_region:String = "",
    txcloud_bucket:String = "",
    cloudtype:String = "",
    qiniu_domain:String = "",
    video_audit_switch:String = "",
    share_type:[String] = [""],
    live_type:[[String]] = [[""]],
    live_time_coin:[String] = [""],
    login_type:[String] = [""],
    liveclass:[LiveclassDto] = [LiveclassDto()],
    level:[LevelDto] = [LevelDto()],
    levelanchor:[LevelanchorDto] = [LevelanchorDto()],
    guide:GuideDto = GuideDto(),
    gifts:[LiveGiftListItemDto] = [LiveGiftListItemDto()]
    )
    {
        self.maintain_switch = maintain_switch
        self.maintain_tips = maintain_tips
        self.sitename = sitename
        self.site = site
        self.copyright = copyright
        self.name_coin = name_coin
        self.name_votes = name_votes
        self.mobile = mobile
        self.address = address
        self.apk_ewm = apk_ewm
        self.ipa_ewm = ipa_ewm
        self.apk_ver = apk_ver
        self.apk_url = apk_url
        self.apk_des = apk_des
        self.ipa_ver = ipa_ver
        self.ios_shelves = ios_shelves
        self.ipa_url = ipa_url
        self.ipa_des = ipa_des
        self.wx_siteurl = wx_siteurl
        self.app_siteurl = app_siteurl
        self.share_title = share_title
        self.share_des = share_des
        self.app_android = app_android
        self.app_ios = app_ios
        self.video_share_title = video_share_title
        self.video_share_des = video_share_des
        self.sprout_key = sprout_key
        self.sprout_white = sprout_white
        self.sprout_skin = sprout_skin
        self.sprout_saturated = sprout_saturated
        self.sprout_pink = sprout_pink
        self.sprout_eye = sprout_eye
        self.sprout_face = sprout_face
        self.tximgfolder = tximgfolder
        self.txvideofolder = txvideofolder
        self.txcloud_appid = txcloud_appid
        self.txcloud_region = txcloud_region
        self.txcloud_bucket = txcloud_bucket
        self.cloudtype = cloudtype
        self.qiniu_domain = qiniu_domain
        self.video_audit_switch = video_audit_switch
        self.share_type = share_type
        self.live_type = live_type
        self.live_time_coin = live_time_coin
        self.login_type = login_type
        self.liveclass = liveclass
        self.level = level
        self.levelanchor = levelanchor
        self.guide = guide
        self.gifts = gifts
    }
    var toJsonString: String {
        do {
            let jsonData = try self.jsonData()
            //            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            //                  guard let dictionary = json as? [String : Any] else {
            //                    return [:]
            //                  }
            //            return dictionary as Dictionary
            // Use dictionary
            
            guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                return ""
            }
            return jsonString
            //                  // Print jsonString
            //                  print(jsonString)
        } catch  {
            
        }
        return ""
    }
}
class LiveclassFrameDto:Codable {
    static var share:LiveclassFrameDto?
    {
        didSet {
            guard let share = share else { return }
            subject.onNext(share)
        }
    }
    static var rxShare:Observable<LiveclassFrameDto?> = subject
        .do(onNext: { value in
            if share == nil {
                _ = update()
            }
        })
    static let disposeBag = DisposeBag()
    static private let subject = BehaviorSubject<LiveclassFrameDto?>(value: nil)
    static func update() -> Observable<()>{
        let subject = PublishSubject<Void>()
        Beans.homeServer.getClassData().subscribeSuccess({ (configDto) in
            share = configDto
            subject.onNext(())
        }).disposed(by: disposeBag)
        return subject.asObservable()
    }
    let list : [LiveclassDto]?
    init(list:[LiveclassDto] = [LiveclassDto()])
    {
        self.list = list
    }
}
class LiveclassDto:Codable {
    
    let id : JSONValue?
    let name : String?
    let nums : Int?
    let thumb : String?
    let des : String?
    let orderno : String?
    let vcStr : String?
    var categorieInt : Int?
    
    init(id:JSONValue = JSONValue.string(""),
         name:String = "",
         nums:Int = 0,
         thumb:String = "",
         des:String = "",
         orderno:String = "",
         vcStr:String = "",
         categorieInt:Int = 0)
    {
        self.id = id
        self.name = name
        self.nums = nums
        self.thumb = thumb
        self.des = des
        self.orderno = orderno
        self.vcStr = vcStr
        self.categorieInt = categorieInt
    }
}
class LevelDto: Codable {
    let id:JSONValue?
    let level_up:JSONValue?
    let levlename:String?
    let levelid:JSONValue?
    let thumb:String?
    let colour:String?
    let thumb_mark:String?
    init(
        id:JSONValue = JSONValue.int(0),
        level_up:JSONValue = JSONValue.int(0),
        levlename:String = "",
        levelid:JSONValue = JSONValue.int(0),
        thumb:String = "",
        colour:String = "",
        thumb_mark:String = ""
    )
    {
        self.id = id
        self.level_up = level_up
        self.levlename = levlename
        self.levelid = levelid
        self.thumb = thumb
        self.colour = colour
        self.thumb_mark = thumb_mark
    }
}
class LevelanchorDto: Codable {
    let levelid:JSONValue?
    let thumb:String?
    let thumb_mark:String?
    init(levelid:JSONValue = JSONValue.int(0),
         thumb:String = "",
         thumb_mark:String = "")
    {
        self.levelid = levelid
        self.thumb = thumb
        self.thumb_mark = thumb_mark
    }
}
class GuideDto: Codable {
    let `switch`:String?
    let type:String?
    let time:String?
    let list:[String]?
    init(switch:String = "",
         type:String = "",
         time:String = "",
         list:[String] = [""])
    {
        self.switch = `switch`
        self.type = type
        self.time = time
        self.list = list
    }

}
