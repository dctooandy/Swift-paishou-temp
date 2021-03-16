//
//  HomeEventClassCollectionViewCell.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2021/1/8.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import UIKit
import SnapKit

class HomeEventClassCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                typeLabel.textColor = .white
                contentView.backgroundColor = Themes.psNavigationBar
                contentView.layer.borderWidth = 0
            }else{
                typeLabel.textColor = .black
                contentView.backgroundColor = .clear
                contentView.layer.borderWidth = 1
            }
        }
    }
    
    var typeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.pingFangSCSemibold(14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.contentView.layer.cornerRadius = pHeight(4)
        self.contentView.layer.borderColor = Themes.psSystemGray.cgColor
        self.contentView.layer.borderWidth = 1
    }
}
extension HomeEventClassCollectionViewCell{
    func setUpUI(){
        contentView.addSubview(typeLabel)
        typeLabel.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    func config(data: HomeEventCategoryListDto){
        if let title = data.title{
            self.typeLabel.text = title
        }
    }
    func configWithFirstItem(){
        self.typeLabel.text = "最新".LocalizedString
    }
}
