//
//  AttentionMoreCollectionViewCell.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class AttentionMoreCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let fansLabel = UILabel()
    private let enterBtn = UIButton()

    private let disposeBag = DisposeBag()
    
    var btnTapped = PublishSubject<Void>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { (imageView) in
            imageView.top.equalToSuperview().offset(pWidth(15))
            imageView.centerX.equalToSuperview()
            imageView.width.equalTo(pWidth(65))
            imageView.height.equalTo(pWidth(65))
        }
        
        addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = Fonts.pingFangSCSemibold(14)
        nameLabel.numberOfLines = 1
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.snp.makeConstraints { (label) in
            label.top.equalTo(imageView.snp.bottom).offset(pWidth(10))
            label.width.equalToSuperview()
            label.centerX.equalToSuperview()
        }
        
        addSubview(fansLabel)
        fansLabel.textColor = .lightGray
        fansLabel.textAlignment = .center
        fansLabel.font = Fonts.pingFangSCSemibold(12)
        fansLabel.numberOfLines = 1
        fansLabel.lineBreakMode = .byTruncatingTail
        fansLabel.snp.makeConstraints { (label) in
            label.top.equalTo(nameLabel.snp.bottom).offset(pWidth(5))
            label.width.equalToSuperview()
            label.centerX.equalToSuperview()
        }
        
        addSubview(enterBtn)
        enterBtn.backgroundColor = Themes.homeSearchResultEnterBtn
        enterBtn.setTitle("進入".localized, for: .normal)
        enterBtn.setTitleColor(.white, for: .normal)
        enterBtn.titleLabel?.font = Fonts.pingFangSCRegular(12)
        enterBtn.rx.tap.subscribeSuccess { [weak self] in
            self?.btnTapped.onNext(())
        }.disposed(by: disposeBag)
        
        enterBtn.snp.makeConstraints { (btn) in
            btn.top.equalTo(fansLabel.snp.bottom).offset(pWidth(5))
            btn.centerX.equalToSuperview()
            btn.width.equalTo(pWidth(65))
            btn.height.equalTo(pWidth(25))
        }
    }
    
    func configure(list: AttentListDataDto?) {
        guard let list = list else { return }
        nameLabel.text = list.user_nicename
        fansLabel.text = "\(list.fans_num ?? 0) " + "粉絲".LocalizedString
        
        if list.avatar == "" {
            imageView.image = UIImage(named: "avatar")
        } else {
            imageView.sdLoad(with: URL(string: list.avatar ?? ""))
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = pWidth(10)
        clipsToBounds = true
        
        imageView.layer.cornerRadius = pWidth(33)
        imageView.clipsToBounds = true
        enterBtn.layer.cornerRadius = pWidth(12)
        enterBtn.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
