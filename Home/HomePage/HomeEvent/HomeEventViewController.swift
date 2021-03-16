//
//  HomeEventViewController.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2021/1/8.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Toaster
import Kingfisher

class HomeEventViewController: BaseViewController {
    fileprivate var viewModel = HomeEventViewModel()
    //置頂圖
    private let topEventImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = Themes.psHomeEventPlaceHolder
        imgView.isUserInteractionEnabled = true
        imgView.layer.masksToBounds = true
        return imgView
    }()
    //類別
    private var layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView()
    
    //tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = Themes.psMyInfoBackGround
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        //tableView.backgroundView = EmptyView(type: .noMessage)
        tableView.register(HomeEventTableViewCell.self, forCellReuseIdentifier: "HomeEventTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bind()
        bindViewModel()
        fetchCategory()
        firstFetchEventList()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    deinit {
        Log.v("HomeEventVC deinit")
    }
    
}
//MARK: Set up UI
extension HomeEventViewController{
    func setUpUI(){
        self.title = "活動".LocalizedString
        view.backgroundColor = Themes.psMyInfoBackGround
        view.addSubview(topEventImgView)
        topEventImgView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(pWidth(156))
        }
        setUpCollectionView()
    }
    func setUpCollectionView(){
        //左右
        layout.minimumLineSpacing = pWidth(8)
        //上下
        layout.minimumInteritemSpacing = pHeight(8)
        //滑動方向
        layout.scrollDirection = .horizontal
        //itemSize
        layout.itemSize = CGSize(width: pWidth(60), height: pHeight(28))
        //左右間距
        layout.sectionInset = UIEdgeInsets(top: pHeight(16), left: pWidth(22), bottom: pHeight(16), right: pWidth(22))
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HomeEventClassCollectionViewCell.self, forCellWithReuseIdentifier: "HomeEventClassCollectionViewCell")
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(topEventImgView.snp.bottom)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.height.equalTo(pHeight(60))
        }
        setUpTabelView()
    }
    func setUpTabelView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(collectionView.snp.bottom).offset(pHeight(8))
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        //tableView.backgroundView?.isHidden = true
    }
    //MARK: Set up 置頂
    func setUpTopImgView(data: HomeEventItemDto){
        if let imgUrl = data.event_pic, let url = URL(string: imgUrl){
            topEventImgView.setImage(with: url, placeholder: UIImage().mergeHomeEventTopPlaceHolderImage(), errorPlaceholder: UIImage().mergeHomeEventTopPlaceHolderImage(), completeBlock: nil)
        }else{
            topEventImgView.image = UIImage().mergeHomeEventTopPlaceHolderImage()
        }
    }
    //MARK: 預設選第一個分類
    func selectCollectionView(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        }
    }
    
    //MARK: 分享
    func showShareView(url: String?){
        if let urlString = url{
            //MARK: TO do (可能要換key)
//            Beans.matomoServer.track(eventWithCategory: MCategory.StreamLiveRoomPage.rawValue,
//                                             action: MAction.share.rawValue)
            let vc = UIActivityViewController(activityItems: [urlString], applicationActivities: [])
            vc.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
                PSAssistiveTouch.share.isHidden = false
                // 如果錯誤存在，跳出錯誤視窗並顯示給使用者。
                if error != nil {
                    Log.v(error!.localizedDescription)
                    return
                }
                
                // 如果發送成功，跳出提示視窗顯示成功。
                if completed {
                    
                }
                
            }
            present(vc, animated: true, completion: nil)
        }
    }
    
    //MARK: 複製連結
    func copyUrl(url: String?){
        if let urlString = url{
            UIPasteboard.general.string = urlString
            Toast.show(msg: "複製成功".LocalizedString)
        }
    }
}
//MARK: Fetch & Bind
extension HomeEventViewController{
    func fetchCategory(){
        viewModel.fetchHomeEventCategory()
    }
    func fetchEventList(cid: Int){
        viewModel.fetchHomeEventList(cid: cid)
    }
    func firstFetchEventList(){
        viewModel.fetchFirstHomeEventList()
    }
    func bindViewModel(){
        viewModel.rxFetchHomeEventTopSuccess().subscribeSuccess { [weak self](topDto) in
            Log.v("更新置頂活動")
            self?.setUpTopImgView(data: topDto)
        }.disposed(by: disposeBag)
        viewModel.rxFetchHomeEventListSuccess().subscribeSuccess { [weak self](_) in
            Log.v("取得活動列表")
            _ = LoadingViewController.dismiss()
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
        viewModel.rxFetchFirstHomeEventListSuccess().subscribeSuccess { [weak self](_) in
            Log.v("首次取得活動列表")
            self?.selectCollectionView()
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
        viewModel.rxFetchHomeEventCategorySuccess().subscribeSuccess { [weak self](_) in
            Log.v("取得活動分類")
            _ = LoadingViewController.dismiss()
            self?.selectCollectionView()
        }.disposed(by: disposeBag)
    }
    func bind(){
        topEventImgView.rx.click.subscribeSuccess { [weak self](_) in
            Log.v("點擊置頂")
            guard let strongSelf = self else {return}
            if let url = strongSelf.viewModel.topImageViewData?.event_url,
               let name = strongSelf.viewModel.topImageViewData?.event_name{
                Beans.matomoServer.track(eventWithCategory: MCategory.ActivityArea.rawValue,
                                         action: MAction.checkTopActivity.rawValue,
                                         name: name)
                DeepLinkManager.share.parserStringFromBroeser(url)
            }
        }.disposed(by: disposeBag)
    }
}
//MARK: UICollectionView delegate & dataSource
extension HomeEventViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryList.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeEventClassCollectionViewCell", for: indexPath) as! HomeEventClassCollectionViewCell
        if indexPath.item == 0{
            cell.configWithFirstItem()
        }else{
            cell.config(data: viewModel.categoryList[indexPath.item - 1 ])
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0{
            fetchEventList(cid: 0)
        }else{
            if let idIntValue = viewModel.categoryList[indexPath.item - 1].id?.values as? Int{
                fetchEventList(cid: idIntValue)
            }
        }
        
    }
}
//MARK: UITableView delegate & dataSource
extension HomeEventViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeEventTableViewCell", for: indexPath) as! HomeEventTableViewCell
        cell.config(data: viewModel.eventList[indexPath.row])
        
        let eventWebUrl = viewModel.eventList[indexPath.row].event_web_url
        
        cell.copyImgView.rx.click.subscribeSuccess { [weak self](_) in
            Log.v("點擊複製連結indexPath: \(indexPath.row),")
            Beans.matomoServer.track(eventWithCategory: MCategory.ActivityArea.rawValue,
                                     action: MAction.copy.rawValue)
            self?.copyUrl(url: eventWebUrl)
        }.disposed(by: cell.rx.reuseBag)
        
        cell.shareImgView.rx.click.subscribeSuccess { [weak self](_) in
            Log.v("點擊分享indexPath: \(indexPath.row),")
            Beans.matomoServer.track(eventWithCategory: MCategory.ActivityArea.rawValue,
                                     action: MAction.share.rawValue)
            self?.showShareView(url: eventWebUrl)
        }.disposed(by: cell.rx.reuseBag)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = self.viewModel.eventList[indexPath.row].event_url,
           let name = self.viewModel.topImageViewData?.event_name{
            Beans.matomoServer.track(eventWithCategory: MCategory.ActivityArea.rawValue,
                                     action: MAction.checkTopActivity.rawValue,
                                     name: name)
            DeepLinkManager.share.parserStringFromBroeser(url)
        }
    
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 8))
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return pWidth(230)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}
