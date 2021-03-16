//
//  HomeLiveTableViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/31.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeLiveTableViewCell: UITableViewCell {
    private var layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView()
    
//    private var category: Categories = .category
    private var liveclassDto : LiveclassDto!
    private var hotInfoListDtos: [HotInfoListDto]?
    private var categoryLiveDtos: [ClassLiveInfoDto]?
    private var followsLiveDtos: [FollowsListDataDto]?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = Themes.homeBackGround
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: pWidth(5), bottom: 0, right: pWidth(5))
        layout.minimumLineSpacing = pWidth(5) 
        layout.minimumInteritemSpacing = pHeight(5)
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = true
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.registerCell(type: HomeLiveCollectionViewCell.self)
        collectionView.snp.makeConstraints { (collectionView) in
            collectionView.edges.equalToSuperview()
        }
    }
    
    func configure(liveclassDto: LiveclassDto, lists: [HotInfoListDto]?) {
        self.liveclassDto = liveclassDto
        guard let lists = lists else { return }
        hotInfoListDtos = lists
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func configure(liveclassDto: LiveclassDto, lists: [ClassLiveInfoDto]?) {
        self.liveclassDto = liveclassDto
        guard let lists = lists else { return }
        categoryLiveDtos = lists
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func configure(liveclassDto: LiveclassDto, lists: [FollowsListDataDto]?) {
        self.liveclassDto = liveclassDto
        guard let lists = lists else { return }
        followsLiveDtos = lists
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
//    func configure(category: Categories, lists: [HotInfoListDto]?) {
//        self.category = category
//        guard let lists = lists else { return }
//        hotInfoListDtos = lists
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
//    }
//
//    func configure(category: Categories, lists: [ClassLiveInfoDto]?) {
//        self.category = category
//        guard let lists = lists else { return }
//        categoryLiveDtos = lists
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
//    }
//
//    func configure(category: Categories, lists: [FollowsListDataDto]?) {
//        self.category = category
//        guard let lists = lists else { return }
//        followsLiveDtos = lists
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeLiveTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let data = liveclassDto,
            let classInt = data.id?.intValue ,
            let className = data.name else {return 0}

        if classInt == 100  {
            return categoryLiveDtos?.count ?? 0
        }
        else if classInt == 101 {
            return hotInfoListDtos?.count ?? 0
        } else if classInt == 6 ,className == "其它" {
            return followsLiveDtos?.count ?? 0
        } else {
            return categoryLiveDtos?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: HomeLiveCollectionViewCell.self, indexPath: indexPath)
        guard let classInt = liveclassDto.id?.intValue ,
        let classNAme = liveclassDto.name else {return cell }
        if classInt == 100  {
            cell.configure(list: categoryLiveDtos?[indexPath.row])
        }
        else if classInt == 101 {
            cell.congigure(list: hotInfoListDtos?[indexPath.row])
        } else if classInt == 6 ,classNAme == "其它"  {
            cell.configure(list: followsLiveDtos?[indexPath.row])
        } else {
            cell.configure(list: categoryLiveDtos?[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIApplication.topViewController() as? PSTabBarController
//            ,let nvc = vc.selectedViewController?.children.first?.navigationController
        {
            let liveDetailVC : PSLiveDetailVC!
            guard let classInt = liveclassDto.id?.intValue ,
            let classNAme = liveclassDto.name else {return }
            
            if classInt == 100  {
                guard let data = self.categoryLiveDtos?[indexPath.row + indexPath.section * 3] else { return }
                Log.v("category name :  \(data.user_nicename ?? "" )")
                liveDetailVC = PSLiveDetailVC(data: data)
//                liveDetailVC.config(withUID: String(data.uid ?? 0))
                liveDetailVC.config(withUID: (((data.uid?.stringValue) != nil) ? data.uid?.stringValue : String(data.uid?.intValue ?? 0))!)
            }
            else if classInt == 101 {
                guard let data = self.hotInfoListDtos?[indexPath.row + indexPath.section * 3] else { return }
                Log.v("hot name :  \(data.user_nicename ?? "" )")
                liveDetailVC = PSLiveDetailVC(data: data)
                liveDetailVC.config(withUID: String(data.uid ?? 0))
            } else if classInt == 6 ,classNAme == "其它" {
                guard let data = self.followsLiveDtos?[indexPath.row + indexPath.section * 3] else { return }
                Log.v("follows name :  \(data.user_nicename ?? "" )")
                liveDetailVC = PSLiveDetailVC(data: data)
                liveDetailVC.config(withUID: String(data.uid ?? 0))
            } else {
                guard let data = self.categoryLiveDtos?[indexPath.row + indexPath.section * 3] else { return }
                Log.v("category name :  \(data.user_nicename ?? "" )")
                liveDetailVC = PSLiveDetailVC(data: data)
                liveDetailVC.config(withUID: (((data.uid?.stringValue) != nil) ? data.uid?.stringValue : String(data.uid?.intValue ?? 0))!)
            }
            
            vc.presentDetail(liveDetailVC)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - pWidth(20)) / 2, height: pWidth(140))
    }
    
}
