//
//  HomeSearchLiveCollectionViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit

class HomeSearchLiveCollectionViewCell: UICollectionViewCell {
    private var sportType:SportImages = .Soccer
    private var roomData: SearchRoomListDto = SearchRoomListDto()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let channelLabel = UILabel()
    private let watchLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.applyCornerRadius(radius: pWidth(7))
        imageView.contentMode = .scaleAspectFit
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
        watchLabel.snp.makeConstraints { (label) in
            label.bottom.equalToSuperview()
            label.right.equalToSuperview().offset(pWidth(-10))
            label.left.equalTo(imageView.snp.centerX)
        }
    }

    func configure(data : SearchRoomListDto)
    {
        self.roomData = data
        let defaultImage = UIImage(named: self.sportType.defaultImageName())
        self.imageView.setImage(with: URL(string: self.roomData.thumb ?? ""), placeholder: defaultImage, errorPlaceholder: defaultImage)
        self.titleLabel.text = self.roomData.title ?? ""
        self.channelLabel.text = self.roomData.user_nicename ?? ""
        self.watchLabel.text = "\(self.roomData.room_heat ?? 0)"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
