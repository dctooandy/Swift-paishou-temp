//
//  HomeRankEventTableViewCell.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/23.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import SnapKit

class HomeRankEventTableViewCell: UITableViewCell {
    
    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Themes.psMyInfoBackGround
        return view
    }()
    
    var stackView: UIStackView = UIStackView()
    
    var rankImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.image = UIImage(named: "imgLeaderboardArea")
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = pWidth(8)
        return imgView
    }()
    
    var eventImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.image = UIImage(named: "imgActivityArea")
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = pWidth(8)
        return imgView
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HomeRankEventTableViewCell{
    func setupUI(){
        self.selectionStyle = .none
        backgroundColor = Themes.psMyInfoBackGround
        contentView.backgroundColor = Themes.psMyInfoBackGround
        
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(6))
            maker.bottom.equalToSuperview().offset(-pWidth(6))
            maker.right.equalToSuperview().offset(-pWidth(16))
            maker.left.equalToSuperview().offset(pWidth(16))
        }
        stackView = UIStackView(arrangedSubviews: [rankImgView, eventImgView])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = pWidth(12)
        
        bgView.addSubview(stackView)
        stackView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        rankImgView.snp.makeConstraints { (maker) in
            maker.height.equalTo(pWidth(64))
        }
        eventImgView.snp.makeConstraints { (maker) in
            maker.height.equalTo(pWidth(64))
        }
        
    }
}
