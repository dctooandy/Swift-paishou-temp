//
//  AttentTableHeaderView.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/4.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit

class AttentTableHeaderView: UIView {
    var titleLabel = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { (imageView) in
            imageView.left.equalToSuperview().offset(pWidth(20))
            imageView.centerY.equalToSuperview()
            imageView.width.height.equalTo(20)
        }
        
        addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = Fonts.pingFangSCSemibold(16)
        titleLabel.snp.makeConstraints { (label) in
            label.left.equalTo(imageView.snp.right).offset(pWidth(10))
            label.centerY.equalToSuperview()
        }
    }
    
    func congiure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
