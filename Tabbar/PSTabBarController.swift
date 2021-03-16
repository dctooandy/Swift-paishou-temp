//
//  PSTabBarController.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

struct TabbarDataList {
    let iconNmae : String
    let view :  UIViewController
    let title : String
}
//enum TabBarTitle: Int{
//    case home = 0
//    case schedule
//    case attention
//    case recharge
//    case my
//    func tabbarStringValue () -> String {
//        switch self {
//        case .home:  return "首頁".LocalizedString
//        case .schedule: return "賽程".LocalizedString
//        case .attention: return "關注".LocalizedString
//        case .recharge: return "充值".LocalizedString
//        case .my: return "我的".LocalizedString
//
//        }
//    }
//}

class PSTabBarController: UITabBarController {
    fileprivate let viewModel = PSTabBarViewModel()
    static let share = PSTabBarController()
    private var disposeBag = DisposeBag()
    private var timer: Observable<Bool>?
    var timerDisposeBag: DisposeBag?
//    enum FrontView:Int {
//        case main
//        case schedule
//        case attent
//        case recharge
//        case member
//    }
    let frontView = BehaviorRelay<AllTabVC>(value: .Home)
    var vcData = [TabbarDataList]()
    var secondItemImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        creatVCData()
        delegate = self
        timerDisposeBag = DisposeBag()
        bindViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        creatVCData()
        detectIsLogin()
        runToUserPosition()
        
    }
    func detectIsLogin()
    {
        if UserStatus.share.detectIsLogin() == true
        {
            _ = UserInfoDto.update(done: {
                
                Beans.matomoServer.setUserID(UserStatus.share.rUID)
            })
            // Matomo 設定啟動
        }else
        {
            // Matomo 設定啟動
            Beans.matomoServer.setUserID("")
        }
    }
    func runToUserPosition()
    {
        let positionInt = UserDefaults.UserInfo.integer(forKey: .UserPosition)
        switch positionInt {
        case PSVCInt.LimitTimeTaskWall.rawValue:
            DeepLinkManager.share.handleDeeplink(navigation: .limitTimeTaskWall)
            UserDefaults.UserInfo.delete(forKey: .UserPosition)
        case PSVCInt.NormalDeeplink.rawValue:
            if let deeplinkString = UserDefaults.standard.value(forKey: "directWithString") as? String ,
                UserDefaults.UserInfo.bool(forKey: .UserShouldJumpPosition) == true
            {
                UserDefaults.UserInfo.set(value: false, forKey: .UserShouldJumpPosition)
                UserDefaults.standard.removeObject(forKey: "directWithString")
                DeepLinkManager.share.handleDeeplink(navigation: .outapp(deeplinkString))
                UserDefaults.UserInfo.delete(forKey: .UserPosition)
            }
        case PSVCInt.HomeVC.rawValue:
            DeepLinkManager.share.handleDeeplink(navigation: .home)
            UserDefaults.UserInfo.delete(forKey: .UserPosition)
        case PSVCInt.ScheduleVC.rawValue:
            DeepLinkManager.share.handleDeeplink(navigation: .schedule)
            UserDefaults.UserInfo.delete(forKey: .UserPosition)
        case PSVCInt.AttentVC.rawValue:
            DeepLinkManager.share.handleDeeplink(navigation: .attent)
            UserDefaults.UserInfo.delete(forKey: .UserPosition)
        case PSVCInt.RechangeVC.rawValue:
            DeepLinkManager.share.handleDeeplink(navigation: .recharge)
            UserDefaults.UserInfo.delete(forKey: .UserPosition)
        case PSVCInt.MyInfoVC.rawValue:
            DeepLinkManager.share.handleDeeplink(navigation: .personal)
            UserDefaults.UserInfo.delete(forKey: .UserPosition)
        case PSVCInt.LiveChatRoom.rawValue:
            if let roomNum = UserDefaults.standard.value(forKey: "directToRoom") as? Int ,
                UserDefaults.UserInfo.bool(forKey: .UserShouldJumpPosition) == true
            {
                UserDefaults.UserInfo.set(value: false, forKey: .UserShouldJumpPosition)
                UserDefaults.standard.removeObject(forKey: "directToRoom")
                DeepLinkManager.share.handleDeeplink(navigation: .room(String(roomNum)))
                UserDefaults.UserInfo.delete(forKey: .UserPosition)
            }
        case PSVCInt.SearchID.rawValue:
            if let searchString = UserDefaults.standard.value(forKey: "directToSearch") as? String ,
                UserDefaults.UserInfo.bool(forKey: .UserShouldJumpPosition) == true
            {
                UserDefaults.UserInfo.set(value: false, forKey: .UserShouldJumpPosition)
                UserDefaults.standard.removeObject(forKey: "directToSearch")
                DeepLinkManager.share.handleDeeplink(navigation: .searchID(searchString))
                UserDefaults.UserInfo.delete(forKey: .UserPosition)
            }
        default:break
            
        }
    }
}
extension PSTabBarController{
    func creatVCData(){
        let tabbarHome = TabbarDataList(iconNmae: "Tabbar0", view: HomeMainViewController(), title: AllTabVC.Home.tabbarStringValue())
        let tabbarSchedule = TabbarDataList(iconNmae: "Tabbar1", view: ScheduleMainViewController(), title: AllTabVC.Schedule.tabbarStringValue())
        let tabbarAttention = TabbarDataList(iconNmae: "Tabbar2", view: AttentionMainViewController(), title: AllTabVC.Attent.tabbarStringValue())
        //新的充值
        let tabbarRecharge = TabbarDataList(iconNmae: "Tabbar3", view: RechargeViewController(), title: AllTabVC.Recharge.tabbarStringValue())
        //舊的錢包

        //let tabbarRecharge = TabbarDataList(iconNmae: "Tabbar3", view: MyInfoCoinViewController(), title: AllTabVC.Recharge.tabbarStringValue())
        let tabbarMy = TabbarDataList(iconNmae: "Tabbar4", view: MyInfoMainViewController(), title: AllTabVC.MyInfo.tabbarStringValue())
        vcData.append(tabbarHome)
        vcData.append(tabbarSchedule)
        vcData.append(tabbarAttention)
        vcData.append(tabbarRecharge)
        vcData.append(tabbarMy)
        
        var vcs = [UIViewController]()
        vcData.forEach{
            let vc = PSNavigationController(rootViewController: $0.view)
            vcs.append(vc)
        }
        viewControllers = vcs
        setTabarItems()
       
    }
    func setTabarItems(){
        
        tabBar.items?.enumerated().forEach({ (index, tabbarItem) in

            tabbarItem.image = UIImage(named: "\( vcData[index].iconNmae )")
            tabbarItem.selectedImage = UIImage(named: "\( vcData[index].iconNmae )_selected")
            tabbarItem.title = vcData[index].title
            tabbarItem.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
            tabbarItem.setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .selected)
        })
        tabBar.barTintColor = UIColor.white
        
    }
}
//  MARK: - UITabBarControllerDelegate
extension PSTabBarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        if let vc = viewController.children.first
        {
            DeepLinkManager.share.navigation.popAllToTopVC()
//            vc.navigationController?.popToRootViewController(animated: true)
            if let app = (UIApplication.shared.delegate as? AppDelegate),
                app.isLogin == true
            {
                return true
            }else
            {
                if vc.isKind(of: HomeMainViewController.self) ||
                    vc.isKind(of: ScheduleMainViewController.self)
                {
                    return true
                }else
                {
                    if vc.isKind(of: AttentionMainViewController.self)
                    {
                        UserDefaults.UserInfo.set(value: PSVCInt.AttentVC.rawValue, forKey: .UserPosition)
                    }
                    if vc.isKind(of: RechargeViewController.self)
                    {
                        UserDefaults.UserInfo.set(value: PSVCInt.RechangeVC.rawValue, forKey: .UserPosition)
                    }
                    if vc.isKind(of: MyInfoMainViewController.self)
                    {
                        UserDefaults.UserInfo.set(value: PSVCInt.MyInfoVC.rawValue, forKey: .UserPosition)
                    }
                    showDetaultAlert()
                    return false
                }
            }
        }else
        {
            return false
        }
    }
    func showDetaultAlert()
    {
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(DefaultAlert(mode: .GoLoginSighup), animated: true, completion: nil)
        }
        _ = LoadingViewController.dismiss()
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = 0.2
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.fromValue = CGFloat(0.9)
        animation.toValue = CGFloat(1.1)

        tabBarController.tabBar.subviews[tabBarController.selectedIndex+1].layer.add(animation, forKey: "transform.scale")
        if let acceptData = AllTabVC.init(rawValue: tabBarController.selectedIndex)
        {
            
            Beans.matomoServer.track(eventWithCategory: PSTabBarController.share.frontView.value.tabbarStringValue(),
                                     action: MAction.tabbar.rawValue,
                                     name: acceptData.tabbarStringValue())
            PSTabBarController.share.frontView.accept(acceptData)
        }
//        switch tabBarController.selectedIndex {
//        case 0:
//            
//        case 1:
//            PSTabBarController.share.frontView.accept(.Schedule)
//        case 2:
//            PSTabBarController.share.frontView.accept(.Attent)
//        case 3:
//            PSTabBarController.share.frontView.accept(.Recharge)
//        case 4:
//            PSTabBarController.share.frontView.accept(.MyInfo)
//        default:break
//        }
    }
    
    func coculateDate(dateArray:[(sTime: String, eTime:String)] =
        [
            (sTime: "noData", eTime:"noData")
        ])
    {
        switch frontView.value {
        case .Home,.Schedule,.Attent:
            if let data = dateArray.first,
            data.sTime != "noData"
            {
                Log.v("限時任務時間 :\(dateArray)")
                let newArray = dateArray.sorted { (d1, d2) -> Bool in
                    return d1.sTime < d2.sTime
                }
                for dateTuple in newArray
                {
                    if let startDate = dateTuple.sTime.toDate(format: "yyyy-MM-dd H:mm:ss"),
                        let endSDate = dateTuple.eTime.toDate(format: "yyyy-MM-dd H:mm:ss")
                    {
                        let tuple = Date.assistiveOpenBetweenDate(from: startDate, to: endSDate)
                        let countDownTime = tuple.second
                        let open = tuple.open
                        PSAssistiveTouch.share.isHidden = !open
                        if countDownTime > 0
                        {
                            PSTabBarController.share.setTimer(countDownTime: countDownTime)
                            PSTabBarController.share.bindTimer()
                            break
                        }else
                        {
                            self.stopTimer()
                        }
                    }else
                    {
                        PSAssistiveTouch.share.isHidden = true
                    }
                }
            }else
            {
                PSAssistiveTouch.share.isHidden = true
            }
        case .MyInfo,.Recharge:
            PSAssistiveTouch.share.isHidden = true
        }
    }
    func setTimer(countDownTime:Int)
    {
        
        timer = Observable<Int>.timer(0, period: 60*Double(countDownTime), scheduler: MainScheduler.instance).map { [weak self] (index) -> Bool in
            guard let _ = self , index != 0 else { return false}
            print("countDownTime : \(index%countDownTime)")
            return true
        }
    }
    func bindTimer()
    {
        PSTabBarController.share.timerDisposeBag = nil
        PSTabBarController.share.timerDisposeBag = DisposeBag()
        timer?.subscribeSuccess({ [weak self](success) in
            if success == true
            {
                let noewStatus = PSAssistiveTouch.share.isHidden
                PSAssistiveTouch.share.alpha = (noewStatus == true) ? 0 : 1
                UIView.animate(withDuration: 0.3) {
                    PSAssistiveTouch.share.isHidden = !noewStatus
                    PSAssistiveTouch.share.alpha = (noewStatus == true) ? 1 : 0
                }
                self?.fetchLimitTaskDate()
            }
        }).disposed(by: timerDisposeBag!)
    }
    func stopTimer()
    {
        timerDisposeBag = DisposeBag()
    }
    func fetchLimitTaskDate()
    {
        viewModel.fetchLimitedActivityListData()
    }
    func bindViewModel()
    {
        viewModel.rxFetchLimitiedActivitySuccess().subscribeSuccess { (dto) in
            if let dataOne = dto.first,
                let iconURLString = dataOne.icon
            {
                PSAssistiveTouch.share.setIconURL(urlString: iconURLString)
                var timeArray:[(sTime: String, eTime:String)] = []
                for data in dto {
                    timeArray.append(data.mapTime())
                }
                PSTabBarController.share.coculateDate(dateArray: timeArray)
            }else
            {
                PSAssistiveTouch.share.isHidden = true
            }
            
        }.disposed(by: disposeBag)
    }
}
extension Reactive where Base:PSTabBarController{
    var frontView:Observable<AllTabVC> {
        return base.frontView.asObservable().do(onNext: { frontView in
            Log.v("frontView: \(self.base.frontView.value)")
            PSTabBarController.share.fetchLimitTaskDate()
        })
    }
}
