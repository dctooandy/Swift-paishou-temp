//
//  AttentionMoreViewController.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
import RxCocoa
import RxSwift
import Toaster

class AttentionMoreViewController: BaseViewController {
    fileprivate let viewModel = AttentionMoreViewModel()
    private var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //上下
//        layout.minimumLineSpacing = pHeight(10)
        //左右
        layout.minimumInteritemSpacing = pWidth(0)
        //滑動方向
        layout.scrollDirection = .vertical
        //itemSize
        layout.itemSize = CGSize(width: (Views.screenWidth - pWidth(40)) / 3, height: pWidth(170))
        //左右間距
        layout.sectionInset = UIEdgeInsets(top: pWidth(5), left: pWidth(10), bottom: pWidth(5), right: pWidth(10))

        return layout
    }()
    var attentListDataDto : [AttentListDataDto]!
    private lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.registerCell(type: AttentionMoreCollectionViewCell.self)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "關注主播".LocalizedString
        setupUI()
        bindViewModel()
        bindTap()
        bindThemes()
        bindTextfield()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchViewModelData()
        setupData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    init(data: [AttentListDataDto] = [AttentListDataDto()])
    {
        super.init()
        self.attentListDataDto = data
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI()
    {
        view.backgroundColor = #colorLiteral(red: 0.9643180966, green: 0.9753912091, blue: 1, alpha: 1)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(10))
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-Views.tabBarHeight)
        }
    }
    func bindTextfield() {
        
        
    }
    func bindViewModel()
    {
    
       
    }
    func bindTap()
    {
        
    }
    func bindThemes()
    {
        
    }
    func fetchViewModelData()
    {

    }
    func setupData()
    {
        
    }
}
extension AttentionMoreViewController:UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = self.attentListDataDto.count
        let disCount = (count / 3)
        let modRow = (count % 3)
        let totalLine = (modRow == 0) ? (count != 0 ? disCount : 0) : (disCount + 1)
        let finalCount = count - (disCount * 3)
        return (modRow == 0) ? 3 : ((totalLine == (section + 1)) ? finalCount : 3 )
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = self.attentListDataDto.count
        let disCount = (count / 3)
        let modRow = (count % 3)
        return (modRow == 0) ? (count != 0 ? disCount : 0) : (disCount + 1)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: AttentionMoreCollectionViewCell.self, indexPath: indexPath)
        let sectionCount = (indexPath.section * 3)
        cell.configure(list: attentListDataDto[indexPath.row + sectionCount])
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Log.v("data name :  \(self.attentListDataDto[indexPath.row + indexPath.section*3].user_nicename ?? "" )")
        if let vc = UIApplication.topViewController() as? PSTabBarController
        {
            guard let data = self.attentListDataDto?[indexPath.row + indexPath.section * 3] else { return }
            let liveDetailVC = PSLiveDetailVC(data: data)
            liveDetailVC.config(withUID: String(data.id ?? 0))
            vc.presentDetail(liveDetailVC)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (Views.screenWidth - 40) / 3, height: pWidth(170))
//    }
    
}
