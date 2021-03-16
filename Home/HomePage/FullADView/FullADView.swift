//
//  FullADView.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/17.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Toaster

class FullADView: BaseAlertView {
    //-------
    private let pageControl = UIPageControl()
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.alwaysBounceHorizontal = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    private var timerDisposeBag = DisposeBag()
    
    var bannerCurrentPage = PublishSubject<Int>()
    
    private var timer: Observable<Int>?
    private var banners = [String]()
    private var banner = ""
    private var urlStrings = [String]()
    private var imageIndex = 1
    //-------
    static let share = FullADView()
    let viewModel = FullADViewModel()
    let disposeBag = DisposeBag()
    private var closeADViewAction = PublishSubject<Void>()
    
    var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "sign_close"), for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(close), for: .touchUpInside)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1.0
        btn.applyCornerRadius(radius: pWidth(25)/2)
        return btn
    }()
    
    override init() {
        super.init()
        bind()
        setupViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViewUI() {
        self.bgView.frame = CGRect(x: 0, y: 0, width: pWidth(238), height: pWidth(389) + pWidth(6) + pWidth(25))
        self.bgView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        self.bgView.center = self.center
        self.bgView.addSubview(scrollView)
        scrollView.delegate = self
        
        scrollView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(pWidth(389))
        }
        self.bgView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (control) in
            control.bottom.equalToSuperview().offset(pWidth(-20))
            control.centerX.width.equalToSuperview()
            control.height.equalTo(pWidth(20))
        }
        // 1224 暫時先隱藏
//        pageControl.isHidden = true
        self.bgView.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (maker) in
            maker.bottom.centerX.equalToSuperview()
            maker.size.equalTo(pWidth(25))
        }
    
       
    }
    
    func showAD() {
        fetchADViewData()
    }
    override func close() {
        super.close()
        timerDisposeBag = DisposeBag()
        closeADViewAction.onNext(())
    }
    func fetchADViewData()
    {
        viewModel.fetchADViewData()
    }
    func bind() {
        viewModel.rxFetchADViewDataSuccess().subscribeSuccess { [weak self](dataArray) in
            if let datas = dataArray
            {
                self?.setupScrollViewAction(data: datas)
                self?.showWithAlpha(alpha: 0.4)
            }else
            {
                self?.close()
            }
        }.disposed(by: disposeBag)
    }
    func rxCloseADViewAction() -> Observable<Void>
    {
        return self.closeADViewAction.asObserver()
    }
    func setupScrollViewAction(data:[HotInfoSlideDto]?)
    {
        scrollView.contentSize = CGSize(width: pWidth(238) * CGFloat(banners.count), height: pWidth(389))
        banners.removeAll()
        urlStrings.removeAll()
        guard let lists = data else { return }
        for index in 0...lists.count - 1 {
            if let picString = lists[index].slide_pic,
               let urlString = lists[index].slide_url
            {
                banners.append(picString)
                urlStrings.append(urlString)
            }
        }
        pageControl.numberOfPages = banners.count
        setupInfiteImageView()
        setupTimer()
    }
    private func setupInfiteImageView() {
        //建立banners.count + 2的imageView
        for index in 0...(banners.count + 1) {
            let bannerImageView = UIImageView(frame: CGRect(x: pWidth(238) * CGFloat(index), y: 0, width: pWidth(238), height: pWidth(389)))
            
            switch index {
            case 0:
                banner = banners[banners.count - 1]
                break
            case banners.count + 1:
                banner = banners.first!
                break
            default:
                banner = banners[index - 1]
                break
            }
            if let bannerUrl = URL(string: banner){
                bannerImageView.setImage(with: bannerUrl, placeholder: UIImage(), errorPlaceholder: UIImage(), completeBlock: nil)
            }else{
                bannerImageView.image = UIImage()
            }

            bannerImageView.contentMode = .scaleAspectFit
            bannerImageView.isUserInteractionEnabled = true
            bannerImageView.tag = index
            bannerImageView.rx.click.subscribeSuccess { [weak self](_) in
                
                guard let stronfSelf = self else { return }
                var urlStr = ""
                switch bannerImageView.tag{
                case 0:
                    urlStr = stronfSelf.urlStrings[stronfSelf.banners.count - 1]
                    break
                case stronfSelf.banners.count + 1:
                    urlStr = stronfSelf.urlStrings[0]
                    break
                default:
                    urlStr = stronfSelf.urlStrings[bannerImageView.tag - 1]
                    break
                }
                // 測試
//                urlStr = "paishou://noticedetail/?id=5"
//                urlStr = "paishou://loginapp/?id=https://test.tg18.net/event/1225"
//                urlStr = "paishou://rank_list"
//                urlStr = "paishou://loginapp/?id=https://test.tg18.net/event/1225"
//                urlStr = "paishou://outapp/?id=https://test.tg18.net/event/1225"
//                urlStr = "paishou://inapp/?id=https://test.tg18.net/event/1225"
//                urlStr = "https://test.tg18.net/event/1225"
//                urlStr = "paishou://recharge"
//                urlStr = "paishou://campaign"
//                urlStr = "paishou://schedule"
//                urlStr = "paishou://backpack"
                if urlStr != ""{
                    DeepLinkManager.share.parserStringFromBroeser(urlStr)
                    self?.close()
                }else{
                    Log.v("蓋板廣告banner為空")
                }
            }.disposed(by: disposeBag)
            scrollView.addSubview(bannerImageView)
        }
        scrollView.contentSize = CGSize(width: pWidth(238) * CGFloat(banners.count + 2), height: pWidth(389))
        scrollView.contentOffset = CGPoint(x: pWidth(238), y: 0)
    }
    private func setupTimer() {
        if banners.count > 1
        {
            timer = Observable<Int>.interval(5, scheduler: MainScheduler.instance)
            timer?.subscribeSuccess { [weak self] (time) in
                self?.autoScroll()
            }.disposed(by: timerDisposeBag)
        }
    }
    private func autoScroll() {
        if imageIndex == banners.count + 1
        {
            imageIndex = 1
        } else {
            imageIndex += 1
        }
        scrollView.setContentOffset(CGPoint(x: pWidth(238) * CGFloat(imageIndex), y: 0), animated: true)
    }
}
extension FullADView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if banners.count > 1
        {
            let contentOffsetX = scrollView.contentOffset.x
            //滑動到第0張的时候, 滾到最後一張圖
            if contentOffsetX == 0 {
                scrollView.contentOffset = CGPoint(x: pWidth(238) * CGFloat(banners.count), y: 0)
            }
            //滑動到第最後一張的时候, 滾到第0張圖
            let countValue = CGFloat(banners.count + 1) * pWidth(238)
            let clearFloat = CGFloat("\(countValue)".numberFormatter(.none, 0).toDouble())
            Log.v("contentOffsetX :\(contentOffsetX) \ncountValue : \(countValue)\nclearFloat: \(clearFloat)")
            if contentOffsetX ==  clearFloat {
                scrollView.contentOffset = CGPoint(x: pWidth(238), y: 0)
            }            
        }
        //改變pageControl一定要 - 0.5 因最前面第0張圖不顯示
        let index = scrollView.contentOffset.x / pWidth(238) - 0.5
        pageControl.currentPage = Int(index)
        bannerCurrentPage.onNext(pageControl.currentPage)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setupTimer()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if banners.count == 1
        {
            scrollView.isScrollEnabled = false
        }else
        {
            timerDisposeBag = DisposeBag()
        }
    }
    
}
