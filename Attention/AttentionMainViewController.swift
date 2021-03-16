//
//  AttentionMainViewController.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Toaster

class AttentionMainViewController: BaseViewController {
    var isAllowFetchingDataDisposeBag : DisposeBag?
    fileprivate var viewModel = AttentionMainViewModel()
    
    var attentData : AttentListDto = AttentListDto()
    var followsData : FollowsListDto = FollowsListDto()
    var followsV2Data : FollowsListDto?
    private let refresher = UIRefreshControl()
    private var bottomRefresher: UIView?
    private var currentPage = 1
    
    private lazy var headerImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "BaseBlueBackground"))
//        imgView.image = UIImage()
        imgView.backgroundColor = .clear
        imgView.contentMode = .scaleAspectFill
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.pingFangSCSemibold(22)
        label.textColor = .white
        label.text = "關注".LocalizedString
        return label
    }()
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.registerCell(type: ScheduleAnchorChoiceTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.backgroundView = EmptyView(type: .noDataForAttent)
        tableView.backgroundView?.isHidden = true
        return tableView
    }()
        
    private let streamerHeaderView = AttentTableHeaderView()
    private let liveHeaderView = AttentTableHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let nav = self.navigationController as? PSNavigationController else {return}
        nav.setUpVCBarStyle(vcType: .attention)
        fetchData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isAllowFetchingDataDisposeBag = DisposeBag()
        PSTabBarController.share.rx.frontView.map{ $0 == .Attent}.bind(to: isAllowFetchingData).disposed(by: isAllowFetchingDataDisposeBag!)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let nav = self.navigationController as? PSNavigationController else {return}
        nav.setUpVCBarStyle(vcType: .defaultstyle)
        isAllowFetchingDataDisposeBag = nil
    }

}
extension AttentionMainViewController{
    func setUpUI(){
//        view.backgroundColor = Themes.psNavigationBar
        view.backgroundColor = .white
        view.addSubview(headerImgView)
        headerImgView.addSubview(titleLabel)
        view.addSubview(tableView)
        
        headerImgView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(headerImgView.snp.top).offset(pHeight(70))
            maker.left.equalTo(headerImgView.snp.left).offset(pWidth(14))
        }

        tableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleLabel.snp.bottom).offset(pHeight(15))
            maker.width.centerX.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-Views.tabBarHeight)
        }
        tableView.addSubview(refresher)
        
        refresher.rx.controlEvent(.valueChanged).subscribeSuccess { [weak self] (_) in
            self?.endRefresh()
        }.disposed(by: disposeBag)
        
        bottomRefresher = tableView.footerRefrashView()
        
    }
    private func endRefresh() {
        fetchData()
    }
    func bindViewModel()
    {
        viewModel.rxFetchAttentPageSuccess().subscribeSuccess { datas in
            Log.v("舊_取得上層關注頁面資料")
            self.attentData = (datas.first as! AttentListDto)
            self.followsData = (datas.last as! FollowsListDto)
            if (self.attentData.total == 0) && (self.followsData.total() == 0)
            {
                self.tableView.backgroundView?.isHidden = false
            }else
            {
                self.tableView.backgroundView?.isHidden = true
            }
            // 測試
//            self.tableView.backgroundView?.isHidden = false
            self.resetTableView()
        }.disposed(by: disposeBag)
        
        viewModel.rxFetchFollowDataOnlySuccess().subscribeSuccess { data in
            Log.v("舊_取得下層關注頁面資料")
            self.followsData = data
            self.resetTableView()
        }.disposed(by: disposeBag)
        viewModel.rxFetchFollowV2DataSuccess().subscribeSuccess { followData in
            Log.v("新_取得主播關注頁面資料")
            if let data = followData,
                let total = data.total()
            {
                if total == 0
                {
                    self.tableView.backgroundView?.isHidden = false
                }else
                {
                    self.tableView.backgroundView?.isHidden = true
                }
                self.followsV2Data = data
                self.resetTableView()
            }
        }.disposed(by: disposeBag)
        viewModel.rxSetAttentSuccess().subscribeSuccess { [weak self](data) in
            Log.v("設定關注或取消關注")
            if let status = data.isattent,
                let uidString = data.liveUID,
                let data = self?.followsV2Data,
                let userNameString = data.list?.filter({$0.uid == uidString.toInt()}).first?.user_nicename
            {
                if status == 1
                {
                    Beans.matomoServer.track(eventWithCategory: MCategory.AttentPage.rawValue,
                                             action: MAction.attentAnchor.rawValue,
                                             name: userNameString,
                                             value: Float(uidString.toInt()))
                    self?.followsV2Data?.list?.filter({$0.uid == uidString.toInt()}).first?.custom_is_attant = true
                }else
                {
                    Beans.matomoServer.track(eventWithCategory: MCategory.AttentPage.rawValue,
                                             action: MAction.unattentAnchor.rawValue,
                                             name: userNameString,
                                             value: Float(uidString.toInt()))
                    self?.followsV2Data?.list?.filter({$0.uid == uidString.toInt()}).first?.custom_is_attant = false
                }
                self?.tableView.reloadData()
            }
            

        }.disposed(by: disposeBag)
    }
    func resetTableView()
    {
        self.refresher.endRefreshing()
        self.tableView.tableFooterView = nil
        self.tableView.reloadData()
    }
    func fetchData()
    {
        currentPage = 1
//        viewModel.fetchAttentPageData()
        viewModel.fetchFollowV2ListDataOnly(page: currentPage)
    }
    func fetchFollowData(direction: RefreshDirection)
    {
//        viewModel.fetchFollowsListDataOnly(page: currentPage)
        viewModel.fetchFollowV2ListDataOnly(page: currentPage)
    }
}

extension AttentionMainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections = 0
        if let data = self.followsV2Data,
            let number = data.total(),
            number > 0
        {
            numOfSections += 1
        }
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfRows = 0
        if let data = self.followsV2Data,
            let number = data.total()
        {
            numOfRows = number
        }
        return numOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueCell(type: ScheduleAnchorChoiceTableViewCell.self, indexPath: indexPath)
        cell.backgroundColor = .clear
        if let data = self.followsV2Data,
            let listData = data.list
        {
            cell.configForAttent(data: listData[indexPath.row])
        }
        cell.rxDidTapSubscribe().subscribeSuccess { [weak self](streamerID) in
            Log.v("點擊關注主播")
            if let idString = streamerID
            {
                self?.viewModel.setAttentAnchor(anchorID: idString)
            }
        }.disposed(by: cell.rx.reuseBag)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let vc = UIApplication.topViewController() as? PSTabBarController,
            let data = self.followsV2Data,
            let listData = data.list,
            let currentUID = listData[indexPath.row].uid
        {
            DispatchQueue.main.async {
                let liveDetailVC = PSLiveDetailVC(data: listData[indexPath.row])
                liveDetailVC.config(withUID: "\(currentUID)")
                vc.presentDetail(liveDetailVC)                
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return pWidth(86)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == tableView {
            let offset = scrollView.contentOffset
            let bouns = scrollView.bounds
            let size = scrollView.contentSize
            let inset = scrollView.contentInset
            let y = offset.y + bouns.size.height - inset.bottom
            let h = size.height
            let reloadDistence = pWidth(50)
            if y > h + reloadDistence
            {
                print("底部刷新資料")
                tableView.tableFooterView = bottomRefresher
                currentPage += 1
                fetchFollowData(direction: .up)
            }
        }
    }
}

