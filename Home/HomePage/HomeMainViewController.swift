//
//  HomeMainViewController.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import Toaster
import Parchment
import RxSwift
import RxCocoa

class HomeMainViewController: BaseViewController {
    var isAllowFetchingDataDisposeBag : DisposeBag?
    var searchBarDisposeBag: DisposeBag!
    private var _dateComponents : DateComponents = Calendar.current.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day], from: Date())
    private var pagingViewController = PagingViewController<HomeMenuItem>()
    let viewModel = HomeMainViewModel()
    private var viewControllers : [HomeSubViewController]! = []
    private let dailySignView = DailyTaskView.share
    private let fullADView = FullADView.share
    private let topImageView = UIImageView()
    private let signImageView = UIImageView()
    private let signLabel = UILabel()
    private let signRemindView = UIView()
    private let testView = UIView()
    private let searchBtn = UIButton()
    private let searchImageView = UIImageView()
    private let placeHolderLabel =  UILabel()
    
    private var searchResult = PublishSubject<Void>()
    // 1117
    private var userBonusDto : UserBonusDto?
    private var isAlreadyOpenFullADview:Bool = false
    private var passOffset = pHeight(100)
    private let selfTopOffset = pHeight(150) - Views.statusBarHeight
    override func viewDidLoad() {
        super.viewDidLoad()
        UserStatus.share.fetchConfigObjData { [weak self](dto) in
            self?.searchBarDisposeBag = DisposeBag()
            self?.viewDidLoadSecond()
        }
    }
    func viewDidLoadSecond()
    {
        LiveclassFrameDto.rxShare.subscribeSuccess { [weak self](classDto) in
            guard let classData = classDto?.list else {return}
            //                LiveclassFrameDto.share = classDto
            self?.setData(liveClass: classData)
            self?.bindViewModel()
            self?.setupUI()
            self?.fetchDailyData()
            
        }.disposed(by: self.disposeBag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let lebelString = (UserStatus.share.detectIsLogin() == true) ? "拍手任務".LocalizedString : "登录/注册".LocalizedString
        signLabel.text = lebelString
        signLabel.backgroundColor = (UserStatus.share.detectIsLogin() == true) ? UIColor.clear : #colorLiteral(red: 1, green: 0.1176470588, blue: 0.4549019608, alpha: 1)
        signRemindView.isHidden = !(UserStatus.share.detectIsLogin() == true)
        guard let nav = navigationController as? PSNavigationController else { return }
        nav.setUpVCBarStyle(vcType: .home)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showPSAssistiveTouchView()
    }
    func showPSAssistiveTouchView()
    {
        if isAlreadyOpenFullADview == true
        {
            isAllowFetchingDataDisposeBag = DisposeBag()
            PSTabBarController.share.rx.frontView.map{ $0 == .Home}.bind(to: isAllowFetchingData).disposed(by: isAllowFetchingDataDisposeBag!)
        }else
        {
//            PSAssistiveTouch.share.isHidden = true
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let nav = navigationController as? PSNavigationController else { return }
        nav.setUpVCBarStyle(vcType: .defaultstyle)
        isAllowFetchingDataDisposeBag = nil
    }
    private func setData(liveClass:[LiveclassDto])
    {
        viewModel.categoryArray.removeAll()
        for data in liveClass {
            viewModel.categoryArray.append(data)
        }
        viewControllers.removeAll()
        for categoryNum in 0...(viewModel.categoryArray.count - 1)
        {
            let caseData = viewModel.categoryArray[categoryNum]
            
//            let caseInt = viewModel.categoryArray[categoryNum].id?.intValue
//            let currentCategory = Categories.init(rawValue: caseInt ?? 0)
            let title = viewModel.categoryArray[categoryNum].name ?? ""
            let homeSubViewController = HomeSubViewController(liveclassDto: caseData)
            homeSubViewController.title = title
            guard let caseInt = caseData.id?.intValue else {return}
            switch  caseInt {
            case 100 : // 分類
                homeSubViewController.rxCellBtnTapped().subscribeSuccess { [weak self](classData) in
                    self?.directToCategory(liveclassDto: classData)

                }.disposed(by: disposeBag)
                
                homeSubViewController.viewModel.liveclassDto = caseData
            default:
                break
            }
            homeSubViewController.rxSystemViewTapped().subscribeSuccess { (index) in
                DeepLinkManager.share.handleDeeplink(navigation: .noticedetail("\(index)"))
                
            }.disposed(by: disposeBag)
            homeSubViewController.rxTableViewScrollingOffset().subscribeSuccess { [weak self] (scrollView) in
                self?.topImageViewScroll(scrollView: scrollView)
            }.disposed(by: disposeBag)
            
            homeSubViewController.rxDidTapRank().subscribeSuccess { [weak self](_) in
                let rankVC = LiveRoomRankViewController()
                //rankVC.modalPresentationStyle = .overFullScreen
                //rankVC.modalTransitionStyle = .coverVertical
                //self?.present(rankVC, animated: true, completion: nil)
                self?.navigationController?.pushViewController(rankVC, animated: true)
            }.disposed(by: disposeBag)
            
            homeSubViewController.rxDidTapEvent().subscribeSuccess { [weak self](_) in
                //Toast.show(msg: "即将推出")
//                let eventVC = HomeEventViewController()
//                self?.navigationController?.pushViewController(eventVC, animated: true)
                self?.directToActivityArea()
            }.disposed(by: disposeBag)
            viewControllers.append(homeSubViewController)
        }
    }
    private func fetchDailyData() {
        
        viewModel.fetchHomeMainVCDailyTask()
    }
    
    private func setupUI() {
        setupTopImageView()
        setupSearchBtn()
        setupPagingViewController()
    }
    
    private func setupTopImageView() {
        view.addSubview(topImageView)
        topImageView.image = UIImage(named: "home_bg")
        topImageView.isUserInteractionEnabled = true
        topImageView.contentMode = .scaleAspectFill
        topImageView.frame = CGRect(x: 0, y: 0, width: Views.screenWidth, height: pHeight(150))
    }
    
    private func setupSearchBtn() {
        topImageView.addSubview(signImageView)
        signImageView.layer.cornerRadius = pHeight(18)
        signImageView.image = UIImage(named: "imgTaskButtonBackground")
        signImageView.rx.click.subscribeSuccess { [weak self] (_) in
            
            //UserDefaults.UserInfo.set(value: true, forKey: .NeedFetchDailyTask)
            //改成任務頁入口
            if UserStatus.share.detectIsLogin() == true
            {
                Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                         action: MAction.checkTask.rawValue,
                                         name: MName.task.rawValue )
            }
            self?.triggerDailyTaskWall()
        }.disposed(by: disposeBag)
        signImageView.snp.makeConstraints { (imageView) in
            imageView.right.equalToSuperview().offset(pWidth(-20))
            imageView.centerY.equalToSuperview()
            imageView.height.equalTo(pWidth(35))
            imageView.width.equalTo(pWidth(85))
        }
        
        signImageView.addSubview(signLabel)
        signLabel.textColor = .white
        signLabel.font = Fonts.pingFangSCSemibold(15)
        signLabel.textAlignment = .center
        signLabel.applyCornerRadius(radius: pWidth(35)/2)
        signLabel.snp.makeConstraints { (label) in
            label.edges.equalToSuperview()
        }
        
        signImageView.addSubview(signRemindView)
        signRemindView.backgroundColor = UIColor(red: 247, green: 181, blue: 0)
        signRemindView.layer.cornerRadius = pHeight(2.5)
        signRemindView.clipsToBounds = true
        signRemindView.snp.makeConstraints { (view) in
            view.right.equalToSuperview().offset(pWidth(-10))
            view.centerY.equalToSuperview().offset(pHeight(-10))
            view.width.equalTo(pWidth(5))
            view.height.equalTo(pHeight(5))
        }
        
        topImageView.addSubview(searchBtn)
        searchBtn.layer.borderColor = UIColor.clear.cgColor
        searchBtn.backgroundColor = .black
        searchBtn.alpha = 0.3
        searchBtn.layer.cornerRadius = pHeight(20)
        searchBtn.rx.tap.subscribeSuccess { [weak self] (_) in
            let homeSearchResultViewController = HomeSearchResultViewController()
            self?.navigationController?.pushViewController(homeSearchResultViewController, animated: true)
        }.disposed(by: searchBarDisposeBag)
        
        searchBtn.snp.makeConstraints { (btn) in
            btn.left.equalToSuperview().offset(pWidth(20))
            btn.right.equalTo(signImageView.snp.left).offset(pWidth(-10))
            btn.height.equalTo(pHeight(35))
            btn.centerY.equalToSuperview()
        }
        
        topImageView.addSubview(searchImageView)
        searchImageView.image = UIImage(named: "search")
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.snp.makeConstraints { (imageView) in
            imageView.width.height.equalTo(pWidth(20))
            imageView.left.equalTo(searchBtn.snp.left).offset(pWidth(15))
            imageView.centerY.equalTo(searchBtn.snp.centerY)
        }
        
        topImageView.addSubview(placeHolderLabel)
        placeHolderLabel.text = "搜尋主播或直播間".LocalizedString
        placeHolderLabel.textColor = .white
        placeHolderLabel.font = Fonts.pingFangSCRegular(14)
        placeHolderLabel.snp.makeConstraints { (label) in
            label.left.equalTo(searchBtn.snp.left).offset(pWidth(40))
            label.centerY.equalTo(searchBtn.snp.centerY)
        }
    }
    
    private func setupPagingViewController() {
        pagingViewController = PagingViewController<HomeMenuItem>()
        pagingViewController.indicatorClass = RoundedIndicatorView.self
        
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.menuItemSource = .class(type: HomePagingCell.self)
        pagingViewController.menuItemSize = .fixed(width: pWidth(50), height: pWidth(75))
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: pWidth(14), bottom: 0, right: pWidth(14))
        
        pagingViewController.pageViewController.view.backgroundColor = Themes.homeBackGround
        pagingViewController.collectionView.layer.cornerRadius = 20
        pagingViewController.textColor = .black
        pagingViewController.selectedTextColor = .black
        pagingViewController.borderColor = .clear
        pagingViewController.menuBackgroundColor = Themes.homeBackGround
        pagingViewController.indicatorColor = .red
        
        //選到底線設定, spacing可調整底線長短左右間距, insets可調整底線上下位置
        pagingViewController.indicatorOptions = .visible(height: 5, zIndex: Int.max, spacing: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), insets: UIEdgeInsets(top: 0, left: 0, bottom: pWidth(22), right: 0))
//        if UIScreen.main.bounds.height > 736 {
//            pagingViewController.indicatorOptions = .visible(height: 5, zIndex: Int.max, spacing: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), insets: UIEdgeInsets(top: 0, left: 0, bottom: pHeight(10), right: 0))
//        } else {
//            pagingViewController.indicatorOptions = .visible(height: 5, zIndex: Int.max, spacing: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), insets: UIEdgeInsets(top: 0, left: 0, bottom: pHeight(5), right: 0))
//        }
        pagingViewController.dataSource = self
        pagingViewController.delegate = self
        
        setupPGVCFrame()
      
        pagingViewController.select(index: 1)
    }
    private func bindViewModel() {
        viewModel.rxFetchTaskSuccess().subscribeSuccess { [weak self] (dto) in
            if UserDefaults.standard.value(forKey: "room") != nil
            {// 需要跳轉到直播間
                DeepLinkManager.share.parserStringFromBroeser((UserDefaults.standard.value(forKey: "room") as! String))
            }else
            {
                self?.userBonusDto = dto
//                if UserStatus.share.detectIsLogin() == true
//                {
//                    self?.dailyTaskDetect()
//                }else
//                {
//                }
                self?.fullADView.showAD()
                
            }
        }.disposed(by: disposeBag)
        dailySignView.rxCloseDailyViewAction().subscribeSuccess { [weak self] _ in
//            self?.fullADView.showAD()
            self?.showPSAssistiveTouchView()
        }.disposed(by: disposeBag)
        fullADView.rxCloseADViewAction().subscribeSuccess { [weak self] _ in
            self?.isAlreadyOpenFullADview = true
            if UserStatus.share.detectIsLogin() == true
            {
                self?.dailyTaskDetect()
            }
            self?.showPSAssistiveTouchView()
        }.disposed(by: disposeBag)
//        fullADView.scrollView.rx.click.subscribeSuccess { [weak self](_) in
//            if var deeplinkString = self?.fullADView.deeplinkURL
//            {
//                // 測試
////                deeplinkString = "paishou://noticedetail/?id=5"
////                deeplinkString = "paishou://loginapp/?id=https://test.tg18.net/event/1225"
////                deeplinkString = "paishou://rank_list"
//                DeepLinkManager.share.parserStringFromBroeser(deeplinkString)
//            }
//            self?.fullADView.close()
//
//        }.disposed(by: disposeBag)
    }
    func dailyTaskDetect()
    {
        //取得今天是禮拜幾 幾號
        let yearT: Int = _dateComponents.year!
        let monthT : Int = _dateComponents.month!
        let dayT: Int = _dateComponents.day!
        
        if UserDefaults.UserInfo.dateDicArray(forKey: .DailyTaskLastOpenArray) != []
        {
            Log.v("有任務日期")
            var listArr = UserDefaults.UserInfo.dateDicArray(forKey: .DailyTaskLastOpenArray)
            
            if let userDic = listArr.filter({$0["\(UserInfoDto.share?.id ?? 0)"] != nil}).first ,
                let lastOpenDate = userDic["\(UserInfoDto.share?.id ?? 0)"]
            {
                let index = listArr.indexOfObject(object: userDic as AnyObject)
                
                if lastOpenDate[0] <= yearT
                {
                    if lastOpenDate[1] <= monthT
                    {
                        if lastOpenDate[2] < dayT
                        {
                            Log.v("任務日期小於今日,儲存今日,並開啟任務")
                            let uidString = "\(UserInfoDto.share?.id ?? 0)"
                            let dic = [uidString : [yearT,monthT,dayT]]
                            listArr.remove(at: index)
                            listArr.append(dic)
                            UserDefaults.UserInfo.set(value: listArr, forKey: .DailyTaskLastOpenArray)
                            UserDefaults.UserInfo.set(value: true, forKey: .NeedFetchDailyTask)
                            
                        }
                    }
                    
                }else
                {
                    Log.v("任務日期 等於或大於今日,判斷有無開啟過今日任務")
                }
            }else
            {
                Log.v("查無此人,設定今天")
                let uidString = "\(UserInfoDto.share?.id ?? 0)"
                let dic = [uidString : [yearT,monthT,dayT]]
                listArr.append(dic)
                UserDefaults.UserInfo.set(value: listArr, forKey: .DailyTaskLastOpenArray)
                UserDefaults.UserInfo.set(value: true, forKey: .NeedFetchDailyTask)
            }
        }else
        {
            Log.v("無任務日期,設定今天")
            let uidString = "\(UserInfoDto.share?.id ?? 0)"
            let dic = [uidString : [yearT,monthT,dayT]]
            UserDefaults.UserInfo.set(value: [dic], forKey: .DailyTaskLastOpenArray)
            UserDefaults.UserInfo.set(value: true, forKey: .NeedFetchDailyTask)
        }
       dailyTaskAction()
    }
    func dailyTaskAction()
    {
        // 蓋板廣告切入口
        if UserDefaults.UserInfo.bool(forKey: .NeedFetchDailyTask) == true
        {
            if let data = self.userBonusDto
            {
                UserDefaults.UserInfo.set(value: false, forKey: .NeedFetchDailyTask)
                self.dailySignView.viewModel.setDailyTaskData(data: data)
                self.dailySignView.show()
            }
        }else
        {
//            self.fullADView.showAD()
        }
    }
    // 1028
    func directToCategory(liveclassDto:LiveclassDto)
    {
        guard let caseName = liveclassDto.name ,
            let currentVC = viewControllers.filter({$0.title == caseName}).first
            else { return }
        let targetIndex = viewControllers.indexOfObject(object: currentVC)
        pagingViewController.select(index: targetIndex)
//        switch caseInt {
//        case 100 :
//            pagingViewController.select(index: targetIndex)
//        case 101 :
//            pagingViewController.select(index: 1)
//        case 102 :
//            pagingViewController.select(index: 2)
//        case .basketball:
//            pagingViewController.select(index: 3)
//        case .soccer:
//            pagingViewController.select(index: 4)
//        case .tennis:
//            pagingViewController.select(index: 5)
//        case .volleyball:
//            pagingViewController.select(index: 6)
//        case .billiards:
//            pagingViewController.select(index: 7)
//        case .gaming:
//            pagingViewController.select(index: 8)
//        case .others:
//            pagingViewController.select(index: 9)
////        default:break
//        }
    }
    // 0108
    func directToActivityArea()
    {
//        let caseName = "熱門".LocalizedString
//        guard let currentVC = viewControllers.filter({$0.title == caseName}).first
//            else { return }
//        let targetIndex = viewControllers.indexOfObject(object: currentVC)
//        pagingViewController.select(index: targetIndex)
//        currentVC.viewModel.activityAreaAction()
        let eventVC = HomeEventViewController()
        self.navigationController?.pushViewController(eventVC, animated: true)
    }
    func triggerDailyTaskWall(directToActivity:Bool = false)
    {
        if UserStatus.share.detectIsLogin() == true
        {
            let messionVC = LiveMissionViewController()
            messionVC.customFlag = (directToActivity == true) ? .activity :.list
            self.navigationController?.pushViewController(messionVC, animated: true)
        }else
        {
            UserDefaults.UserInfo.set(value: PSVCInt.LimitTimeTaskWall.rawValue, forKey: .UserPosition)
            if let psTabbarVC = self.tabBarController as? PSTabBarController
            {
                psTabbarVC.showDetaultAlert()
            }
        }
    }
    func customActionForDirectToRank()
    {
        let rankVC = LiveRoomRankViewController()
        self.navigationController?.pushViewController(rankVC, animated: true)
    }
}

extension HomeMainViewController: PagingViewControllerDelegate, PagingViewControllerDataSource {
    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int where T : PagingItem, T : Comparable, T : Hashable {
        return viewControllers.count
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T where T : PagingItem, T : Comparable, T : Hashable {
        let title = viewControllers[index].title ?? ""
        return HomeMenuItem(title: title, index: index) as! T
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController where T : PagingItem, T : Comparable, T : Hashable {
        
        return viewControllers[index]
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, willScrollToItem pagingItem: T, startingViewController: UIViewController, destinationViewController: UIViewController) where T : PagingItem, T : Comparable, T : Hashable {
        if let itemObject = pagingItem as? HomeMenuItem
        {
            switch itemObject.title {
            case "分類".LocalizedString:
                Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                         action: MAction.checkItOut.rawValue,
                                         name: MName.category.rawValue )
            case "熱門".LocalizedString:
                Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                         action: MAction.checkItOut.rawValue,
                                         name: MName.hot.rawValue )
            case "最新".LocalizedString:
                Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                         action: MAction.checkItOut.rawValue ,
                                         name: MName.newest.rawValue)
            default :
                if let idInt = viewModel.categoryArray.filter({$0.name == itemObject.title}).first?.id?.intValue
                {
                    Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                             action: MAction.checkItOut.rawValue ,
                                             name: itemObject.title,
                                             value: Float(idInt))
                }
                break
            }
        
        }
    }
    private func topImageViewScroll(scrollView: UIScrollView) {
        let contentScrollScope = scrollView.contentInset.top
        let suspensionH = Views.topOffset
        let scrollY = scrollView.contentOffset.y
        
        if (scrollY <= -contentScrollScope) { //下拉
            let oldFrame = topImageView.frame
            if oldFrame.origin.y <= 0 { //沒在原始位置不要動
                topImageView.frame = CGRect(x: 0, y: 0, width: Views.screenWidth, height: pHeight(150))
                pagingViewController.view.snp.updateConstraints { (maker) in
                    maker.top.equalToSuperview().offset(selfTopOffset)
//                    maker.height.equalTo(Views.screenHeight - selfTopOffset - Views.bottomOffsetWithTabbar)
//                    maker.height.equalTo(Views.screenHeight - selfTopOffset - Views.bottomOffsetWithTabbar)
                }
                DispatchQueue.main.async {
                    scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)                    
                }
                testView.snp.updateConstraints { (maker) in
                    maker.height.equalTo(Views.bottomOffsetWithTabbar)
                }
            } else {
                
            }
        } else if (scrollY < -suspensionH && scrollY > -contentScrollScope) {
            
        } else { //上拉後動作
            
            if (abs(scrollY) < passOffset) {
                topImageView.frame = CGRect(x: 0, y: -scrollY, width: Views.screenWidth, height: pHeight(150))
                pagingViewController.view.snp.updateConstraints { (maker) in
                    maker.top.equalToSuperview().offset(selfTopOffset - scrollY)
//                    maker.height.equalTo(Views.screenHeight - selfTopOffset - Views.bottomOffsetWithTabbar + scrollY)
                }
                DispatchQueue.main.async {
                    scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: scrollY, right: 0)
                }
                testView.snp.updateConstraints { (maker) in
                    maker.height.equalTo(Views.bottomOffsetWithTabbar)
                }
            }else
            {
                Log.v("超過")
            }
        }
    }
    private func setupPGVCFrame()
    {
        view.addSubview(pagingViewController.view)
        pagingViewController.view.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(selfTopOffset)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(Views.screenHeight - selfTopOffset - Views.bottomOffsetWithTabbar)
//            maker.bottom.equalToSuperview().offset(-Views.bottomOffsetWithTabbar)
        }
//        testView.backgroundColor = #colorLiteral(red: 0.9643180966, green: 0.9753912091, blue: 1, alpha: 1)
        testView.backgroundColor = .clear
        view.addSubview(testView)
        testView.snp.makeConstraints { (maker) in
            maker.top.equalTo(pagingViewController.view.snp.bottom)
            maker.height.equalTo(Views.bottomOffsetWithTabbar)
            maker.bottom.left.right.equalToSuperview()
        }
    }
}

//MARK: - apply menu indicator ui
class RoundedIndicatorView: PagingIndicatorView {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        layer.cornerRadius = layoutAttributes.frame.height / 2
    }
}

