//
//  PSAssistiveTouch.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/23.
//  Copyright © 2020 Andy Chen. All rights reserved.
//
// refer to 收合式_輔助欄
import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class PSAssistiveTouch: UIWindow {
    
    enum AssistiveTouchEvent {
        case addMoney
        case filter
        case bet
        case refresh
        case choseLeague
        case allLeague
        case europeCap
        case hongKongCap
        case sortByTime
        case sortByLeague
        case close
    }
    enum DisableFunc {
        case choseLeague
        case oddsType
        case sorted
        case bet
    }
    // isHidden 消失/出現
    static var share: PSAssistiveTouch =  PSAssistiveTouch()
    enum MainViewType {
        case normal
//        case toolView
//        case filterView
        
        var width: CGFloat {
            switch self {
            case .normal:
                return pWidth(46)
//            case .filterView:
//                return 273.0
//            case .toolView:
//                return 276.0
            }
        }
    }
    
    private let disposeBag = DisposeBag()
    private let containerView = UIView()
    private let mainButton = UIButton()
    private var isOpen = false
    private let pan = UIPanGestureRecognizer()
    private var mainView: UIView? = nil
    private var mainType: MainViewType = .normal {
        didSet {
            addMainView()
        }
    }
//    fileprivate lazy var toolView: ToolView = {
//
//        return ToolView()
//    }()
//    fileprivate lazy var filterView: FilterView = {
//        let filterView = FilterView()
//        filterView.initState()
//        return filterView
//    }()
    
    init( mainViewType: MainViewType = .normal) {
        super.init(frame: CGRect(x: Views.screenWidth - pWidth(66) - pWidth(13) ,
                                 y: Views.screenHeight - Views.tabBarHeight - pWidth(66)*2 - pWidth(9)*2,
                                 width: pWidth(66),
                                 height: pWidth(66)))
//        mainButton.kf.setImage(with: UIImage(named:"imgTimeLimitedMission"), for: .normal)
        setIconURL()
        setupViews()
        bind()
        mainType = mainViewType
        addMainView()
        windowLevel = .alert
        clipsToBounds = true
    }
    func setIconURL(urlString:String = "")
    {
        if let imgURL = URL(string: urlString) {
              mainButton.kf.setImage(with: imgURL, for: .normal)
        } else {
            mainButton.setImage(UIImage(named: "imgTimeLimitedMission"), for: .normal)
        }
    }
//    func initLeagure(){
//        filterView.initLeague()
//    }
//
//    func refreshBalance(){
//        toolView.refreshBalance()
//    }
//    func setDisable(_ disableFuncs:[DisableFunc]){
//        disableFuncs.forEach { (event) in
//            switch event {
//            case .choseLeague:
//                filterView.setDisable(.choseLeague)
//            case .oddsType:
//                filterView.setDisable(.oddsType)
//            case .sorted:
//                filterView.setDisable(.sorted)
//            case .bet:
//                toolView.setDisable(.bet)
//            default:
//                break
//            }
//        }
//    }
    
    func initState(){
//        filterView.initState()
//        toolView.initState()
    }
    
    func bind() {
        
//        toolView.rx.event(.filter).subscribeSuccess {[weak self] (_) in
//            guard let weakSelf = self else { return }
//            weakSelf.mainType = .filterView
//        }.disposed(by: disposeBag)
//
//
//        filterView.rx.event(.close).subscribeSuccess {[weak self] (_) in
//             guard let weakSelf = self else { return }
//            weakSelf.mainType = .toolView
//        }.disposed(by: disposeBag)
//
//        toolView.rx.event(.refresh)
//        .flatMap(Beans.sportServer.getBalance)
//        .subscribeSuccess {[weak self] (balanceDto) in
//            guard let weakSelf = self else { return }
//            weakSelf.toolView.cashLb.text = "\(balanceDto.balance)".numberFormatter(.currency, 2)
//        }.disposed(by: disposeBag)
//
//        toolView.rx.event(.addMoney).subscribeSuccess {(_) in
//             guard let topVC = UIApplication.topViewController() else {return}
//            PaymenetBottomSheet().start(viewController: topVC)
//        }.disposed(by: disposeBag)
        
        pan.rx.event
            .subscribeSuccess { (gesture) in
                switch gesture.state {
                case .changed:
                    let tra = gesture.translation(in: UIApplication.shared.keyWindow)
                    gesture.setTranslation(.zero, in: UIApplication.shared.keyWindow)
                    self.draggedView(tra)
                case .ended:
                    self.checkPosiotion()
                default:
                    break
                }
            }.disposed(by: disposeBag)
        
        mainButton.rx.tap
            .subscribeSuccess { [weak self] in
                guard let _ = self else { return }
                if let _ = UIApplication.topViewController() as? PSLiveDetailVC
                {
                    Beans.matomoServer.track(eventWithCategory: MCategory.StreamLiveRoomPage.rawValue,
                                             action: MAction.leaveRoom.rawValue)
                    Beans.matomoServer.track(eventWithCategory: MCategory.StreamLiveRoomPage.rawValue,
                                             action: MAction.checkItOut.rawValue,
                                             name: MName.timeLimitIcon.rawValue)
                }else
                {
                    switch PSTabBarController.share.frontView.value {
                    case AllTabVC.Home:
                        Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                                 action: MAction.checkItOut.rawValue,
                                                 name: MName.timeLimitIcon.rawValue)
                    case AllTabVC.Attent:
                        Beans.matomoServer.track(eventWithCategory: MCategory.AttentPage.rawValue,
                                                 action: MAction.checkItOut.rawValue,
                                                 name: MName.timeLimitIcon.rawValue)
                    case AllTabVC.Schedule:
                        Beans.matomoServer.track(eventWithCategory: MCategory.SchedulePage.rawValue,
                                                 action: MAction.checkItOut.rawValue,
                                                 name: MName.timeLimitIcon.rawValue)
                    default:
                        break
                    }
                }
                
                DispatchQueue.main.async {
//                    strongSelf.menuSwitch()
                    DeepLinkManager.share.handleDeeplink(navigation: .limitTimeTaskWall)
                }
            }.disposed(by: disposeBag)
        
//        toolView.rx.event(.bet).subscribeSuccess { [weak self](_) in
//             guard let weakSelf = self ,
//                   let topVC = UIApplication.topViewController()
//                   else { return }
//             let newVC = BetleadNavigationController(rootViewController:BetViewController())
//
//            topVC.present( newVC, animated: true, completion: {
//                weakSelf.menuSwitch()
//            })
//        }.disposed(by: disposeBag)
    }
    
    func addMainView() {
        
        var nextView = UIView()
        switch mainType {
        case .normal:
            break
//        case .filterView:
//            nextView = filterView
//        case .toolView:
//            nextView = toolView
        }
        addSubview(nextView)
        
        if mainView == nil {
            mainView = nextView
            mainView?.alpha = isOpen ? 1 : 0
            mainView?.snp.remakeConstraints({ (make) in
                make.top.bottom.right.equalToSuperview()
                make.left.equalTo(mainButton.snp.right)
            })
            return
        }
        
        nextView.alpha = isOpen ? 1 : 0
        nextView.snp.remakeConstraints { (make) in
            make.left.equalTo(mainButton.snp.right)
            make.top.bottom.right.equalToSuperview()
        }
        nextView.transform = CGAffineTransform(translationX: self.frame.maxX, y: 0)
        
        UIView.animate(withDuration: 0.3, animations: {
            nextView.transform = .identity
            self.mainView?.transform = CGAffineTransform(translationX: -self.mainType.width, y: 0)
            self.mainView?.alpha = 0
        }) { (success) in
            self.mainView?.removeFromSuperview()
            self.mainView = nextView
        }
        
    }
    
    func setupViews() {
        clipsToBounds = true
        // 要移動 打開就好
//        addGestureRecognizer(pan)
        addSubview(containerView)
        addSubview(mainButton)
        
        mainButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(pWidth(66))
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(pWidth(66))
            
        }
        
        containerView.layer.cornerRadius = pWidth(33)
        containerView.clipsToBounds = true
//        containerView.backgroundColor = UIColor(red: 59/255, green: 45/255, blue: 103/255, alpha: 0.2)
        containerView.layer.shadowColor = UIColor(red: 59/255, green: 45/255, blue: 103/255, alpha: 1.0).cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func draggedView(_ position: CGPoint) {
        let nextCenter = CGPoint(x: center.x + position.x,
                                 y: center.y + position.y)
        center = nextCenter

    }
    
    func checkPosiotion() {
        let edge: CGFloat = 0
        let maxX = Views.screenWidth - edge
        let maxY = Views.screenHeight - edge
        let minXY: CGFloat = 0
        let finalMaxX = maxX - frame.width / 2
        let finalMaxY = maxY - frame.height / 2 - Views.bottomOffsetWithTabbar
        let finalMinX = minXY + frame.width / 2
        let finalMinY = minXY + frame.height / 2 + Views.topOffset
        
        let disY = (center.y > finalMaxY) ? finalMaxY : ((center.y < finalMinY) ? finalMinY:center.y)
        if frame.maxX > maxX && frame.maxY > maxY { // 右下
            revertMenuToSafeArea(x: finalMaxX, y: finalMaxY)
        } else if frame.maxX > maxX && frame.minY < minXY { // 右上
            revertMenuToSafeArea(x: finalMaxX, y: finalMinY)
        } else if frame.minX < minXY && frame.minY < minXY { // 左上
            revertMenuToSafeArea(x: finalMinX, y: finalMinY)
        }  else if frame.minX < minXY && frame.maxY > maxY { // 左下
            revertMenuToSafeArea(x: finalMinX, y: finalMaxY)
        } else if frame.maxY > maxY { // 下
            revertMenuToSafeArea(x: center.x, y: finalMaxY)
        } else if frame.minX < minXY { // 左
            revertMenuToSafeArea(x: finalMinX, y: disY)
        } else if frame.minY < minXY { // 上
            revertMenuToSafeArea(x: center.x, y: finalMinY)
        } else if frame.maxX > maxX && frame.maxY < maxY { // 右
            revertMenuToSafeArea(x: finalMaxX, y: disY)
        } else if frame.maxX > Views.screenWidth/2
        {
            revertMenuToSafeArea(x: finalMaxX, y: disY)
        }else
        {
            revertMenuToSafeArea(x: finalMinX, y: disY)
        }
        
    }
    
    func revertMenuToSafeArea(x: CGFloat, y: CGFloat) {
        let finalCenter = CGPoint(x: x, y: y)
        UIView.animate(withDuration: 0.3) {
            self.center = finalCenter            
        }
    }
    
    func menuSwitch() {
        isOpen = !isOpen
        let resizeWidth: CGFloat = isOpen ? mainType.width + 44 : 44
        
        self.containerView.snp.updateConstraints { (make) in
            make.width.equalTo(resizeWidth)
        }
        mainButton.setImage(UIImage(named:isOpen ? "assistive-on" : "assistive-off"), for: .normal)
        
        mainView?.snp.updateConstraints({ (make) in
            make.left.equalTo(mainButton.snp.right)
        })
        
        UIView.animate(withDuration: 0.1) {
            self.mainView?.alpha = self.isOpen ? 1 : 0
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.frame.size.width = resizeWidth
            self.layoutIfNeeded()
        }) { (status) in
            self.checkPosiotion()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - edit main view
extension Reactive where Base: PSAssistiveTouch {
//    func event(_ type:PSAssistiveTouch.AssistiveTouchEvent) -> Observable<Void> {
//        switch type {
//        case .addMoney:
//            return base.toolView.rx.event(.addMoney)
//        case .bet:
//            return base.toolView.rx.event(.bet)
//        case .filter:
//            return base.toolView.rx.event(.filter)
//        case .refresh:
//            return base.toolView.rx.event(.refresh)
//        case .choseLeague:
//            return base.filterView.rx.type().filter{$0 == FilterView.FilterType.choseLeague}.map{_ in ()}
//        case .allLeague:
//            return base.filterView.rx.type().filter{$0 == FilterView.FilterType.allLeague}.map{_ in ()}
//        case .europeCap:
//            return base.filterView.rx.type().filter{$0 == FilterView.FilterType.europeCap}.map{_ in ()}
//        case .hongKongCap:
//            return base.filterView.rx.type().filter{$0 == FilterView.FilterType.hongKongCap}.map{_ in ()}
//        case .sortByTime:
//            return base.filterView.rx.type().filter{$0 == FilterView.FilterType.sortByTime}.map{_ in ()}
//        case .sortByLeague:
//            return base.filterView.rx.type().filter{$0 == FilterView.FilterType.sortByLeague}.map{_ in ()}
//        case .close:
//            return base.filterView.rx.event(.close)
//        }
//    }
}
