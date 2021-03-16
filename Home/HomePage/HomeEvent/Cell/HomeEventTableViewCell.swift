//
//  HomeEventTableViewCell.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2021/1/8.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class HomeEventTableViewCell: UITableViewCell {
    
    private var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.8
        view.layer.cornerRadius = pWidth(8)
        return view
    }()
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = pWidth(8)
        return view
    }()
    private var bgImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = Themes.psHomeEventPlaceHolder
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = pWidth(8)
        imgView.isUserInteractionEnabled = true
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    private var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Themes.psTextHomeEventBlack
        label.font = Fonts.pingFangTCSemibold(14)
        return label
    }()
    private var eventTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Themes.psTextHomeEventLightGary
        label.font = Fonts.pingFangTCRegular(12)
        return label
    }()
    
    var shareImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.image = UIImage(named: "iconEventShare")
        return imgView
    }()
    
    var copyImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.image = UIImage(named: "iconEventLink")
        return imgView
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = Fonts.pingFangTCSemibold(12)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = pWidth(8)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension HomeEventTableViewCell{
    func setUpUI(){
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(shadowView)
        shadowView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(6))
            maker.bottom.equalToSuperview().offset(-pWidth(6))
            maker.left.equalToSuperview().offset(pWidth(24))
            maker.right.equalToSuperview().offset(-pWidth(24))
        }
        shadowView.addSubview(bgView)
        bgView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        bgView.addSubview(bgImgView)
        bgImgView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(pWidth(156))
        }
        bgImgView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(20))
            maker.left.equalToSuperview().offset(pWidth(20))
            maker.width.equalTo(pWidth(60))
            maker.height.equalTo(pWidth(20))
        }
        bgView.addSubview(copyImgView)
        copyImgView.snp.makeConstraints { (maker) in
            maker.size.equalTo(pWidth(24))
            maker.right.equalToSuperview().offset(-pWidth(16))
            maker.top.equalTo(bgImgView.snp.bottom).offset(pWidth(15))
        }
        bgView.addSubview(shareImgView)
        shareImgView.snp.makeConstraints { (maker) in
            maker.size.equalTo(pWidth(24))
            maker.right.equalTo(copyImgView.snp.left).offset(-pWidth(12))
            maker.top.equalTo(copyImgView.snp.top)
        }
        bgView.addSubview(eventTitleLabel)
        eventTitleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(bgImgView.snp.bottom).offset(pWidth(12))
            maker.left.equalToSuperview().offset(pWidth(16))
            maker.right.equalTo(shareImgView.snp.left).offset(-pWidth(8))
        }
        bgView.addSubview(eventTimeLabel)
        eventTimeLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(eventTitleLabel.snp.bottom).offset(pWidth(4))
            maker.left.equalTo(eventTitleLabel.snp.left)
            maker.right.equalTo(eventTitleLabel.snp.right)
            //maker.bottom.equalToSuperview().offset(-pWidth(4))
        }
        
    }
    func config(data: HomeEventItemDto){
        if let title = data.event_name,
           let imgUrlString = data.event_pic,
           let status = data.event_status,
           let eventUrl = data.event_url,
           let startTime = data.start_at,
           let endTime = data.end_at{
            eventTitleLabel.text = title
            eventTimeLabel.text = startTime + " ~ " + endTime
            setBgImg(urlString: imgUrlString)
            setStatus(status: status)
        }
    }
    func setBgImg(urlString: String){
        if let url = URL(string: urlString){
            self.bgImgView.setImage(with: url, placeholder: UIImage().mergeHomeEventTopPlaceHolderImage(), errorPlaceholder: UIImage().mergeHomeEventTopPlaceHolderImage(), completeBlock: nil)
        }else{
            self.bgImgView.image = UIImage().mergeHomeEventTopPlaceHolderImage()
        }
    }
    func setStatus(status: String){
        statusLabel.text = status
        switch status{
        case "即将开始":
            statusLabel.backgroundColor = Themes.psNavigationBar
            break
        case "进行中":
            statusLabel.backgroundColor = Themes.psScheduleDateBackground
            break
        case "即将结束":
            statusLabel.backgroundColor = Themes.psTextHomeEventBlack
            break
        default:
            break
        }
    }
}
