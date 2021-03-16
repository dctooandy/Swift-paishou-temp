//
//  Themes.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class Themes {
    // MARK: - PLK
    // colors
    static let plkMode = DayNightStyle.share.interFaceStyle.asObservable()
    static let thaiPrimaryAndDisPrimary: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.01960784314, green: 0.02352941176, blue: 0.03529411765, alpha: 1), dark: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
    static let plkBlackAndWhite: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.01960784314, green: 0.02352941176, blue: 0.03529411765, alpha: 1), dark: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
    static let plkGrayLineColor: Observable<UIColor> = Themes.bindDayNightStyle(
    light: #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7882352941, alpha: 1), dark: #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3490196078, alpha: 1))
    static let plkGrayLabelTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
    light: #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7882352941, alpha: 1), dark: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1))
    static let thaiBrownAndBrown: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.337254902, green: 0.1921568627, blue: 0.3019607843, alpha: 1), dark: #colorLiteral(red: 0.337254902, green: 0.1921568627, blue: 0.3019607843, alpha: 1))
    static let dreamWorkPinkAndWhite: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.862745098, green: 0.2, blue: 0.4, alpha: 1), dark: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
    static let dreamWorkBlackAndBase: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .black, dark: Themes.primaryBase)
    static let dreamWorkBlackAndGrayBase: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .black, dark: Themes.grayBase)
    static let dreamWorkBaseAndBaseDark: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.primaryBase, dark: Themes.primaryDarkBase)
    static let dreamWorkBaseAndWhite: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.primaryBase, dark: .white)
    static let dreamWorkWhiteAndDarkBase: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white, dark: .white)
    static let dreamWorkBlackAndGrayLight: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .black, dark: Themes.grayLight)
    static let dreamWorkGrayLightAndDarkBase: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayLight, dark: Themes.primaryDarkBase)
    static let dreamWorkGrayLightAndWhite: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayLight, dark: .white)
    static let dreamWorkGrayDarkAndGrayLight: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayDark, dark: Themes.grayLight)
    static let dreamWorkGrayDarkAndWhite: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayDark, dark: .white)
    static let dreamWorkGrayLightestAndLighterDarkBlus: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayLightest, dark: Themes.lighterDarkBlue)
    static let dreamWorkGrayLightestAndClear: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayLightest, dark: .clear)
    static let dreamWorkCategoryBgColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5) , dark: #colorLiteral(red: 0.1019607843, green: 0.1333333333, blue: 0.2, alpha: 0.5) )
    // UIColor(red: 255, green: 255, blue: 255, a: 0.5)
    // UIColor(red: 26, green: 34, blue: 51, a: 0.5)
    static let dreamWorkCategoryShadowColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .black, dark: .white)
    static let dreamWorkTabbarIcon: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white, dark: #colorLiteral(red: 0.5764705882, green: 0.6235294118, blue: 0.7215686275, alpha: 1)) //UIColor(rgb: 0x939FB8)
    static let dreamWorkContentTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayDarker, dark: Themes.grayLight)
    static let dreamWorkGrayBaseAndDarkBase: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayBase, dark: Themes.primaryDarkBase)
    static let plkRetrieveBtnTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white, dark: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1))
    static let dreamWorkGrayBaseAndGrayLightest: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayBase, dark: Themes.grayLightest)
    static let dreamWorkPrimaryBaseAndYellow:Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.primaryBase, dark: Themes.secondaryYellow)
    
    static let dreamWorkGrayLighterAndClear:Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.grayLighter, dark: .clear)
    static let thaiInboxBorderColor:Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.9294117647, green: 0.8745098039, blue: 0.9058823529, alpha: 1), dark: #colorLiteral(red: 0.9294117647, green: 0.8745098039, blue: 0.9058823529, alpha: 1))
    static let dreamWorkFanmenuColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.primaryBase, dark: Themes.primaryDarkBase)
    static let dreamWorkCartBnP: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.2252708972, green: 0.4284061193, blue: 0.9337908626, alpha: 1), dark: #colorLiteral(red: 0.7146912813, green: 0.1287701428, blue: 0.8777341247, alpha: 1))
    static let dreamWorkMyCartYnP: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 1, green: 0.8351698518, blue: 0, alpha: 1), dark: #colorLiteral(red: 0.7146912813, green: 0.1287701428, blue: 0.8777341247, alpha: 1))
    static let dreamWorkMyCartBnD: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.2252708972, green: 0.4284061193, blue: 0.9337908626, alpha: 1), dark: #colorLiteral(red: 0.01960784314, green: 0.02352941176, blue: 0.03529411765, alpha: 1))
    
    // images
    static let dreamWorkMaintainImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "system-maintain"),
        dark: UIImage(named: "system-maintain-dark"))
    static let dreamWorkBgImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "background-light"),
        dark: UIImage(named: "background-dark"))
    static let dreamWorkMonkeyImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "icon-monkey-light"),
        dark: UIImage(named: "icon-monkey-dark"))
    static let dreamWorkMenuBgImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "icon-menu-bg"),
        dark: UIImage(named: "icon-menu-bg-dark"))
    static let dreamWorkLogoImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "icon-logo"),
        dark: UIImage(named: "icon-logo"))
    static let dreamWorkMegaphoneImg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "icon-megaphone-light"),
        dark: UIImage(named: "icon-megaphone-dark"))
    static let dreamWorkMenuArrowImg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "icon-categoryArrow-light"),
        dark: UIImage(named: "icon-categoryArrow-dark"))
    static let dreamWorkNavigationBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "bgLettery"),
        dark: UIImage(named: "bgLettery"))
    static let plkNavigationBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: Views.screenWidth, height: Views.topOffset), colors: [#colorLiteral(red: 0, green: 0.6862745098, blue: 0.6862745098, alpha: 1),#colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1)], locations: [0],makes: .vertical),
        dark: UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: Views.screenWidth, height: Views.topOffset), colors: [#colorLiteral(red: 0, green: 0.6862745098, blue: 0.6862745098, alpha: 1),#colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1)], locations: [0],makes: .vertical))
    static let thaiPersionNavigationBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "bgLettery"),
        dark: UIImage(named: "bgLettery"))
    static let thaiBankManageNavigationBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "bgTransaction"),
        dark: UIImage(named: "bgTransaction"))
    static let thaiPromotionNavigationBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "bgTransaction"),
        dark: UIImage(named: "bgTransaction"))
    static let thaiTXRecordNavigationBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "bgTransaction"),
        dark: UIImage(named: "bgTransaction"))
    static let dreamWorkMemberTopBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "bgPersonal"),
        dark: UIImage(named: "bgPersonal"))
    static let dreamWorkSignSuccessImg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "picParlay"),
        dark: UIImage(named: "picParlay"))
    static let dreamWorkGuessGameImg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "picBetSun"),
        dark: UIImage(named: "picBetNight"))
    static let dreamWorkGuessGameColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.1043103561, green: 0.1358509958, blue: 0.1995867193, alpha: 1),
        dark: UIColor.clear)
    static let dreamWorkCartImg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "icon-dreamworkCart-light"),
        dark: UIImage(named: "icon-dreamworkCart-dark"))
    static let dreamWorkCartHorseImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "iconHorseDay"),
        dark: UIImage(named: "iconHorseNight"))
    // PLK
    static let plkLoginSignupBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIColor.white.image(),
        dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1).image())
    static let plkLogin_D_N_Image: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: Themes.plkButtonOrange.image(),
        dark: Themes.plkButtonLightBlue.image())
    static let plkNoticeBellBg: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIImage(named: "notice"),
        dark: UIImage(named: "noticeNight"))
    static let plkLoginSignupBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: UIColor.white,
        dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1))
    static let plkLoginSignupBgColorImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIColor.white.image(),
        dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1).image())
    static let plkMarketBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1),
        dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1))
    static let plkTF_PHColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: plkAccountWhite,
        dark: plkAccountDark)
    static let plkTF_BDColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: plkAccountDark,
        dark: .white)
    static let plkLogin_D_N_TextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white,
        dark: .black)
    static let plkLogin_D_N_Color: Observable<UIColor> = Themes.bindDayNightStyle(
        light: Themes.plkButtonOrange,
        dark: Themes.plkButtonLightBlue)

    static let plkNotice_D_N_TextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1),
        dark: #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7882352941, alpha: 1))
    static let plkHeader_D_N_TextColor: Observable<UIColor> = Themes.bindDayNightStyle(
         light: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1),
         dark: .white)
    static let plkHeaderViewBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: UIColor.white,
        dark: #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 0.07802652311))
    static let plkHeaderViewBgColorImage: Observable<UIImage?> = Themes.bindDayNightStyle(
        light: UIColor.white.image(),
        dark: #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 0.07802652311).image())
    static let plk_D_N_BackgroundColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white,
        dark: .black)
    static let plk_D_N_DefaultViewColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white,
        dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1))
    static let plk_D_N_DefaultViewBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: UIColor.white,
        dark: #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 0.0765001313))
    static let plk_D_N_DefaultViewOrangeBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.9964007735, green: 0.9539319873, blue: 0.9263538718, alpha: 1),
        dark: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 0.0765001313))
    static let plk_D_N_DefaultLineBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1),
        dark: #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3490196078, alpha: 1))
    static let plkPromotionHeaderBgColor: Observable<UIColor?> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.9254901961, alpha: 1),
        dark: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1))
    static let plkMemberPagePromoColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.2705882353, green: 0.8588235294, blue: 0.8745098039, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    static let plkMemberPageLogoutColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    static let plkFilterCancelBtnBGColor: Observable<UIColor> = Themes.bindDayNightStyle(light: .white, dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1))
    static let plkFilterCancelBtnBorderColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    static let plkFilterCancelBtnTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    static let plkFilterConfrimBtnBGColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    static let plkFilterConfrimBtnBorderColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    static let plkFilterConfrimBtnTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.9254901961, alpha: 1),
        dark: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1))
    static let plkFilterTopViewTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .black,
        dark: .white)
    static let plkFilterTopViewTextFieldColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white,
        dark: .black)
    static let plkFilterTopViewColorViewColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1),
        dark: #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1))
    
    static let plkFilterCollectionViewCellBGColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3490196078, alpha: 1),
        dark: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1))
    static let plkFilterCollectionViewCellTextColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1),
        dark: #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.9254901961, alpha: 1))
    static let plkHelpingCenterBGColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: .white,
        dark: #colorLiteral(red: 0.1235565171, green: 0.1235801354, blue: 0.1235490516, alpha: 1))
    static let plkHelpingCenterCellBGColor: Observable<UIColor> = Themes.bindDayNightStyle(
        light: #colorLiteral(red: 0.9921568627, green: 0.9529411765, blue: 0.9294117647, alpha: 1),
        dark: #colorLiteral(red: 0.1882352941, green: 0.1490196078, blue: 0.1215686275, alpha: 1))

    static let primaryLight =           #colorLiteral(red: 0.7562867999, green: 0.8157304525, blue: 0.9662018418, alpha: 1) //UIColor(rgb: 0xB4C4F4)
    static let primaryBase =            #colorLiteral(red: 0.276979208, green: 0.5224077106, blue: 0.9479373097, alpha: 1) //UIColor(rgb: 0x386DEE)
    static let thaiPrimaryBase =        #colorLiteral(red: 0.9772319198, green: 0.09516542405, blue: 0.4699761868, alpha: 1) //UIColor(rgb: 0xF91878)
    static let thaiDisPrimaryBase =     #colorLiteral(red: 0.9921568627, green: 0.7882352941, blue: 0.8705882353, alpha: 1) //UIColor(rgb: 0xFDC9DE)
    static let primaryDark =            #colorLiteral(red: 0.4984282851, green: 0.3804148436, blue: 0.7240582705, alpha: 1) //UIColor(rgb: 0x6b49aa)
    static let mediumPurple  =          #colorLiteral(red: 0.2817398012, green: 0.5224496126, blue: 0.9479356408, alpha: 0.1974789916) //UIColor(red: 57, green: 109, blue: 238, a: 0.2)
    static let secondaryBlue =          #colorLiteral(red: 0.1246054992, green: 0.6963170767, blue: 1, alpha: 1) //UIColor(rgb: 0x20a0ff)
    static let primaryDarkBase =        #colorLiteral(red: 0.1342917979, green: 0.1804454923, blue: 0.2607811391, alpha: 1) //UIColor(rgb: 0x1A2233)
    
    static let textFieldDisableColor =  #colorLiteral(red: 0.9497298598, green: 0.9597520232, blue: 0.9751502872, alpha: 1) //UIColor(rgb: 0xeff2f7)
    static let saveMoneyLayerColor =    #colorLiteral(red: 0.3188007772, green: 0.6463138461, blue: 0.6681913137, alpha: 1) //UIColor(rgb: 0x43959A)
    static let cashOutMoneyLayerColor = #colorLiteral(red: 0.7958807945, green: 0.2587898374, blue: 0.2247714698, alpha: 1) //UIColor(rgb: 0xBD2D2C)
        
    static let transMoneyLayerColor =   #colorLiteral(red: 0.2374411821, green: 0.5125886798, blue: 0.8580445647, alpha: 1) //UIColor(rgb: 0x306CD2)
    static let trueGreenLayerColor =    #colorLiteral(red: 0.4665502906, green: 0.7891641855, blue: 0.2903823555, alpha: 1) //UIColor(rgb: 0x67c23a)
    static let falseRedLayerColor =     #colorLiteral(red: 0.9937559962, green: 0.4294646978, blue: 0.405785948, alpha: 1) //UIColor(rgb: 0xfa5555)
    static let lineBlueColor =          #colorLiteral(red: 0, green: 0.4028927088, blue: 0.7550407052, alpha: 1) //UIColor(rgb: 0x0250B3)
    static let darkBlueLayer =          #colorLiteral(red: 0, green: 0.2014939785, blue: 0.452676177, alpha: 1) //UIColor(rgb: 0x012460)
    static let deepDarkBlue =           #colorLiteral(red: 0, green: 0.1653325558, blue: 0.3455856442, alpha: 1) //UIColor(rgb: 0x001E46)
    static let lightBlueLayer =         #colorLiteral(red: 0.06385556608, green: 0.6435599327, blue: 1, alpha: 1) //UIColor(rgb: 0x1790FF)
    static let grayLayer =              #colorLiteral(red: 0.8797392845, green: 0.8797599673, blue: 0.8797488809, alpha: 1) //UIColor(rgb: 0xD9D9D9)
    static let leadingBlueLayer =       #colorLiteral(red: 0.1595760882, green: 0.3983257115, blue: 0.7345584035, alpha: 1) //UIColor(rgb: 0x204FAD)
    static let middleBlueLayer =        #colorLiteral(red: 0.2222878933, green: 0.5017545223, blue: 0.7986734509, alpha: 1) //UIColor(rgb: 0x2D6AC0)
    static let traillingBlueLayer =     #colorLiteral(red: 0.2806423008, green: 0.5997754931, blue: 0.8612118959, alpha: 1) //UIColor(rgb: 0x3A85D3)
    static let hintCellBackgroundBlue = #colorLiteral(red: 0.907033205, green: 0.9717236161, blue: 1, alpha: 1) //UIColor(rgb: 0xE2F6FF)
    static let placeHolderPrimyGary =   #colorLiteral(red: 0.7877369523, green: 0.7877556682, blue: 0.7877456546, alpha: 1) //UIColor(rgb: 0xBDBDBD)
    static let placeHolderDarkGary =    #colorLiteral(red: 0.6214879155, green: 0.6215029359, blue: 0.6214948893, alpha: 1) //UIColor(rgb: 0x8D8D8D)
    static let placeHolderlightGary =   #colorLiteral(red: 0.9499492049, green: 0.9499714971, blue: 0.9499594569, alpha: 1) //UIColor(rgb: 0xEFEFEF)
    static let searchFieldBackground =  #colorLiteral(red: 0, green: 0.1629849076, blue: 0.3752797246, alpha: 1) //UIColor(rgb: 0x011D4D)
    static let sectionBackground =      #colorLiteral(red: 0.9688121676, green: 0.9688346982, blue: 0.9688225389, alpha: 1) //UIColor(rgb: 0xF5F5F5)
    static let gradientStartBlue =      #colorLiteral(red: 0, green: 0.2166941166, blue: 0.4762909412, alpha: 1) //UIColor(rgb: 0x002766)
    static let gradientEndBlue =        #colorLiteral(red: 0, green: 0.103553243, blue: 0.2562506497, alpha: 1) //UIColor(rgb: 0x001332)
    static let gradientCenterYellow =   #colorLiteral(red: 0.986322701, green: 0.8755683303, blue: 0.08216428012, alpha: 1) //UIColor(rgb: 0xFADB14)
    static let labelBlue =              #colorLiteral(red: 0.3218984604, green: 0.6333354115, blue: 0.9761598706, alpha: 1) //UIColor(rgb: 0x438DF7)
    static let infoLineLabelBlue =      #colorLiteral(red: 0.4245347977, green: 0.6839643717, blue: 0.9791939855, alpha: 1) //UIColor(rgb: 0x5B9CF8)
    static let titleLabelBlack =        #colorLiteral(red: 0.1980366409, green: 0.1980422437, blue: 0.1980392635, alpha: 1) //UIColor(rgb: 0x262626)
    static let timeLabelBlack =         #colorLiteral(red: 0.6214879155, green: 0.6215029359, blue: 0.6214948893, alpha: 1) //UIColor(rgb: 0x8d8d8d)
    static let cellSelected =           #colorLiteral(red: 0.9684337974, green: 0.9846780896, blue: 1, alpha: 1) //UIColor(rgb: 0xf5faff)
    static let btnBackgroundBlue =      #colorLiteral(red: 0, green: 0.4028792381, blue: 0.755041182, alpha: 1) //UIColor(rgb: 0x0050b3)
    static let menuSelected =           #colorLiteral(red: 0.5003341436, green: 0.4626769423, blue: 0.67881006, alpha: 1) //UIColor(rgb: 0x6C609D)
    static let primeBackground =        #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) //UIColor(rgb: 0xffffff)
    static let primeBtnPupple =         #colorLiteral(red: 0.2579548359, green: 0.1959872246, blue: 0.4525668621, alpha: 1) //UIColor(rgb: 0x322260)
    static let secondaryOrange =        #colorLiteral(red: 0.9858011603, green: 0.5599089861, blue: 0.004855574574, alpha: 1) //UIColor(rgb: 0xf87b09)
    static let grayDarker =             #colorLiteral(red: 0.2957803607, green: 0.3476936221, blue: 0.4364365339, alpha: 1) //UIColor(rgb: 0x3b465c)
    static let badgeBackgroundRed =     #colorLiteral(red: 1, green: 0.3850291669, blue: 0.3553077579, alpha: 1) //UIColor(rgb: 0xff4949)
    static let grayBase =               #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3490196078, alpha: 1) //UIColor(rgb: 0x939fb8)
    static let grayLight =              #colorLiteral(red: 0.7490196078, green: 0.7803921569, blue: 0.8509803922, alpha: 1) //UIColor(rgb: 0xbfc7d9)
    static let secondaryYellow =        #colorLiteral(red: 0.968627451, green: 0.7294117647, blue: 0.1647058824, alpha: 1) //UIColor(rgb: 0xf7ba2a)
    static let pageThaiPink =           #colorLiteral(red: 0.8745098039, green: 0.02745098039, blue: 0.5215686275, alpha: 1) //UIColor(rgb: 0xDF0785)
    static let lighterDarkBlue =        #colorLiteral(red: 0.1607843137, green: 0.2039215686, blue: 0.3137254902, alpha: 1) //UIColor(rgb: 0x293450)
    // Gradient
    static let gradientStartOrange =    #colorLiteral(red: 1, green: 0.6784313725, blue: 0, alpha: 1) //UIColor(rgb: 0xffad00)
    static let gradientEndOrange =      #colorLiteral(red: 0.9764705882, green: 0.4274509804, blue: 0, alpha: 1) //UIColor(rgb: 0xf96d00)
    static let secondaryGreen =         #colorLiteral(red: 0.07450980392, green: 0.8078431373, blue: 0.4, alpha: 1) //UIColor(rgb: 0x13ce66)
    static let gradientEndGreen =       #colorLiteral(red: 0.168627451, green: 0.9137254902, blue: 0.6235294118, alpha: 1) //UIColor(rgb: 0x2be99f)
    static let gradientStartPuple =     #colorLiteral(red: 0.4823529412, green: 0.4862745098, blue: 0.9764705882, alpha: 1) //UIColor(rgb: 0x7b7cf9)
    static let gradientEndPuple =       #colorLiteral(red: 0.4862745098, green: 0.4117647059, blue: 0.9725490196, alpha: 1) //UIColor(rgb: 0x7c69f8)
    
    //border
    static let grayLightest =           #colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.968627451, alpha: 1) //UIColor(rgb: 0xf2f4f7)
    static let imagePlaceHolder = UIImage(color: Themes.placeHolderPrimyGary, size: CGSize(width: 800, height: 800))
    
    //BottomSheet
    static let grayDarkest =            #colorLiteral(red: 0.1019607843, green: 0.1333333333, blue: 0.2, alpha: 1) //UIColor(rgb: 0x1a2233)
    static let grayDark =               #colorLiteral(red: 0.4235294118, green: 0.4705882353, blue: 0.568627451, alpha: 1) //UIColor(rgb: 0x6c7891)
    static let grayLighter =            #colorLiteral(red: 0.8745098039, green: 0.8941176471, blue: 0.9294117647, alpha: 1) //UIColor(rgb: 0xdfe4ed)
    static let grayBlack =              #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1) //UIColor(rgb: 0x191919)
    static let secondaryRed =           #colorLiteral(red: 1, green: 0.2862745098, blue: 0.2862745098, alpha: 1) //UIColor(rgb: 0xff4949)
    static let thaiPink =               #colorLiteral(red: 0.7294117647, green: 0.631372549, blue: 0.7176470588, alpha: 1) //UIColor(rgb: 0xBAA1B7)
    static let thaiLineNormal =         #colorLiteral(red: 0.6980392157, green: 0.5921568627, blue: 0.6745098039, alpha: 1) //UIColor(rgb: 0xB297AC)
    static let thaiLineNoValid =        #colorLiteral(red: 0.9476569295, green: 0.1225334629, blue: 0, alpha: 1) //UIColor(rgb: 0xF21F00)
    static let thaiLineText =           #colorLiteral(red: 0.4352941176, green: 0.2784313725, blue: 0.3843137255, alpha: 1) //UIColor(rgb: 0x6F4762)
    static let darkGrey =               #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 1) //UIColor(rgb: 0x696969)
    static let peachGray =              #colorLiteral(red: 0.7254901961, green: 0.4392156863, blue: 0.8980392157, alpha: 1) //UIColor(rgb: 0xb970e5)
    
    static let plkAccountWhite =        #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7882352941, alpha: 1) //UIColor(rgb: 0xC6C6C9)
    static let plkAccountDark =         #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1) //UIColor(rgb: 0x8E8E93)
    static let plkButtonOrange =        #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1) //UIColor(rgb: 0xF76B1C)
    static let plkButtonGray =          #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1) //UIColor(rgb: 0x8E8E93)
    static let plkButtonLightBlue =     #colorLiteral(red: 0, green: 1, blue: 0.9215686275, alpha: 1) //UIColor(rgb: 0x00FFEB)
    static let plkLabelVisial =         #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1) //UIColor(rgb: 0xF76B1C)
    static let plkLabelDisVisial =      #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1) //UIColor(rgb: 0x7A7A7A)
    
    static let plkSelectOriginBG =      #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 0.07689403887) //UIColor(rgb: 0xF76B1C)
    static let plkUnSelectOriginBG =    #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //UIColor(rgb: 0x7A7A7A)
    
    static let plkSelectOriginBorder =  #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.1098039216, alpha: 1).cgColor //UIColor(rgb: 0xF76B1C)
    static let plkUnSelectOriginBorder = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1).cgColor //UIColor(rgb: 0x8E8E93)
    
    static func cycleTopImageWithAmount(amount : CGFloat) -> UIImage
    {
        return UIImage.init().gradientImageWithColors(with:amount, bounds: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.6862745098, blue: 0.6862745098, alpha: 1)], locations: [0])!
    }
    static func cycleMiddleImageWithAmount(amount : CGFloat) -> UIImage
    {
        return UIImage.init().gradientImageWithColors(with:amount, bounds: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0.9789944291, green: 0.8321756721, blue: 0.3658004999, alpha: 1),#colorLiteral(red: 0.9692829251, green: 0.4408729076, blue: 0.1235504672, alpha: 1)], locations: [0])!
    }
    static func cycleBottomImageWithAmount(amount : CGFloat) -> UIImage
    {
        return UIImage.init().gradientImageWithColors(with:amount, bounds: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0.4317667484, green: 0.7254857421, blue: 1, alpha: 1),#colorLiteral(red: 0.2282400131, green: 0.5695993304, blue: 1, alpha: 1)], locations: [0])!
    }
    
    static let gameDetailTypeImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0, green: 0.6862745098, blue: 0.6862745098, alpha: 1),#colorLiteral(red: 0, green: 1, blue: 1, alpha: 1)], locations: [0], makes: .vertical)

    static let cycleTopImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.6862745098, blue: 0.6862745098, alpha: 1)], locations: [0])
    static let cycleMiddleImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0.9789944291, green: 0.8321756721, blue: 0.3658004999, alpha: 1),#colorLiteral(red: 0.9692829251, green: 0.4408729076, blue: 0.1235504672, alpha: 1)], locations: [0])
    static let cycleBottomImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0.4317667484, green: 0.7254857421, blue: 1, alpha: 1),#colorLiteral(red: 0.2282400131, green: 0.5695993304, blue: 1, alpha: 1)], locations: [0])
    
    static let circleTopMainColor = #colorLiteral(red: 0, green: 0.6862745098, blue: 0.6862745098, alpha: 1)
    static let circleTopGradientColor = #colorLiteral(red: 0, green: 1, blue: 1, alpha: 1)
    static let circleMiddleMainColor = #colorLiteral(red: 0.9692829251, green: 0.4408729076, blue: 0.1235504672, alpha: 1)
    static let circleMiddleGradientColor = #colorLiteral(red: 0.9789944291, green: 0.8321756721, blue: 0.3658004999, alpha: 1)
    static let circleBottomMainColor = #colorLiteral(red: 0.2282400131, green: 0.5695993304, blue: 1, alpha: 1)
    static let circleBottomGradientColor = #colorLiteral(red: 0.4317667484, green: 0.7254857421, blue: 1, alpha: 1)
    
    static let emptyImage = UIImage()
    
    static func applyNavigationBar(navBar:UINavigationBar?, isTranslucent:Bool = false) {
        guard let navBar = navBar else {
            return
        }
        navBar.isTranslucent = isTranslucent
        navBar.tintColor = .white
        navBar.barTintColor = .white
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navBar.shadowImage = emptyImage
        navBar.setBackgroundImage(UIImage(named: "bgLettery") , for: .default)
    }
    
    static func applyNavigationBar(navBar:UINavigationBar?, color:UIColor) {
        guard let navBar = navBar else {
            return
        }
        navBar.setBackgroundImage(UIImage(color:color), for:.default)
    }
    
    static func applyNavigationBarClear(navBar:UINavigationBar?, alpha:CGFloat, tinColor:UIColor) {
        guard let navBar = navBar else {
            return
        }
        navBar.isTranslucent = true
        navBar.shadowImage = emptyImage
        var red:CGFloat = 0.0;
        var green:CGFloat = 0.0;
        var blue:CGFloat = 0.0;
        var a:CGFloat = 0.0
        tinColor.getRed(&red, green:&green, blue:&blue, alpha:&a)
        navBar.setBackgroundImage(UIImage(color:UIColor(red:red, green:green, blue:blue, alpha:alpha)), for:.default)
    }
    static func createGradientBgView() -> UIImageView {
        return UIImageView(image: UIImage(named: "bgLettery") )
    }
    
    static func bindDayNightStyle<T>(light: T, dark: T) -> Observable<T> {
        return Themes.plkMode.map({ $0 == .light ? light : dark })
    }
    
    //===================拍手Color=======================//
    static let psNavigationBar = UIColor(red: 8/255, green: 61/255, blue: 217/255, alpha: 1)
    
    static let psTextColorBlue = UIColor(red: 24/255, green: 144/255, blue: 255/255, alpha: 1)
    
    static let psTextColorGray = UIColor(red: 144/255, green: 147/255, blue: 153/255, alpha: 1)
    
    static let psTextColorLightGray = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
    
    static let psTextColorFliterBule  = UIColor(red: 0/255, green: 183/255, blue: 236/255, alpha: 1)
    
    static let psTextColorSuccessGreen = UIColor(red: 82/255, green: 196/255, blue: 26/255, alpha: 1)
    
    static let psTextColorFailRed = UIColor(red: 245/255, green: 34/255, blue: 45/255, alpha: 1)
    
    static let psTextColorProcessingOrange = UIColor(red: 250/255, green: 140/255, blue: 22/255, alpha: 1)
  
    static let psMyInfoBackGround = UIColor(red: 246/255, green: 249/255, blue: 255/255, alpha: 1)
    
    static let psTextFieldBackground = UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
    
    static let psMyInfoPointOrange = UIColor(red: 255/255, green: 154/255, blue: 0/255, alpha: 1)
    
    static let psScheduleDateBackground = UIColor(red: 255/255, green: 30/255, blue: 116/255, alpha: 1)
    
    static let psScheduleBookedBackground = UIColor(red: 174/255, green: 184/255, blue: 204/255, alpha: 1)
    
    static let psInboxReadedBackground = UIColor(red: 244, green: 245, blue: 248)
    
    static let psMyInfoBananaMoneyImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 199/255, green: 0/255, blue: 57/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 87/255, blue: 51/255, alpha: 1).cgColor], locations: [0], makes: .horizontal)
    static let psMyInfoRedImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 0/255, green: 115/255, blue: 186/255, alpha: 1).cgColor, UIColor(red: 0/255, green: 183/255, blue: 236/255, alpha: 1).cgColor], locations: [0], makes: .horizontal)
    
    static let psLiveRoomSubscribeImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 223/255, green: 7/255, blue: 133/255, alpha: 1).cgColor, UIColor(red: 243/255, green: 50/255, blue: 117/255, alpha: 1).cgColor], locations: [0], makes: .horizontal)
    
    static let psMyPageRoomManagerImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 219/255, green: 194/255, blue: 136/255, alpha: 1).cgColor, UIColor(red: 101/255, green: 71/255, blue: 34/255, alpha: 1).cgColor], locations: [0], makes: .vertical)
    
    static let psHomePageLiveScheduleImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 199/255, green: 0/255, blue: 57/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 87/255, blue: 51/255, alpha: 1).cgColor], locations: [0], makes: .horizontal)
    
    static let psHomeRankImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 38/255, green: 67/255, blue: 254/255, alpha: 1).cgColor, UIColor(red: 250/255, green: 128/255, blue: 253/255, alpha: 1).cgColor], locations: [0], makes: .vertical)
    
    static let psHomeEventImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 37/255, green: 112/255, blue: 255/255, alpha: 1).cgColor, UIColor(red: 0/255, green: 235/255, blue: 209/255, alpha: 1).cgColor], locations: [0], makes: .vertical)
    static let psZillRankImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 38/255, green: 67/255, blue: 254/255, alpha: 1).cgColor, UIColor(red: 250/255, green: 128/255, blue: 253/255, alpha: 1).cgColor], locations: [0], makes: .horizontal)
    static let psStarRankImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [UIColor(red: 250/255, green: 128/255, blue: 253/255, alpha: 1).cgColor, UIColor(red: 38/255, green: 67/255, blue: 254/255, alpha: 1).cgColor], locations: [0], makes: .horizontal)
    static let psSubmitImage = UIImage.init().gradientImage(with: CGRect(x: 0, y: 0, width: 52, height: 52), colors: [#colorLiteral(red: 0, green: 0.1921568627, blue: 0.831372549, alpha: 1).cgColor,#colorLiteral(red: 0.2470588235, green: 0.568627451, blue: 1, alpha: 1).cgColor], locations: [0], makes: .vertical)
    //首頁底色
    static let homeBackGround = UIColor(red: 246, green: 249, blue: 255)
    //首頁搜尋結果上半部
    static let homeSearchResultTopView = UIColor(red: 8, green: 61, blue: 217)
    //search bar
    static let homeSearchBar = UIColor(red: 5, green: 37, blue: 130)
    //搜尋頁進入按鈕
    static let homeSearchResultEnterBtn = UIColor(red: 247, green: 30, blue: 116)
    //直播間粉色
    static let liveRoomPink = UIColor(red: 255, green: 30, blue: 116)
    //直播間背景藍
    static let liveRoomBlue = UIColor(red: 8, green: 61, blue: 217)
    //直播間主播粉圈
    static let liveRoomAnchorPink = UIColor(red: 8, green: 61, blue: 217)
    //直播間主播黃圈
    static let liveRoomAnchorYellow = UIColor(red: 8, green: 61, blue: 217)
    
    static let psTextColorliveRoomGordan = UIColor(red: 247, green: 181, blue: 0)
    
    static let psTextColorliveRoomYellow = UIColor(red: 250, green: 219, blue: 20)
    
    static let psTextColorUserTypeNormalUser = UIColor(red: 112, green: 187, blue: 255)
    
    static let psTextColorUserTypeManager = UIColor(red: 111, green: 207, blue: 55)
    
    static let psTextColorUserTypeAnchor = UIColor(red: 225, green: 175, blue: 98)
    
    static let psTextColorLiveRoomSysteam = UIColor(red: 8, green: 61, blue: 217)
    
    static let psLiveChatRoomLightBlue = UIColor(red: 0, green: 198, blue: 255, a: 0.12)
    
    static let psRoomManagerLightBlue = UIColor(red: 0, green: 145, blue: 255)
    
    static let psManagerPowerYellow = UIColor(red: 255, green: 161, blue: 0)
    
    static let psManagerPowerGray = UIColor(red: 237, green: 237, blue: 237)
    
    static let psSystemGray = UIColor(red: 225, green: 226, blue: 227)
    
    static let psTaskBlue = UIColor(red: 34, green: 216, blue: 218)
    
    static let psBackpackDarkGary = UIColor(red: 38, green: 38, blue: 38)
    
    static let psTextColorliveBackpackYellow = UIColor(red: 250, green: 173, blue: 20)
    
    static let psTextColorBackpackGary = UIColor(red: 191, green: 191, blue: 191)
    
    static let psTextColorBackpackBlue = UIColor(red: 112, green: 187, blue: 255)
    
    static let psTextColorBackpackDarkGary  = UIColor(red: 142, green: 142, blue: 147)
    
    static let psBackpackDarkRed = UIColor(red: 255, green: 77, blue: 79)
    
    static let psBackpackLightGray = UIColor(red: 229, green: 229, blue: 229)
    
    static let psVerficationGray = UIColor(red: 225, green: 226, blue: 229)
    
    static let psTextHomeEventBlack = UIColor(red: 82, green: 82, blue: 87)
    
    static let psTextHomeEventLightGary = UIColor(red: 155, green: 157, blue: 164)
    
    static let psLiveEndViewStreamGray = UIColor(red: 216, green: 216, blue: 216, a: 0.13)
    
    static let psHomeEventPlaceHolder = UIColor(red: 238, green: 238, blue: 238, a: 1)
    
    
}

extension UIColor {
    
//    convenience init(rgb: Int) {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF
//        )
//    }
    convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: alpha
        )
    }
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
//    convenience init(rgb: Int, a: CGFloat = 1.0) {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF,
//            a: a
//        )
//    }
    
}
