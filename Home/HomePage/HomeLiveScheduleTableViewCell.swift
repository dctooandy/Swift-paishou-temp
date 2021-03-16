//
//  HomeLiveScheduleTableViewCell.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/23.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class HomeLiveScheduleTableViewCell: UITableViewCell {
    private var sportType:SportImages = .Soccer
    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var liveBgImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = Themes.psHomePageLiveScheduleImage
        return imgView
    }()
    
    var liveTextImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "imgLiveText")
        return imgView
    }()
    
    var liveLabel: UILabel = {
        let label = UILabel()
        label.text = "直播中"
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.pingFangTCRegular(10)
        return label
    }()
    
    var teamImgStackView: UIStackView = UIStackView()
    
    var homeTeamImgView: UIImageView = {
        let imgView = UIImageView()
        //imgView.image = UIImage(named: "BaseBlueBackground")
        imgView.backgroundColor = .white
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = pWidth(18)
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.layer.borderWidth = 1
        return imgView
    }()
    
    var outTeamImgView: UIImageView = {
        let imgView = UIImageView()
        //imgView.image = UIImage(named: "BaseBlueBackground")
        imgView.backgroundColor = .white
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = pWidth(18)
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.layer.borderWidth = 1
        return imgView
    }()
    
    var teamNameStackView: UIStackView = UIStackView()
    
    var gameNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.pingFangTCRegular(12)
        label.textColor = Themes.psTextColorGray
        label.text = "--"
        return label
    }()
    
    var teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.pingFangTCSemibold(14)
        label.textColor = .black
        label.text = "--"
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
extension HomeLiveScheduleTableViewCell{
    func setupUI(){
        self.selectionStyle = .none
        backgroundColor = Themes.psMyInfoBackGround
        contentView.backgroundColor = Themes.psMyInfoBackGround
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(6))
            maker.bottom.equalToSuperview().offset(-pWidth(6))
            maker.left.equalToSuperview().offset(pWidth(16))
            maker.right.equalToSuperview().offset(-pWidth(16))
        }
        bgView.addSubview(liveBgImgView)
        liveBgImgView.snp.makeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalToSuperview()
            maker.width.equalTo(pWidth(64))
        }
        liveBgImgView.addSubview(liveTextImgView)
        liveTextImgView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(14))
            maker.width.equalTo(pWidth(40))
            maker.height.equalTo(pWidth(16))
            maker.centerX.equalToSuperview()
        }
        liveBgImgView.addSubview(liveLabel)
        liveLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(liveTextImgView.snp.bottom).offset(pWidth(6))
            maker.centerX.equalToSuperview()
        }
        
        
        teamImgStackView = UIStackView(arrangedSubviews: [homeTeamImgView, outTeamImgView])
        teamImgStackView.alignment = .fill
        teamImgStackView.distribution = .fill
        teamImgStackView.axis = .horizontal
        teamImgStackView.spacing = -pWidth(8)
        
        contentView.addSubview(teamImgStackView)
        teamImgStackView.snp.makeConstraints { (maker) in
            maker.left.equalTo(liveBgImgView.snp.right).offset(pWidth(12))
            maker.centerY.equalToSuperview()
        }
        homeTeamImgView.snp.makeConstraints { (maker) in
            maker.size.equalTo(pWidth(36))
        }
        outTeamImgView.snp.makeConstraints { (maker) in
            maker.size.equalTo(pWidth(36))
        }
        teamImgStackView.bringSubviewToFront(homeTeamImgView)
        
        teamNameStackView = UIStackView(arrangedSubviews: [gameNameLabel, teamNameLabel])
        teamNameStackView.alignment = .fill
        teamNameStackView.distribution = .fill
        teamNameStackView.axis = .vertical
        teamNameStackView.spacing = pWidth(3)
        
        contentView.addSubview(teamNameStackView)
        teamNameStackView.snp.makeConstraints { (maker) in
            maker.left.equalTo(teamImgStackView.snp.right).offset(pWidth(12))
            maker.centerY.equalToSuperview()
            maker.right.equalToSuperview().offset(-pWidth(8))
        }
        
    }
    func config(data: HomeEventHotItemDto, index: Int){
        guard let cn = data.cn,
              let homeTeam = data.home,
              let outTeam = data.away,
              let hlog = data.hlog,
              let alog = data.alog else {return}
        self.gameNameLabel.text = cn
        self.teamNameLabel.text = homeTeam + " vs " + outTeam
     
        let defaultImage = UIImage(named: self.sportType.grayImageName())
        
        if let hlogUrl = URL(string: hlog){
            self.homeTeamImgView.setImage(with: hlogUrl, placeholder: defaultImage, errorPlaceholder: defaultImage, completeBlock: nil)
        }else{
            self.homeTeamImgView.image = defaultImage
        }
        if let alogUrl = URL(string: alog){
            self.outTeamImgView.setImage(with: alogUrl, placeholder: defaultImage, errorPlaceholder: defaultImage, completeBlock: nil)
        }else{
            self.outTeamImgView.image = defaultImage
        }
        
    }

}
