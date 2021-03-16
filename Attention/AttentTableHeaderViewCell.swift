//
//  AttentTableHeaderViewCell.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/8.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AttentTableHeaderViewCell: UITableViewCell {
    private var disposeBag = DisposeBag()
    private var moreLabelTapSuccess = PublishSubject<Void>()
    private var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.pingFangSCSemibold(16)
        return label
    }()
    private var logoImageView = UIImageView()
    private var moreLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0.7176470588, blue: 0.9254901961, alpha: 1)
        label.font = Fonts.pingFangSCSemibold(14)
        label.text = "更多".LocalizedString + ">"
        label.textAlignment = .right
        label.isHidden = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        bindLabel()
    }
    private func setupUI()
    {
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(moreLabel)
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(pWidth(20))
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(pWidth(20))
        }

        titleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(logoImageView.snp.right).offset(pWidth(10))
            maker.centerY.equalToSuperview()
        }

        moreLabel.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
            maker.right.equalToSuperview().offset(-pWidth(34))
            maker.height.equalTo(pWidth(20))
            maker.width.equalTo(pWidth(100))
        }
    }
    private func bindLabel()
    {
        moreLabel.rx.click.subscribeSuccess { (_) in
            Log.v("更多被點到")
            self.moreLabelTapSuccess.onNext(())
        }.disposed(by: disposeBag)
    }
    func congiure(title: String, image: UIImage, showMore:Bool = false) {
        titleLabel.text = title
        logoImageView.image = image
        moreLabel.isHidden = !showMore
    }
    func rxMoreLabelTapSuccess() -> Observable<Void>
    {
        return moreLabelTapSuccess.asObserver()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
