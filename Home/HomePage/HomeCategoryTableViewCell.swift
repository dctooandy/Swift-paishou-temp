//
//  HomeCategoryTableViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/31.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeCategoryTableViewCell: UITableViewCell {
    
    private lazy var collectionView = UICollectionView()
    private var layout = UICollectionViewFlowLayout()
    private var liveClassDatas:[LiveclassDto] = []
    
    private let disposeBag = DisposeBag()
    
    private var btnTapped = PublishSubject<LiveclassDto>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = UIColor(red: 246, green: 249, blue: 255)

        setupCollectionViewUI()
        bindConfigData()
    }
    func setupCollectionViewUI()
    {
        //左右
        layout.minimumLineSpacing = pWidth(20)
        //上下
        layout.minimumInteritemSpacing = pWidth(10)
        //滑動方向
        layout.scrollDirection = .vertical
        //itemSize
        let widthS = (UIScreen.main.bounds.width - pWidth(80)) / 3
        let heightS = (pWidth(250 - 60)) / 2
        layout.itemSize = CGSize(width: widthS, height: heightS)
        //左右間距
        layout.sectionInset = UIEdgeInsets(top: pWidth(20), left: pWidth(20), bottom: pWidth(20), right: pWidth(20))
//
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
//        collectionView.allowsMultipleSelection = true
        
        collectionView.register(HomeCategoryTableCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCategoryTableCollectionViewCell")
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.top.bottom.left.right.equalToSuperview()
        }
    }
    func configure(datas: [LiveclassDto]?) {
        guard let datas = datas else { return }
        self.liveClassDatas = datas
        self.collectionView.reloadData()

    }
    func bindConfigData()
    {
        HomeConfigInfoDto.rxShare.subscribeSuccess { [weak self](dto) in
            guard let claseeData = dto?.liveclass else { return }
            self?.liveClassDatas = claseeData
            self?.collectionView.reloadData()
        }.disposed(by: disposeBag)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func rxBtnTapped() -> Observable<LiveclassDto>
    {
        return self.btnTapped.asObserver()
    }
}
extension HomeCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liveClassDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryTableCollectionViewCell", for: indexPath) as! HomeCategoryTableCollectionViewCell

        cell.categoryConfig(data: self.liveClassDatas[indexPath.item])
        cell.rxCellBtnTap().subscribeSuccess { [weak self](cellInt) in
            guard let classData = self?.liveClassDatas.filter({$0.id?.intValue == cellInt}).first else {return}
//            guard  let newCategorys = Categories.init(rawValue: cellInt) else { return  }
            self?.btnTapped.onNext(classData)
        }.disposed(by: cell.rx.reuseBag)
        return cell
    }

}
