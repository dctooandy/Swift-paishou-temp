//
//  HomeLiveCollectionViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/31.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit

class HomeLiveCollectionViewCell: UICollectionViewCell {
    private var sportType:SportImages = .Soccer
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let channelLabel = UILabel()
    private let watchLabel = UILabel()
    private let watchIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "iconEyes"))
        img.backgroundColor = .clear
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.layer.cornerRadius = pHeight(5)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints { (imageView) in
            imageView.top.equalToSuperview().offset(pHeight(5))
            imageView.left.equalToSuperview().offset(pWidth(5))
            imageView.right.equalToSuperview().offset(pWidth(-5))
            imageView.height.equalTo(pWidth(95))
        }
        
        addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = Fonts.pingFangSCSemibold(12)
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.snp.makeConstraints { (label) in
            label.top.equalTo(imageView.snp.bottom).offset(pHeight(5))
            label.left.equalToSuperview().offset(pWidth(10))
            label.right.equalToSuperview().offset(pWidth(-10))
        }
        
        addSubview(channelLabel)
        channelLabel.textColor = .lightGray
        channelLabel.font = Fonts.pingFangSCSemibold(10)
        channelLabel.numberOfLines = 1
        channelLabel.lineBreakMode = .byTruncatingTail
        channelLabel.textAlignment = .left
        channelLabel.snp.makeConstraints { (label) in
            label.bottom.equalToSuperview()
            label.left.equalToSuperview().offset(pWidth(10))
            label.right.equalTo(imageView.snp.centerX)
        }
        
        addSubview(watchLabel)
        watchLabel.textColor = .lightGray
        watchLabel.font = Fonts.pingFangSCSemibold(10)
        watchLabel.numberOfLines = 1
        watchLabel.lineBreakMode = .byTruncatingTail
        watchLabel.textAlignment = .right
        watchLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview()
            maker.right.equalToSuperview().offset(pWidth(-10))
            maker.width.equalTo(pWidth(100))
        }
        addSubview(watchIcon)
        watchIcon.snp.makeConstraints { (label) in
            label.centerY.equalTo(watchLabel)
            label.right.equalTo(watchLabel.snp.left).offset(pWidth(-5))
            label.size.equalTo(pWidth(10))
        }
        
    }
    
    //MARK: - 熱門直播
    func congigure(list: HotInfoListDto?) {
        guard let list = list else { return }
        DispatchQueue.main.async {
            self.titleLabel.text = list.title
            self.channelLabel.text = list.user_nicename
            self.watchLabel.text = "\(list.nums ?? "0")"
            let textSize = self.watchLabel.calculateMaxHeight(width: pWidth(100))
            self.watchLabel.snp.updateConstraints { (maker) in
                maker.width.equalTo(pWidth(textSize.width))
            }
           
            self.imageView.setImage(with: URL(string: list.thumb ?? ""), placeholder:  UIImage(named: self.sportType.defaultImageName()), errorPlaceholder:  UIImage(named: self.sportType.defaultImageName()))
        }
    }
    
    //MARK: - 類別直播
    func configure(list: ClassLiveInfoDto?) {
        guard let list = list else { return }
        DispatchQueue.main.async {
//            self.imageView.sdLoad(with: URL(string: list.thumb!))
            self.titleLabel.text = list.title
            self.channelLabel.text = list.user_nicename
            self.watchLabel.text = "\(list.nums ?? "0")"
            let textSize = self.watchLabel.calculateMaxHeight(width: pWidth(100))
            self.watchLabel.snp.updateConstraints { (maker) in
                maker.width.equalTo(pWidth(textSize.width))
            }
            
            self.imageView.setImage(with: URL(string: list.thumb ?? ""), placeholder: UIImage(named: self.sportType.defaultImageName()), errorPlaceholder: UIImage(named: self.sportType.defaultImageName()))
        }
    }
    
    //MARK: - 追蹤清單
    func configure(list: FollowsListDataDto?) {
        guard let list = list else { return }
        DispatchQueue.main.async {
//            self.imageView.sdLoad(with: URL(string: list.thumb ?? ""))
            self.titleLabel.text = list.title
            self.channelLabel.text = list.user_nicename
            self.watchLabel.text = "\(list.nums ?? "" )"
            let textSize = self.watchLabel.calculateMaxHeight(width: pWidth(100))
            self.watchLabel.snp.updateConstraints { (maker) in
                maker.width.equalTo(pWidth(textSize.width))
            }
            
            self.imageView.setImage(with: URL(string: list.thumb ?? ""), placeholder: UIImage(named: self.sportType.defaultImageName()), errorPlaceholder: UIImage(named: self.sportType.defaultImageName()))
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
