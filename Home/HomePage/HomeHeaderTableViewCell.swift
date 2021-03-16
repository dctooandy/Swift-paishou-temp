//
//  HomeTableHeaderView.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/28.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeHeaderTableViewCellDelegate: class{
    func selectSeeMoreAction(index:Int)
}

class HomeHeaderTableViewCell: UITableViewCell {
    var index = -1
    weak var delegate: HomeHeaderTableViewCellDelegate?
    private let coverView = UIView()
    private let titleLabel = UILabel()
    private let logoImageView = UIImageView()
    private let seeMoreLabel = UILabel()
    
    private let seeMoreSuccess = PublishSubject<Int>()
    private let disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Themes.homeBackGround
        
        coverView.backgroundColor = .clear
        selectedBackgroundView = coverView
        
        addSubview(logoImageView)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.snp.makeConstraints { (imageView) in
            imageView.left.equalToSuperview().offset(pWidth(20))
            imageView.centerY.equalToSuperview()
            imageView.width.equalTo(pWidth(20))
            imageView.height.equalTo(pWidth(20))
        }
        
        addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.font = Fonts.pingFangSCSemibold(16)
        titleLabel.snp.makeConstraints { (label) in
            label.left.equalTo(logoImageView.snp.right).offset(pWidth(10))
            label.centerY.equalToSuperview()
        }
        
        contentView.addSubview(seeMoreLabel)
        seeMoreLabel.text = "查看更多".localized
        seeMoreLabel.textColor = UIColor(red: 24, green: 144, blue: 255)
        seeMoreLabel.font = Fonts.pingFangSCRegular(14)
        seeMoreLabel.rx.click.subscribeSuccess { [weak self] (_) in
            self?.delegate?.selectSeeMoreAction(index: self?.index ?? -1)
        }.disposed(by: disposeBag)
        seeMoreLabel.snp.makeConstraints { (label) in
            label.centerY.equalToSuperview()
            label.right.equalToSuperview().offset(pWidth(-15))
        }
        
    }
    
    func congiure(searchType:SearchResultType = .all,
                  title: String,
                  image: UIImage,
                  seeMore: Bool ,
                  delegate :HomeHeaderTableViewCellDelegate? = nil)
    {
        if seeMore {
            seeMoreLabel.isHidden = false
        } else {
            seeMoreLabel.isHidden = true
        }
        self.index = searchType.rawValue
        self.delegate = delegate
        titleLabel.text = title
        logoImageView.image = image
    }
    
    func rxSeeMoreSuccess() -> Observable<Int> {
        return seeMoreSuccess.asObserver()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
