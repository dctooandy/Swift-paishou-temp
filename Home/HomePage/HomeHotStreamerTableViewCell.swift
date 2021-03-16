//
//  HomeHotStreamerTableViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/28.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit

class HomeHotStreamerTableViewCell: UITableViewCell {
    private var layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView()
    
//    private var hotStreamerDtos: [RecommendInfoDto]?
    private var hotStreamerDtos: [HotnanchourListDto]?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = Themes.homeBackGround
        
        layout.minimumLineSpacing = pWidth(10)
        layout.minimumInteritemSpacing = pWidth(10)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: pWidth(5), left: pWidth(5), bottom: pWidth(5), right: pWidth(5))
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCell(type: HomeHotStreamerCollectionViewCell.self)
        collectionView.snp.makeConstraints { (collectionView) in
            collectionView.edges.equalToSuperview()
        }
    }
    
    func configure(lists: [HotnanchourListDto]?) {
        hotStreamerDtos = lists
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeHotStreamerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotStreamerDtos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: HomeHotStreamerCollectionViewCell.self, indexPath: indexPath)
        cell.configure(list: hotStreamerDtos?[indexPath.row], row: indexPath.row + 1) 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIApplication.topViewController() as? PSTabBarController
        {
            guard let data = self.hotStreamerDtos?[indexPath.row] else { return }
            let liveDetailVC = PSLiveDetailVC(data: data)
            liveDetailVC.config(withUID: String(data.uid ?? 0))
            vc.presentDetail(liveDetailVC)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - pWidth(60)) / 4, height: pWidth(100))
    }
    

}
