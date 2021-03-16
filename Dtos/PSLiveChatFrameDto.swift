//
//  PSLiveChatFrameDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/28.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class PSLiveChatFrameDto: Codable {
    
    let messageType : LiveRoomMessageType?
    let chatModel : BroadCastingListenDataDto?
    let contentFrame:CGRect?
    init(
        messageType:LiveRoomMessageType = LiveRoomMessageType(rawValue: 1)!,
        chatModel:BroadCastingListenDataDto = BroadCastingListenDataDto(),
        contentFrame:CGRect = CGRect()
         ) {
        self.messageType = messageType
        self.chatModel = chatModel
        self.contentFrame = contentFrame
    }
    
    var cellHeight :CGFloat {
        return self.content.calculateMaxHeight().height
    }
    var smallCellHeight :CGFloat {
        return self.content.calculateMaxHeight(lableWidth: (Views.screenWidth - pWidth(74) - pWidth(20) - (Views.screenWidth/5))).height
    }
    var updateData:(heat:Int,donate:Int)
    {
        if let ctDic = self.chatModel?.ctDiction,
           let heat = ctDic.room_heat,
           let donate = ctDic.donate_total
        {
            return (heat:heat,donate:donate)
        }else
        {
            return (heat:0,donate:0)
        }
    }
    var content: String {
        switch messageType {
        case .systeamMsg:
            if let systemString = self.chatModel?.ctString
            {
                return systemString
            }else
            {
                return ""
            }
        case .enterRoomMsg:
            return self.chatModel!.action?.intValue != 0 ? "离开直播间":"进入直播间"
        case .normalMsg:
            return self.chatModel!.ctString
        case .sendBarrageMsg :
            if let ctDic = self.chatModel?.ctDiction
            {
                return ctDic.content ?? ""
            }else
            {
                return ""
            }
        case .sendGiftMsg :
            if let ctDic = self.chatModel?.ctDiction
            {
                return "\(self.chatModel!.uname ?? "") 打赏给主播 \(ctDic.giftcount ?? 0)个\(ctDic.giftname ?? "")"
            }else
            {
                return ""
            }
        case .kickUser://踢房
            return self.chatModel!.ctString
        case .shutUpUser://禁言
            return self.chatModel!.ctString
        case .setAdminMsg:// 設為房管
            return self.chatModel!.ctString
        case .setAttent:// 關注
            return self.chatModel!.ctString
        case .recordMessage :
            if let ctDic = self.chatModel?.ctDiction
            {
                return ctDic.content ?? ""
            }else
            {
                return ""
            }
        default:
            return ""
        }
    }
    var userName: String {
        switch messageType {
        case .systeamMsg:
            return "系統提示"
        case .enterRoomMsg:
            if let ctDic = self.chatModel?.ctDiction
            {
                return ctDic.user_nicename ?? ""
            }else
            {
                return ""
            }
        case .normalMsg:
            if let ctDic = self.chatModel?.ctDiction
            {
                return ctDic.user_nicename ?? ""
            }else
            {
                return ""
            }
        case .sendBarrageMsg:
            return self.chatModel!.uname ?? ""
        case .sendGiftMsg:
            return ""
        case .kickUser:
            return ""
        case .shutUpUser:
            return ""
        case .setAdminMsg:
            return ""
        case .setAttent:
            return ""
        case .recordMessage:
            return self.chatModel!.uname ?? ""
        default:
            return ""
        }
    }
}
