//
//  HomeMainTableViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeBannerTableViewCell: UITableViewCell {
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()

    private let disposeBag = DisposeBag()
    private var timerDisposeBag = DisposeBag()
    
    var bannerCurrentPage = PublishSubject<Int>()
    
    private var timer: Observable<Int>?
    
    private var banners = [String]()
    private var banner = ""
    private var urlStrings = [String]()
    
    private var bannerTitles = [String]()
    private var bannerIDs = [Int]()
    private var imageIndex = 1

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Themes.homeBackGround
        setupScrollView()
    }
    
    func congigure(firstUpdate: Bool, lists: [HotInfoSlideDto]?) {
        scrollView.contentSize = CGSize(width: frame.width * CGFloat(banners.count), height: frame.height)
        if firstUpdate {
            guard let lists = lists else { return }
            for index in 0...lists.count - 1 {
                banners.append(lists[index].slide_pic ?? "")
                urlStrings.append(lists[index].slide_url ?? "")
                bannerTitles.append(lists[index].slide_name ?? "")
                bannerIDs.append(lists[index].slide_id ?? 0)
            }
            pageControl.numberOfPages = banners.count
            setupInfiteImageView()
            setupTimer()
        }
    }
    
    private func setupScrollView() {
        selectionStyle = .none
        contentView.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        
        scrollView.snp.makeConstraints { (scrollView) in
            scrollView.edges.equalToSuperview()
        }
        
        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (control) in
            control.bottom.equalToSuperview().offset(pHeight(-10))
            control.centerX.width.equalToSuperview()
            control.height.equalTo(pWidth(20))
        }

    }
    
    private func setupInfiteImageView() {
        //建立banners.count + 2的imageView
        for index in 0...(banners.count + 1) {
            let bannerImageView = UIImageView(frame: CGRect(x: frame.width * CGFloat(index) + pWidth(15), y: pWidth(5), width: frame.width - pWidth(30), height: frame.height - pWidth(10)))
            
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
            
            //bannerImageView.sdLoad(with: URL(string: banner))
            bannerImageView.contentMode = .scaleAspectFill
            bannerImageView.layer.cornerRadius = pWidth(15)
            bannerImageView.clipsToBounds = true
            bannerImageView.isUserInteractionEnabled = true
            bannerImageView.tag = index
            bannerImageView.rx.click.subscribeSuccess { [weak self](_) in
                
                guard let stronfSelf = self else { return }
                var urlStr = ""
                var bannerTitle = ""
                var bannerID = 0
                switch bannerImageView.tag{
                case 0:
                    urlStr = stronfSelf.urlStrings[stronfSelf.banners.count - 1]
                    bannerTitle = stronfSelf.bannerTitles[stronfSelf.banners.count - 1]
                    bannerID = stronfSelf.bannerIDs[stronfSelf.banners.count - 1]
                    break
                case stronfSelf.banners.count + 1:
                    urlStr = stronfSelf.urlStrings[0]
                    bannerTitle = stronfSelf.bannerTitles[0]
                    bannerID = stronfSelf.bannerIDs[0]
                    break
                default:
                    urlStr = stronfSelf.urlStrings[bannerImageView.tag - 1]
                    bannerTitle = stronfSelf.bannerTitles[bannerImageView.tag - 1]
                    bannerID = stronfSelf.bannerIDs[bannerImageView.tag - 1]
                    break
                }
                // 測試
//                urlStr = "paishou://noticedetail/?id=5"
//                urlStr = "paishou://loginapp/?id=https://test.tg18.net/event/1225"
//                urlStr = "paishou://rank_list"
//                urlStr = "paishou://inapp/?id=https://test.tg18.net/event/1225"
//                urlStr = "paishou://outapp/?id=https://test.tg18.net/event/1225"
                Beans.matomoServer.track(eventWithCategory: MCategory.HomePage.rawValue,
                                         action: MAction.clickBanner.rawValue ,
                                         name: bannerTitle ,
                                         value: Float(bannerID))
                if urlStr != ""{
                    DeepLinkManager.share.parserStringFromBroeser(urlStr)
                }else{
                    Log.v("首頁banner為空")
                }
            }.disposed(by: disposeBag)
            scrollView.addSubview(bannerImageView)
        }
        scrollView.contentSize = CGSize(width: frame.width * CGFloat(banners.count + 2), height: frame.height)
        scrollView.contentOffset = CGPoint(x: frame.width, y: 0)
    }
    
    private func setupTimer() {
        timer = Observable<Int>.interval(5, scheduler: MainScheduler.instance)
        timer?.subscribeSuccess { [weak self] (time) in
            self?.autoScroll()
        }.disposed(by: timerDisposeBag)
    }
    
    private func autoScroll() {
        if imageIndex == banners.count + 1 {
            imageIndex = 1
        } else {
            imageIndex += 1
        }
        scrollView.setContentOffset(CGPoint(x: frame.width * CGFloat(imageIndex), y: 0), animated: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeBannerTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        //滑動到第0張的时候, 滾到最後一張圖
        if contentOffsetX == 0 {
            scrollView.contentOffset = CGPoint(x: frame.width * CGFloat(banners.count), y: 0)
        }
        //滑動到第最後一張的时候, 滾到第0張圖
        if contentOffsetX == CGFloat(banners.count + 1) * frame.width {
            scrollView.contentOffset = CGPoint(x: frame.width, y: 0)
        }
        //改變pageControl一定要 - 0.5 因最前面第0張圖不顯示
        let index = scrollView.contentOffset.x / frame.width - 0.5
        pageControl.currentPage = Int(index)
        bannerCurrentPage.onNext(pageControl.currentPage)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setupTimer()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timerDisposeBag = DisposeBag()
    }
    
}
