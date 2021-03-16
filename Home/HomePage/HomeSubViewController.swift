//
//  HomeSubViewController.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/24.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeSubViewController: BaseViewController {
    var startPoint: CGPoint?
//    var categories: Categories!
    let viewModel = HomeSubViewModel()
    var tableViewScrollingOffset = PublishSubject<UIScrollView>()
    var tableViewTouchData = PublishSubject<CGFloat>()
    var cellBtnTapped = PublishSubject<LiveclassDto>()
    var systemViewTapped = PublishSubject<Int>()
    var didTapRank = PublishRelay<Void>()
    var didTapEvent = PublishRelay<Void>()
    let tableView = UITableView()
    private let streamerHeaderView = HomeHeaderTableViewCell()
    private let liveHeaderView = HomeHeaderTableViewCell()
    private let refresher = UIRefreshControl()
    private var bottomRefresher: UIView?
    private var currentPage = 1

    private var offset = pHeight(100)
    private var firstUpdate = true
    
//    init(category: Categories) {
//        super.init()
//        self.categories = category
//        self.viewModel.categories = category
//    }
    init(liveclassDto: LiveclassDto) {
        super.init()
        self.viewModel.liveclassDto = liveclassDto
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
        fetch(direction: .down)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getHomeEventHot()
        viewModel.fetchActivityAreaData()
    }
    
    private func setupUI() {
        view.backgroundColor = Themes.homeBackGround
        
        view.addSubview(tableView)
        tableView.registerCell(type: HomeCategoryTableViewCell.self)
        tableView.registerCell(type: HomeBannerTableViewCell.self)
        tableView.registerCell(type: HomeHotStreamerTableViewCell.self)
        tableView.registerCell(type: HomeLiveTableViewCell.self)
        tableView.registerCell(type: HomeHeaderTableViewCell.self)
        tableView.registerCell(type: HomeBullteinTableViewCell.self)
        tableView.registerCell(type: HomeSubViewEmptyCell.self)
        tableView.registerCell(type: HomeLiveScheduleTableViewCell.self)
        tableView.registerCell(type: HomeRankEventTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.showsVerticalScrollIndicator = false
//        tableView.isUserInteractionEnabled = false
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        tableView.addSubview(refresher)
        
        refresher.rx.controlEvent(.valueChanged).subscribeSuccess { [weak self] (_) in
            self?.endRefresh()
        }.disposed(by: disposeBag)
        
        bottomRefresher = tableView.footerRefrashView()
    }
    
    private func endRefresh() {
        fetch(direction: .down)
    }
    
    private func bindViewModel() {
       
        viewModel.rxFetchHotDataDtosSuccess().subscribeSuccess { [weak self] (_) in
            self?.tableView.reloadData()
            self?.refresher.endRefreshing()
            self?.tableView.tableFooterView = nil
            _ = LoadingViewController.dismiss()
        }.disposed(by: disposeBag)
        
        viewModel.rxFetchCategoryLiveDtoForNormal().subscribeSuccess { [weak self] (_) in
            self?.tableView.reloadData()
            self?.refresher.endRefreshing()
            self?.tableView.tableFooterView = nil
            _ = LoadingViewController.dismiss()
        }.disposed(by: disposeBag)
        
        viewModel.rxFetchHotLiveForRefresh().subscribeSuccess { [weak self] (_) in
            self?.tableView.reloadData()
            self?.refresher.endRefreshing()
            self?.tableView.tableFooterView = nil
            _ = LoadingViewController.dismiss()
        }.disposed(by: disposeBag)
        
        viewModel.rxFetchCategoryLiveDtoForRefresh().subscribeSuccess { [weak self] (_) in
            self?.tableView.reloadData()
            self?.refresher.endRefreshing()
            self?.tableView.tableFooterView = nil
            _ = LoadingViewController.dismiss()
        }.disposed(by: disposeBag)
        
        viewModel.rxFetchEventHotSuccess().subscribeSuccess { [weak self](_) in
            Log.v("取得熱門賽事成功")
            guard let stroungSelf = self, let liveClassID = stroungSelf.viewModel.liveclassDto.id?.intValue else {return}
            if liveClassID == 101{
                //stroungSelf.tableView.reloadRows(at: [IndexPath(row: 0, section: 2)], with: .none)
                stroungSelf.tableView.reloadSections([3], with: .none)
            }
        }.disposed(by: disposeBag)
    }
    
    //MARK: - 判斷刷新方向
    private func fetch(direction: RefreshDirection) {
        viewModel.fetchCategoryLiveData(direction: direction ,
                                        id:String(viewModel.liveclassDto.id?.intValue ?? 0) )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeSubViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch viewModel.liveclassDto.id?.intValue {
        case 100 : //分類
            return 2
        case 101 : //熱門
            return 6
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.liveclassDto.id?.intValue {
        case 100 : //分類
            if section == 0 {
                return 1
            } else {
                return 2
            }
        case 101 : //熱門
            switch section {
            case 0:
                return 1
            case 1:
                if viewModel.bullteinListData.isEmpty{
                    return 0
                }else{
                    return 1
                }
            case 2:
                  return 1
            case 3:
                if viewModel.eventHotListData.isEmpty{
                    return 0
                }else{
                  return 1
                }
            default:
                return 2
            }
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.liveclassDto.id?.intValue {
        case 100 : //分類
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueCell(type: HomeCategoryTableViewCell.self, indexPath: indexPath)
//                cell.configure(datas: HomeConfigInfoDto.share?.info?.first?.liveclass)
                cell.configure(datas: HomeConfigInfoDto.share?.liveclass)
                cell.rxBtnTapped().subscribeSuccess { [weak self] (classData) in
                    self?.cellBtnTapped.onNext(classData)
                }.disposed(by: cell.rx.reuseBag)
                return cell
            case 1:
                if indexPath.row == 0 {
                    let cell = tableView.dequeueCell(type: HomeHeaderTableViewCell.self, indexPath: indexPath)
                    cell.congiure(title: "全部直播".LocalizedString, image: UIImage(named: "iconCamera")!, seeMore: false)
                    return cell
                } else {
                    if viewModel.categoryLiveDtos.count > 0
                    {
                        let cell = tableView.dequeueCell(type: HomeLiveTableViewCell.self, indexPath: indexPath)
                        cell.configure(liveclassDto: viewModel.liveclassDto, lists: viewModel.categoryLiveDtos)
                        return cell
                    }else
                    {
                        let cell = tableView.dequeueCell(type: HomeSubViewEmptyCell.self, indexPath: indexPath)
                        return cell
                    }
                }
            default:
                return UITableViewCell()
            }
        case 101 : //熱門
            switch indexPath.section {
            case 0:
                //輪播banner
                let cell = tableView.dequeueCell(type: HomeBannerTableViewCell.self, indexPath: indexPath)
                if firstUpdate && viewModel.hotBannerDtos != nil {
                    cell.congigure(firstUpdate: firstUpdate, lists: viewModel.hotBannerDtos)
                    firstUpdate = !firstUpdate
                    cell.bannerCurrentPage.subscribeSuccess { (page) in
                        
                    }.disposed(by: disposeBag)
                }
                return cell
            case 1:
                //公告
                let cell = tableView.dequeueCell(type: HomeBullteinTableViewCell.self, indexPath: indexPath)
                cell.coverBtn.rx.tap.subscribeSuccess { [weak self](_) in
                    Log.v("前往公告頁")
                }.disposed(by: cell.rx.reuseBag)
                cell.rxDidTapView().subscribeSuccess { [weak self](index) in
                    Log.v("前往公告頁 , \(index)")
                    
                    if let data = self?.viewModel.bullteinListData[index] as? HomeBullteinItemDto,
                        let dataID = data.id
                    {
                        self?.systemViewTapped.onNext(dataID)
                    }
                }.disposed(by: cell.rx.reuseBag)
                cell.configure(data: viewModel.bullteinListData)
                return cell
            case 2:
                //排行榜&活動
                let cell = tableView.dequeueCell(type: HomeRankEventTableViewCell.self, indexPath: indexPath)
                cell.rankImgView.rx.click.subscribeSuccess { [weak self](_) in
                    Log.v("點到排行榜")
                    self?.didTapRank.accept(())
                }.disposed(by: cell.rx.reuseBag)
                cell.eventImgView.rx.click.subscribeSuccess { [weak self](_) in
                    Log.v("點到活動")
                    //self?.viewModel.activityAreaAction()
                    self?.didTapEvent.accept(())
                }.disposed(by: cell.rx.reuseBag)
                return cell
            case 3:
                //直播快訊
                let cell = tableView.dequeueCell(type: HomeLiveScheduleTableViewCell.self, indexPath: indexPath)
                if !viewModel.eventHotListData.isEmpty{
                    let number = Int.random(in: 0..<viewModel.eventHotListData.count)
                    cell.config(data: viewModel.eventHotListData[number], index: number)
                    //cell.config(data: viewModel.eventHotListData)
                    cell.rx.click.subscribeSuccess { [weak self](_) in
                        Log.v("進直播間")
                        guard let strongSelf = self else {return}
                        if let uid = self?.viewModel.eventHotListData[number].uid?.stringValue{
                            if let vc = UIApplication.topViewController() as? PSTabBarController
                            {
                                let liveDetailVC = PSLiveDetailVC()
                                liveDetailVC.config(withUID: uid)
                                vc.presentDetail(liveDetailVC)
                            }
                        }
                    }.disposed(by: cell.rx.reuseBag)
                }
                return cell
            case 4:
                //熱門主播
                if indexPath.row == 0 {
                    let cell = tableView.dequeueCell(type: HomeHeaderTableViewCell.self, indexPath: indexPath)
                    cell.congiure(title: "熱門主播".localized, image: UIImage(named: "icon_diamond")!, seeMore: false)
                    return cell
                } else {
                    let cell = tableView.dequeueCell(type: HomeHotStreamerTableViewCell.self, indexPath: indexPath)
                    cell.configure(lists: viewModel.hotStreamerDtos)
                    return cell
                }
            case 5:
                //熱門直播
                if indexPath.row == 0 {
                    let cell = tableView.dequeueCell(type: HomeHeaderTableViewCell.self, indexPath: indexPath)
                    cell.congiure(title: "熱門直播".localized, image: UIImage(named: "icon_fire")!, seeMore: false)
                    return cell
                } else {
                    if viewModel.hotLiveDtos?.count ?? 0 > 0
                    {
                        let cell = tableView.dequeueCell(type: HomeLiveTableViewCell.self, indexPath: indexPath)
                        cell.configure(liveclassDto: viewModel.liveclassDto, lists: viewModel.hotLiveDtos)
                        return cell
                    }else
                    {
                        let cell = tableView.dequeueCell(type: HomeSubViewEmptyCell.self, indexPath: indexPath)
                        return cell
                    }
                }
            default:
                return UITableViewCell()
            }
        default:
            if indexPath.row == 0 {
                let cell = tableView.dequeueCell(type: HomeHeaderTableViewCell.self, indexPath: indexPath)
                cell.congiure(title: "直播".localized, image: UIImage(named: "icon_fire")!, seeMore: false)
                return cell
            } else {
                if viewModel.categoryLiveDtos?.count ?? 0 > 0
                {
                    let cell = tableView.dequeueCell(type: HomeLiveTableViewCell.self, indexPath: indexPath)
                    if viewModel.liveclassDto != nil && viewModel.categoryLiveDtos != nil {
                        cell.configure(liveclassDto: viewModel.liveclassDto, lists: viewModel.categoryLiveDtos)
                    }
                    return cell
                }else
                {
                    let cell = tableView.dequeueCell(type: HomeSubViewEmptyCell.self, indexPath: indexPath)
                    return cell
                }
                
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.liveclassDto.id?.intValue {
        case 100 : //分類
            switch indexPath.section {
            case 0:
                return pWidth(250)
            default:
                if indexPath.row == 0 {
                    return pWidth(50)
                } else {

                    guard let categoryLiveDtos = viewModel.categoryLiveDtos ,
                    categoryLiveDtos.count > 0 else {
                        return Views.screenHeight - Views.topOffset - Views.bottomOffsetWithTabbar }
                    return CGFloat((categoryLiveDtos.count % 2 == 0 ? categoryLiveDtos.count / 2 : categoryLiveDtos.count / 2 + 1)) * pWidth(145)
                }
            }
        case 101 : //熱門
            switch indexPath.section {
            case 0:
                return pWidth(200)
            case 1:
                return pWidth(40)
            case 2:
                return pWidth(76)
            case 3:
                return pWidth(70)
            case 4:
                if indexPath.row == 0 {
                    return pWidth(50)
                } else {
                    return pWidth(110)
                }
            default:
                if indexPath.row == 0 {
                    return pWidth(50)
                } else {
                    guard let hotLiveDtos = viewModel.hotLiveDtos ,
                    hotLiveDtos.count > 0 else {
                        return Views.screenHeight - Views.topOffset - Views.bottomOffsetWithTabbar }
                    return CGFloat((hotLiveDtos.count % 2 == 0 ? hotLiveDtos.count / 2 : hotLiveDtos.count / 2 + 1)) * pWidth(145)
                }
            }
        default:
            if indexPath.row == 0 {
                return pWidth(50)
            } else {
                guard let categoryLiveDtos = viewModel.categoryLiveDtos ,
                    categoryLiveDtos.count > 0 else {
                    return Views.screenHeight - Views.topOffset - Views.bottomOffsetWithTabbar }
                return CGFloat((categoryLiveDtos.count % 2 == 0 ? categoryLiveDtos.count / 2 : categoryLiveDtos.count / 2 + 1)) * pWidth(145)
            }
        }
    }
    
}

extension HomeSubViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        detectScrollView(scrollView: scrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        Log.v("點到")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == tableView {
            let offset = scrollView.contentOffset
            if offset.y > 0
            {
                let bouns = scrollView.bounds
                let size = scrollView.contentSize
                let inset = scrollView.contentInset
                let y:CGFloat = offset.y + bouns.size.height - inset.bottom
                let h:CGFloat = size.height
                let reloadDistence = pWidth(50)
                let newH = size.height + reloadDistence + Views.tabBarHeight
                if y > newH {
                    tableView.tableFooterView = bottomRefresher
                    currentPage += 1
                    fetch(direction: .up)
                }
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        Log.v("動畫快結束")
    }
    
    private func detectScrollView(scrollView: UIScrollView) {
        tableViewScrollingOffset.onNext(scrollView)
    }
    func rxTableViewScrollingOffset() -> Observable<UIScrollView>
    {
        return tableViewScrollingOffset.asObserver().observeOnMain()
    }
    func rxSystemViewTapped() -> Observable<Int>
    {
        return systemViewTapped.asObserver()
    }
    func rxCellBtnTapped() -> Observable<LiveclassDto>
    {
        return self.cellBtnTapped.asObserver()
    }
    func rxDidTapRank() -> Observable<Void>{
        return self.didTapRank.asObservable()
    }
    func rxDidTapEvent() -> Observable<Void>{
        return self.didTapEvent.asObservable()
    }
}
extension HomeSubViewController
{
    func rxTableViewTouchData() -> Observable<CGFloat>
    {
        self.tableViewTouchData.asObserver()
    }
    func calculateDragLength(frame:CGRect)
    {
        let dragLength = frame.height
//        Log.v("touche frame height : \(frame.height)")
        if frame.origin.y < startPoint?.y ?? 0
        {
//            Log.v("上滑")
            self.tableViewTouchData.onNext(dragLength)
        }else
        {
//            Log.v("下拉")
            self.tableViewTouchData.onNext(-dragLength)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startPoint = nil
        
        guard let touch = touches.first else { return }
        
        startPoint = touch.location(in:self.tableView )
        
        // you might want to initialize whatever you need to begin showing selected rectangle below, e.g.
        
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let startPoint = startPoint else { return }

        let currentPoint: CGPoint

        if let predicted = event?.predictedTouches(for: touch), let lastPoint = predicted.last {
            currentPoint = lastPoint.location(in: self.tableView)
        } else {
            currentPoint = touch.location(in: self.tableView)
        }

        let frame = rect(from: startPoint, to: currentPoint)
        calculateDragLength(frame: frame)
        
        // you might do something with `frame`, e.g. show bounding box

//        rectShapeLayer.path = UIBezierPath(rect: frame).cgPath
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let startPoint = startPoint else { return }

        let currentPoint = touch.location(in: self.tableView)
        let frame = rect(from: startPoint, to: currentPoint)
        calculateDragLength(frame: frame)
        
        // you might do something with `frame`, e.g. remove bounding box but take snapshot of selected `CGRect`

//        rectShapeLayer.removeFromSuperlayer()
//        let image = imageView.snapshot(rect: frame, afterScreenUpdates: true)

        // do something with this `image`
    }
    
    private func rect(from: CGPoint, to: CGPoint) -> CGRect {
        return CGRect(x: min(from.x, to.x),
               y: min(from.y, to.y),
               width: abs(to.x - from.x),
               height: abs(to.y - from.y))
    }
}
