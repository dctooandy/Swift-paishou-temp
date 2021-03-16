//
//  EnumFile.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import UIKit
enum Method:String,CaseIterable {
    // PaymenetBottomSheet
    case app_addBankCard
    case token_expired
    case deposit_log
    case withdraw_log
    case deposit_redirect
    case deposit_form
    
    // PromotionDetailBottomSheet
    case bonus_success
    case bonus_failed
//    case token_expired 重覆
    
    // GamingViewController
    case app_service
    case app_deposit
    case app_mypage
    
    // PLKWebViewController
    case app_gohome
    case app_help
    case app_info
    case webImgLongPressHandler
    case deeplinkstring
//    case app_service 重覆
}
enum MCategory:String,CaseIterable {
    case LoginPage          = "登錄"
    case ForgotPWPage       = "忘記密碼"
    case RegisterPage       = "註冊"
    case MyInfoPage         = "我的"
    case MyInfoDataPage     = "個人資料"
    case BindMobilePage     = "綁定手機"
    case BindEmailPage      = "綁定email"
    case MyInfoPackagePage  = "我的背包"
    
    case HomePage           = "首頁"
    case AttentPage         = "關注"
    case RechargePage       = "充值"
    case SchedulePage       = "賽程"
    
    case TaskListPage       = "任務列表"
    case LimitedTaskPage    = "限時任務"
    
    case SearchPage         = "搜尋"
    
    case StreamLiveRoomPage = "直播間"
    //0111
    case ActivityArea       = "活動區"
}
enum MAction:String,CaseIterable {
    case Ligon                  = "登入"
    case ForgotPW               = "忘記密碼"
    case Register               = "註冊"
    case FetchOTP               = "取驗證碼"
    case SendOTP                = "送出驗證碼"
    case cancel                 = "取消"
    case edit                   = "編輯"
    case confirmAccountPW       = "驗證帳密"
    case checkItOut             = "查看"
    case useEquipment           = "使用道具"
    
    case enterStreamLiveRoom    = "進入直播間"
    case clickBanner            = "點擊廣告"
    case tabbar                 = "Tabbar"
    case unattentAnchor         = "取消關注"
    case attentAnchor           = "關注主播"
    case selectAmount           = "選擇金額"
    case selectWay              = "選擇通路"
    case submit                 = "送出"
    case appointment            = "預約"
    
    case checkTask              = "查看任務"
    case getBonus               = "領取獎勵"
    
    case search                 = "搜尋"
    
    case checkAnchorInfo        = "查看主播資訊"
    case checkContribution      = "查看貢獻榜"
    case checkPackage           = "查看背包"
    case openItem               = "開啟道具"
    case packageSendGift        = "背包送禮"
    case checkChatRoom          = "查看聊天室"
    case sendGift               = "送禮"
    case chatSubmit             = "聊天送出"
    case share                  = "分享"
    case leaveRoom              = "離開直播間"
    case changeStreamSource     = "切換播源"
    // 0111
    case copy                   = "複製"
    case checkCategory          = "查看分類"
    case checkTopActivity       = "查看置頂活動"
    case checkActivity          = "查看活動"
    
}
enum MName:String,CaseIterable
{
    case personalInfo           = "個人資料"
    case setting                = "設置"
    case sms                    = "站內信"
    case inChargeRecord         = "充值紀錄"
    case myPackage              = "我的背包"
    case donateRecord           = "打賞紀錄"
    case bindMobileNum          = "綁定手機"
    case bindEmail              = "綁定email"
    case changePW               = "修改密碼"
    case avator                 = "頭像"
    
    case myGift                 = "我的禮物"
    case myItem                 = "我的道具"
    
    case category               = "分類"
    case hot                    = "熱門"
    case newest                 = "最新"

    case task                   = "任務"
    case anchorUID              = "主播UID"
    case BannerID               = "BannerID"
    case attent                 = "關注"
    case myInfo                 = "我的"
    case schedule               = "賽程"
    case recharge               = "充值"
    case home                   = "首頁"
    case confirm                = "確認充值"

    case timeLimitList          = "限時活動"
    case dailyTaskList          = "日常任務"
    case normalTaskList         = "任務列表"
    
    case loginBonus             = "登入獎勵"
    case newHandTaskBonus       = "新手任務"
    case dailyTaskBonus         = "每日任務"
    case rechargeTaskListBonus  = "充值任務"
    case timeLimitTaskBonus     = "限時任務"

    
    case anchorInfo             = "主播資訊"
    case dailyRank              = "日榜"
    case weekRank               = "週榜"
    case monthRank              = "月榜"
    case contributionRank       = "貢獻榜"
    case chatroom               = "聊天室"
    case timeLimitIcon          = "限時任務icon"
    case line1                  = "線路1"
    case line2                  = "線路2"
    case line3                  = "線路3"
    // 0111
    case myAppointment          = "我的預約"
    case scheduleList           = "賽程列表"
    
}
enum DWPageType {
    case RedEnvelopeType
    case GuessGameType
    case CartType
}
enum DWFeverTimeType : Int
{
    case isNotFever = 0
    case isFever
}
enum ThaiInBoxMethod:String,CaseIterable
{
    case add = "Add"
    case edit = "Edit"
    case delete = "Delete"
}
enum SexCategories: Int {
    case Man,Girl,None
    var gender : String
    {
        switch self {
        case .Man:
            return "M"
        case .Girl:
            return "F"
        case .None:
            return "None"
        }
    }
}
enum ThaiBankMethod: Int {
    case Add,Edit,Delete
    var method : String
    {
        switch self {
        case .Add:
            return "Add"
        case .Edit:
            return "Edit"
        case .Delete:
            return "Delete"
        }
    }
}
enum DefaultAlertViewMode: String {
    case NoShot
    case OneShot
    case TwoCandy
    case GoLoginSighup
    case WebContent
    var containerOffectHeight : CGFloat
    {
        switch self {
        case .NoShot:
            return pWidth(100)
            
        default:
            return pWidth(150)
        }
    }
    var containerWidth : CGFloat
    {
        switch self {
        case .NoShot:
            return pWidth(212)
        default:
            return Views.screenWidth - pWidth(40)
        }
    }
    var hintLabelWidth : CGFloat
    {
        switch self {
        case .NoShot:
            return pWidth(212)
        default:
            return Views.screenWidth - pWidth(60)
        }
    }
  }
enum MaintainViewType :Int{

    case defaultMaintain = 1
    case specialMaintain403
    case specialMaintain404
    case specialMaintain503
    
    var colors: [CGColor] {
        return [UIColor(red: 243, green: 50, blue: 117).cgColor,
        UIColor(red: 186, green: 0, blue: 108).cgColor]
    }
    
    var locations: [NSNumber] {
        [0.0, 1.0]
    }
    
    var startPoint: CGPoint {
        CGPoint(x: 0.5, y: 0)
    }
    
    var endPoint: CGPoint {
        CGPoint(x: 0.5, y: 1)
    }

    var title:String {
        switch self {
        case .defaultMaintain:
            return "抱歉！系統維​​護中...".LocalizedString
        case .specialMaintain403:
            return "訪問限制".LocalizedString
        case .specialMaintain404:
            return "訪問限制".LocalizedString
        case .specialMaintain503:
            return "訪問限制".LocalizedString
        }
    }
    func content(input: String) -> String {
        switch self {
            case .defaultMaintain:
                return "維護時間:".LocalizedString + "  \(input)"
            case .specialMaintain403:
                return "親，您所在的地區目前不在我們的服務範圍內，如果您有任何疑問，請聯繫我們的在線客服".LocalizedString

            case .specialMaintain404:
                return "親，您所在的地區目前不在我們的服務範圍內，如果您有任何疑問，請聯繫我們的在線客服".LocalizedString

            case .specialMaintain503:
                return "親，您的帳號目前無法登錄，如果您有任何疑問，請聯繫我們的在線客服".LocalizedString
        }
       }
}
enum FinancialType:Int ,CaseIterable{
    case deposit = 0, withdraw
    var title:String {
        switch self {
        case .deposit:
            return "存款".LocalizedString
        case .withdraw:
            return "提款".LocalizedString
        }
    }
}
enum FinancialWithdrawType:Int ,CaseIterable{
    case startWithdraw = 0
    mutating func next(isQRCode: Bool = false) {
        switch self {
        case .startWithdraw:
            self = .startWithdraw
        }
    }
    var height:CGFloat{
        switch self {
        case .startWithdraw:
            return Views.screenHeight * (95/812) + Views.depositFixedLabelHeight * 4 + Views.depositOrderCellViewHeight + Views.defaultTextFieldHeight * 3 + Views.depositInfoLabelHeight
        }
    }
}
enum FinancialDepositType:Int ,CaseIterable{
    case startDeposit = 0, confirmDepositNormal,confirmDepositQRCode,endDeposit
    mutating func next(isQRCode: Bool = false) {
        switch self {
        case .startDeposit:
            self = isQRCode ? .confirmDepositQRCode:.confirmDepositNormal
        case .confirmDepositNormal:
            self = .endDeposit
        case .confirmDepositQRCode:
            self = .endDeposit
        case .endDeposit:
            self = .startDeposit
        }
    }
    var height:CGFloat{
        switch self {
        case .startDeposit:
            return Views.depositFixedLabelHeight * 5 +
                Views.depositInfoLabelHeight +
                Views.defaultSubmitBtnHeight +
                Views.screenHeight * (75/812) +
                Views.screenHeight * (75/812)
        case .confirmDepositNormal:
            return Views.depositCountLabelHeight +
                Views.depositFixedLabelHeight * 2 +
                Views.depositOrderCellViewHeight * 4 +
                Views.defaultSubmitBtnHeight +
                Views.depositInfoLabelHeight +
                Views.screenHeight * (90/812)
        case .confirmDepositQRCode:
            return Views.depositCountLabelHeight +
                Views.depositFixedLabelHeight * 2 +
                Views.depositOrderCellViewHeight +
                Views.defaultSubmitBtnHeight +
                Views.depositInfoLabelHeight +
                Views.depositCountLabelSpace +
                Views.screenHeight * (30/812) +
                Views.screenWidth * (250/414)
        case .endDeposit:
            return Views.depositFixedLabelHeight * 2 +
                Views.depositOrderCellViewHeight * 8 +
                Views.defaultSubmitBtnOffsetSpace +
                Views.defaultSubmitBtnHeight +
                Views.defaultTextFieldSpace * 4 +
                Views.screenHeight * (45/812)
        }
    }
}
enum BccFilterType: Int,CaseIterable {
    //all-全部/bonus-紅利/offer-返水/rescue--救援金/item-獎品/special-特殊活動
    case all
    case bonus
    case offer
    case rescue
    case item
    case special
    
    var title:String {
        switch self {
        case .all:
            return "全部".LocalizedString
        case .bonus:
            return "紅利".LocalizedString
        case .offer:
            return "返水".LocalizedString
        case .rescue:
            return "救援金".LocalizedString
        case .item:
            return "獎品".LocalizedString
        case .special:
            return "特殊活動".LocalizedString
        }
    }
    var propertyString:String {
      switch self {
      case .all:
          return "all"
      case .bonus:
          return "bonus"
      case .offer:
          return "return"
      case .rescue:
          return "rescue"
      case .item:
          return "physical"
      case .special:
          return "special"
        }
    }

    var typeCode: String {
        switch self {
        case .all: return "0"
        case .bonus: return "1"
        case .offer: return "2"
        case .rescue: return "3"
        case .item: return "4"
        case .special: return "5"
        }
    }
}
enum BCCStatus:Int ,CaseIterable{
    case all = 0
    case getable = 1
    case verify = 2
    case applied = 3
    case failed = 4
//    case expired = 6
    var propertyInt :Int{
        switch self {
        case .all:
            return 0
        case .getable:
            return 2
        case .verify:
            return 1
        case .applied:
            return 5
        case .failed:
            return 4
        }
    }
 
    var title:String {
        switch self {
        case .all:
            return "全部".LocalizedString
        case .getable:
            return "可領取".LocalizedString
        case .verify:
            return "審核中".LocalizedString
        case .applied:
            return "已領取".LocalizedString
        case .failed:
            return "失敗".LocalizedString
//        case .expired:
//            return "已過期".LocalizedString
        }
    }
}
enum BCCCellType:Int ,CaseIterable{
    case all = 0, bonus,offer,rescue,item,special
    var title:String {
        switch self {
        case .all:
            return "全部".LocalizedString
        case .bonus:
            return "紅利金額".LocalizedString
        case .offer:
            return "返水金額".LocalizedString
        case .rescue:
            return "救援金額".LocalizedString
        case .item:
            return "獎品".LocalizedString
        case .special:
            return "特殊活動".LocalizedString
        }
    }
    var propertyString:String {
      switch self {
      case .all:
          return "all"
      case .bonus:
          return "bonus"
      case .offer:
          return "return"
      case .rescue:
          return "rescue"
      case .item:
          return "physical"
      case .special:
//          return "special"
          return "bonus"
        }
    }
    var infoViewCellHeight:CGFloat {
        return height(60/812)
    }
    var infoViewCellSeparatorLineHeight:CGFloat {
        return height(2/812)
    }
    var infoViewSubmitBtnHeight:CGFloat {
        return height(60/812)
    }

    var infoViewHeight:CGFloat {
      switch self {
      case .bonus:
        return infoViewCellHeight * CGFloat(self.infoViewCellCount) + infoViewCellSeparatorLineHeight * 2 + infoViewSubmitBtnHeight
      case .offer:
        return infoViewCellHeight * 4 + infoViewCellSeparatorLineHeight * 3 + infoViewSubmitBtnHeight
      case .rescue:
        return infoViewCellHeight * 4 + infoViewCellSeparatorLineHeight * 3 + infoViewSubmitBtnHeight
      case .item:
        return infoViewCellHeight * 2 + infoViewCellSeparatorLineHeight * 1 + infoViewSubmitBtnHeight
      case .special:
        return infoViewCellHeight * CGFloat(self.infoViewCellCount) + infoViewCellSeparatorLineHeight * 2 + infoViewSubmitBtnHeight
      default :
            return 0.0
        }
    }
    var infoViewCellCount:Int {
      switch self {
      case .bonus:
        return 3
      case .offer:
        return 4
      case .rescue:
        return 4
      case .item:
        return 1
      case .special:
        return 3
      default :
            return 0
        }
    }
    var infoViewCellTitalString:[String] {
        switch self {
        case .bonus:
            return ["紅利日期".LocalizedString,
                    "存款金額".LocalizedString,
                    "提款流水限制".LocalizedString]
        case .offer:
            return ["返水日期".LocalizedString,
                    "流水金額".LocalizedString,
                    "返水比例".LocalizedString,
                    "提款流水限制".LocalizedString]
        case .rescue:
            return ["救援金日期".LocalizedString,
                    "流水金額".LocalizedString,
                    "救援金比例".LocalizedString,
                    "提款流水限制".LocalizedString]
        case .item:
            return ["存款要求".LocalizedString]
        case .special:
            return ["紅利日期".LocalizedString,
                    "存款金額".LocalizedString,
                    "提款流水限制".LocalizedString]
        default :
            return [""]
        }
    }
}
enum DepositFixedNumType:Int ,CaseIterable{
    case OneH = 1, FiveH,TenH,FtyH,TenT,TwtyT
    var addMoney : Int{
        switch self {
        case .OneH:
            return 100
        case .FiveH:
            return 500
        case .TenH:
            return 1000
        case .FtyH:
            return 5000
        case .TenT:
            return 10000
        case .TwtyT:
            return 20000
        }
    }
}
enum DefalutPortalType: Int,CaseIterable {
    case Withdraw = 0
    case Deposit
    case Customer
    var caseCount:Int {
        switch self {
        case .Withdraw:
            return WithdrawPortalType.allCases.count
        case .Deposit:
            return DepostiPortalType.allCases.count
        case .Customer:
            return CustomerPortalType.allCases.count
        }
    }
}
enum WithdrawPortalType: Int,CaseIterable {
    case BankTrans = 0
    var title : String {
        switch self {
            case .BankTrans:
                return "銀行轉帳".LocalizedString
//            case .QRCode:
//                return "QR Code".LocalizedString
        }
    }
    var propertyString:String {
         switch self {
            case .BankTrans:
             return "Normal"
//            case .QRCode:
//             return "QRCode"
        }
    }
}
enum DepostiPortalType: Int,CaseIterable {
    case BankTrans = 0 , QRCode
    var title : String {
        switch self {
            case .BankTrans:
                return "銀行轉帳".LocalizedString
            case .QRCode:
                return "QR Code".LocalizedString
        }
    }
    var propertyString:String {
         switch self {
            case .BankTrans:
             return "Normal"
            case .QRCode:
             return "QRCode"
        }
    }
}
enum CustomerPortalType :Int,CaseIterable {
    case BankTrans = 0 , ATM, Phone , GoBank , NoCardTrans , OtherWay
    var title : String {
        switch self {
        case .BankTrans:
            return "網路銀行".LocalizedString
        case .ATM:
            return "ATM".LocalizedString
        case .Phone:
            return "手機".LocalizedString + "APP"
        case .GoBank:
            return "臨櫃匯款".LocalizedString
        case .NoCardTrans:
            return "無卡轉帳".LocalizedString
        case .OtherWay:
            return "其他".LocalizedString
        }
    }
    var propertyString:String {
        switch self {
        case .BankTrans:
            return "網路銀行".LocalizedString
        case .ATM:
            return "ATM".LocalizedString
        case .Phone:
            return "手機".LocalizedString + "APP"
        case .GoBank:
            return "臨櫃匯款".LocalizedString
        case .NoCardTrans:
            return "無卡轉帳".LocalizedString
        case .OtherWay:
            return "其他".LocalizedString
        }
    }
}
enum FinancialCountDownNum: Int,CaseIterable {
    case FirstMin = 0 , LastMin , FirstSec , LastSec
}
enum TabbarSelected:Int,CaseIterable {
    case MainView               = 0
    case PromotionView          = 1
    case RecordView             = 2
    case FinancialView          = 3
    case MemberView             = 4
}

enum Pattern {
        case securityAnswer
        case account
        case delegateNumber
        case delegateName
        case mail
        case realName
        case thaiRealName
        case password
        case phone
        case otp
        case address
        case number
        var valid:String {
            switch  self {
            case .securityAnswer:
                return "^[^0-9]{1,31}+$"
            case .account:
                return "^[0-9a-zA-Z_]{5,15}+$"
            case .delegateNumber:
                return "^[0-9a-zA-Z_]{1,15}+$"
            case .delegateName:
                return "^[0-9a-zA-Z_\\u4E00-\\u9FA5]{1,30}+$"
            case .mail:
                return "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            case .realName:
                return "^[\\u4E00-\\u9FA5]{1,31}+$"
            case .thaiRealName:
                return "^[^0-9]{1,31}+$"
            case .password:
                return "^[A-Za-z0-9]{8,20}+$"
            case .phone:
//                return "^((0)\\d{9})$" //泰國
                return "^((13|14|15|16|17|18|19)\\d{9}){1}$" //中國
            case .otp:
                return "^\\d{6}$"
            case .address:
                return "^[A-Za-z0-9\\_\\!\\@\\#\\$\\%\\^\\&\\*\\-\\+\\=\\;\\:\\,\\.\\?\\~]{1,200}+$"
            case .number:
//                return "^[a-zA-Z0-9]+$"
                return "^[0-9]+$"
            }
        }
        var invalid:[String] {
            switch  self {
            case .account,.delegateName:
                return ["^(\\..)+$","^(.\\..)+$"]
            case .password:
                return ["^\\bPASSWORD\\b","^\\bPassword\\b","^\\bPASSW0RD\\b","^\\bpassw0rd\\b","^\\bpasswd\\b","^\\bPassword\\b","^(\\..)+$",
                "^(.\\..)+$"]
            default:
                return [""]
            }
        }
        
        
    }
enum RetrievePwdStep:CaseIterable {
    case inputAccountAndPhone
    case inputVerifyCode
    case inputNewPassword
    case success
    func isHidden(tfTag: Int) -> Bool {
        switch self {
        case .inputAccountAndPhone ,.inputVerifyCode :
            if tfTag <= 3
            {
                return false
            }else
            {
                return true
            }
        case .inputNewPassword:
           if tfTag > 3
           {
               return false
           }else
           {
               return true
           }
        default:
            return false
        }
    }
    func isEnable(tfTag: Int) -> Bool {
         switch self {
         case .inputAccountAndPhone:
            if tfTag <= 3
            {
                return true
            }else
            {
                return false
            }
         case .inputVerifyCode:
            if tfTag > 2
            {
                return true
            }else
            {
                return false
            }
         case .inputNewPassword:
            if tfTag > 3
            {
                return true
            }else
            {
                return false
            }
         default:
             return false
         }
     }
    mutating func next() {
        switch self {
        case .inputAccountAndPhone:
            self = .inputVerifyCode
        case .inputVerifyCode:
            self = .inputNewPassword
        case .inputNewPassword:
            self = .success
        case .success:
            break
        }
    }
}
enum ForgetPwdStep {
    case inputNumberAndVerifyCode
    case inputAccount
    case inputVerifyCode
    case inputNewPassword
    case success
    
    var title: String {
        switch self {
        case .inputNumberAndVerifyCode:
            return "忘記密碼".LocalizedString
        case .inputAccount:
            return "忘記密碼".LocalizedString
        case .inputVerifyCode:
            return "忘記密碼".LocalizedString
        case .inputNewPassword:
            return "忘記密碼".LocalizedString
        case .success:
            return "修改成功".LocalizedString
        }
    }
    var subtitle: String {
        switch self {
        case .inputAccount:
            return ""
        case .inputVerifyCode:
            return "以发送验证码至"
        default:
            return ""
        }
    }
    func placeHolder(tfTag: Int) -> String {
        switch self {
        case .inputNumberAndVerifyCode:
            if tfTag == 1 {
                    return "請輸入手機號碼".LocalizedString
                }
                return "發送驗證碼".LocalizedString
        case .inputVerifyCode:
            if tfTag == 1 {
                    return "請輸入手機號碼".LocalizedString
                }
                return "發送驗證碼".LocalizedString
        case .inputNewPassword:
            if tfTag == 1 {
                return "請輸入新密碼".LocalizedString
            }
            return "請再次輸入新密碼".LocalizedString
        default:
            return ""
        }
        
    }
    var rightBtnHidden: Bool {
        switch self {
        case .inputNumberAndVerifyCode:
            return false
        case .inputVerifyCode:
            return false
        case .inputNewPassword:
            return true
        case .inputAccount:
            return true
        default:
            return false
        }
    }
    var invalidLbHidden: Bool {
        switch self {
        case .inputNumberAndVerifyCode:
            return true
        case .inputVerifyCode:
            return true
        case .inputNewPassword:
            return false
        default:
            return true
        }
    }
    var isEnable: Bool {
        switch self {
        case .inputNumberAndVerifyCode:
            return false
        case .inputVerifyCode:
            return true
        case .inputNewPassword:
            return true
        default:
            return false
        }
    }
    var isSecure: Bool {
        switch self {
        case .inputNewPassword:
            return true
        default:
            return false
        }
    }
    mutating func next() {
        switch self {
        case .inputNumberAndVerifyCode:
            self = .inputVerifyCode
        case .inputAccount:
            self = .inputVerifyCode
        case .inputVerifyCode:
            self = .inputNewPassword
        case .inputNewPassword:
            self = .success
        case .success:
            break
        }
    }
    func invalidText(tfTag: Int) -> String {
        switch self {
        case .inputNumberAndVerifyCode:
            if tfTag == 1 {
                return "請輸入手機號碼".LocalizedString
            }
            return "點擊右方發送驗證碼".LocalizedString
        case .inputAccount:
            return "请输入正确手机或邮箱"
        case .inputVerifyCode:
            if tfTag == 1 {
                return "請輸入手機號碼".LocalizedString
            }
            return "點擊右方發送驗證碼".LocalizedString
        case .inputNewPassword:
            if tfTag == 1 {
                return "請輸入8~20字母或下劃線和數字、不含特殊符號".LocalizedString
            }
            return "兩次輸入的密碼不一致".LocalizedString
        default:
            return ""
        }
        
    }
}
enum RetrieveOTP_Type :String,CaseIterable{
    case TypeRegister = "0" //註冊
    case TypeFind  = "1"//找回
    case TypeChangePhone = "2"// 修改
}
enum BarStyle {
    case Login, SignUp , MainPage , MarketPage , RecordPage , CashPage , MyPage ,
    WalletList , MarketFiltered, InboxListDelete, InboxListEdit ,OnlyService , defaultPage
}
enum GameCellType {
    case Hot
    case Market
}
enum MemberPageFourButton : Int,CaseIterable {
    case promotion = 1
    case inRecord
    case outRecord
    case history
    func title() -> String
    {
        switch self {
        case .promotion:
            return "優惠活動".LocalizedString
        case .inRecord:
            return "入賬紀錄".LocalizedString
        case .outRecord:
            return "出賬紀錄".LocalizedString
        case .history:
            return "歷史賬務".LocalizedString
        }
    }
    func imageName() -> String
    {
        switch self {
        case .promotion:
            return "mine1"
        case .inRecord:
            return "mine2"
        case .outRecord:
            return "mine3"
        case .history:
            return "mine4_dis"
        }
    }
    func centerXFloat() -> CGFloat
    {
        switch self {
        case .promotion:
            return (Views.screenWidth - pWidth(32))/8
        case .inRecord:
            return (Views.screenWidth - pWidth(32))/4 + (Views.screenWidth - pWidth(32))/8
        case .outRecord:
            return (Views.screenWidth - pWidth(32))/2 + (Views.screenWidth - pWidth(32))/8
        case .history:
            return (Views.screenWidth - pWidth(32)) - (Views.screenWidth - pWidth(32))/8
        }
    }
}
enum MemberPageEightButton : Int,CaseIterable {
    case bankCard = 5
    case persional
    case phone
    case email
    case weChat
    case qqSetting
    case aboutUs
    case helpingCenter
    
    func title() -> String
    {
        switch self {
        case .bankCard:
            return "銀行卡".LocalizedString
        case .persional:
            return "個人資料".LocalizedString
        case .phone:
            return "手機號".LocalizedString
        case .email:
            return "郵箱設定".LocalizedString
        case .weChat:
            return "微信綁定".LocalizedString
        case .qqSetting:
            return "QQ設定".LocalizedString
        case .aboutUs:
            return "關於我們".LocalizedString
        case .helpingCenter:
            return "幫助中心".LocalizedString
        }
    }
    func imageName() -> String
      {
          switch self {
          case .bankCard:
              return "mine5"
          case .persional:
              return "mine6"
          case .phone:
              return "mine7"
          case .email:
              return "mine8"
          case .weChat:
              return "mine9"
          case .qqSetting:
              return "mine10"
          case .aboutUs:
              return "mine11"
          case .helpingCenter:
              return "mine12"
          }
      }
    func centerXFloat() -> CGFloat
    {
        switch self {
        case .bankCard:
            return (Views.screenWidth - pWidth(32))/8
        case .persional:
            return (Views.screenWidth - pWidth(32))/4 + (Views.screenWidth - pWidth(32))/8
        case .phone:
            return (Views.screenWidth - pWidth(32))/2 + (Views.screenWidth - pWidth(32))/8
        case .email:
            return (Views.screenWidth - pWidth(32)) - (Views.screenWidth - pWidth(32))/8
        case .weChat:
            return (Views.screenWidth - pWidth(32))/8
        case .qqSetting:
            return (Views.screenWidth - pWidth(32))/4 + (Views.screenWidth - pWidth(32))/8
        case .aboutUs:
            return (Views.screenWidth - pWidth(32))/2 + (Views.screenWidth - pWidth(32))/8
        case .helpingCenter:
            return (Views.screenWidth - pWidth(32)) - (Views.screenWidth - pWidth(32))/8
        }
    }
    func centerYFloat() -> CGFloat
    {
        // 高 - (view 高 * 2)
        let diss = pHeight(192.0 - (52.0 * 2))/4
        switch self {
        case .bankCard ,.persional,.phone,.email:
            return pHeight(192)/4 - diss
       
        default:
            return pHeight(192)/2 + pHeight(192)/4 - diss
        }
    }
}
enum LivingType : Int,CaseIterable{
    case VeryHigh = 0
    case Normal
    case Slow
    func titleString() -> String{
        switch self {
        case .VeryHigh:
            return "極度流暢".LocalizedString
        case .Normal:
            return "一般".LocalizedString
        case .Slow:
            return "擁堵".LocalizedString
        }
    }
    func titleColor() -> UIColor
    {
        switch self {
        case .VeryHigh:
            return #colorLiteral(red: 0.3921568627, green: 0.7176470588, blue: 0.0862745098, alpha: 1)
        case .Normal:
            return #colorLiteral(red: 0.9960784314, green: 0.6431372549, blue: 0.2274509804, alpha: 1)
        case .Slow:
            return #colorLiteral(red: 0.9294117647, green: 0.1215686275, blue: 0.1215686275, alpha: 1)
        }
    }
}
enum WithdrawStep : Int,CaseIterable{
    case noCard = 0
    case waitSelectedCard
    case selectedCard
    case inputCashAmount
    
    mutating func next() {
        switch self {
        case .noCard:
            self = .waitSelectedCard
        case .waitSelectedCard:
            self = .selectedCard
        case .selectedCard:
            self = .inputCashAmount
        case .inputCashAmount:
            self = .noCard
        }
    }
}
enum AddbankCardStep : Int,CaseIterable{
    case noCard = 0
    case getCard
    case directToAddSOP
    
    mutating func next() {
        switch self {
        case .noCard:
            self = .getCard
        case .getCard:
            self = .noCard
        case .directToAddSOP:
            self = .directToAddSOP
        }
    }
}
enum PSUserGenderType : Int,CaseIterable{
    case PSUserGenderTypeAll = 0    // 全部
    case PSUserGenderTypeMale = 1   // 男
    case PSUserGenderTypeFemale     // 女
}
enum LoginSignupMode:Int,CaseIterable
{
    case Login = 0
    case SignUP = 1
}
enum AnchorActionSheetImageType:Int,CaseIterable
{
    case none = 1
    case copy = 2
    case share = 3
}

enum PSVCInt :Int , CaseIterable
{
    case HomeVC = 1
    case ScheduleVC
    case AttentVC
    case RechangeVC
    case MyInfoVC
    case LiveChatRoom
    case SearchID
    case NormalDeeplink
    case LimitTimeTaskWall
}

enum SwitchListTableviewMode
{
    case dailyside
    case paymentSide
}
enum AllTabVC :Int , CaseIterable
{
    case Home = 0
    case Schedule
    case Attent
    case Recharge
    case MyInfo
    
    func selfType() -> AnyClass?{
        switch self {
        case .Home:
            return HomeMainViewController.self
        case .Schedule:
            return ScheduleMainViewController.self
        case .Attent:
            return AttentionMainViewController.self
        case .Recharge:
            return RechargeViewController.self
        case .MyInfo:
            return MyInfoMainViewController.self
        }
    }
    func tabbarStringValue () -> String {
        switch self {
        case .Home:  return "首頁".LocalizedString
        case .Schedule: return "賽程".LocalizedString
        case .Attent: return "關注".LocalizedString
        case .Recharge: return "充值".LocalizedString
        case .MyInfo: return "我的".LocalizedString
            
        }
    }
}
enum CreateRoomSettingMode
{
    case LiveStreamCategory
    case LiveRoomTitle
    case LiveRoomNotice
    case LiveRoomTitleOnAir
    case LiveRoomNoticeOnAir
    
    func titleString () -> String {
        switch self {
        case .LiveStreamCategory:  return "直播分類".LocalizedString
        case .LiveRoomTitle,.LiveRoomTitleOnAir: return "直播間標題".LocalizedString
        case .LiveRoomNotice,.LiveRoomNoticeOnAir: return "直播間公告".LocalizedString
        }
    }
}

enum ChatRoomMode
{
    case normal
    case small
}
enum SportImages :Int , CaseIterable{
    case Soccer = 1
    case BasketBall
    case Volley
    case Tennis
    case Pool
    case Other
    case Esport
    case category = 100
    case hotest = 101
    case newest = 102
    
    func grayImageName () -> String {
        switch self {
        case .Pool:
            return "iconSoccerGray"
//            return "iconPoolGray"
        case .Volley:
            return "iconSoccerGray"
//            return "iconVolleyGray"
        case .Tennis:
            return "iconSoccerGray"
//            return "iconTennisGray"
        case .BasketBall:
            return "iconSoccerGray"
//            return "iconBasketballGray"
        case .Soccer:
            return "iconSoccerGray"
//            return "iconSoccerGray"
        case .Esport:
            return "iconSoccerGray"
//            return "iconEsportGray"
        case .Other:
            return "iconSoccerGray"
        default:
            return "iconSoccerGray"
        }
    }
    func blueImageName () -> String {
        switch self {
        case .Pool:
            return "iconSoccerBlue"
//            return "iconPoolBlue"
        case .Volley:
            return "iconSoccerBlue"
//            return "iconVolleyBlue"
        case .Tennis:
            return "iconSoccerBlue"
//            return "iconTennisBlue"
        case .BasketBall:
            return "iconSoccerBlue"
//            return "iconBasketballBlue"
        case .Soccer:
            return "iconSoccerBlue"
        case .Esport:
            return "iconSoccerBlue"
//            return "iconEsportBlue"
        case .Other:
            return "iconSoccerBlue"
        default:
            return "iconSoccerBlue"
        }
    }
    func defaultImageName () -> String {
        switch self {
        case .Pool:
            return "imgSoccer2"
//            return "imgPool"
        case .Volley:
            return "imgSoccer2"
//            return "imgVolley"
        case .Tennis:
            return "imgSoccer2"
//            return "imgTennis"
        case .BasketBall:
            return "imgSoccer2"
//            return "imgBasketball"
        case .Soccer:
            return "imgSoccer2"
//            return "imgSoccer1"
        case .Esport:
            return "imgSoccer2"
//            return "imgEsport"
        case .Other:
            return "imgSoccer2"
        default:
            return "imgSoccer2"
        }
    }
}
