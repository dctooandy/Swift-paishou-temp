//
//  HomeBullteinTableViewCell.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/30.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import SnapKit
import HTMLString
import RxSwift
import RxCocoa

class HomeBullteinTableViewCell: UITableViewCell {
    
    private var didTapView: PublishRelay<Int> = PublishRelay()
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    private var bullteinIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "iconAnnouncement02")
        imgView.contentMode = .scaleAspectFill
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    private var speakerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        return view
    }()
    lazy var noticeView: PSRollingNoticeView = {
        let view = PSRollingNoticeView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        view.stayInterval = 1.0
        view.isUserInteractionEnabled = true
        view.register(PSRollingViewCell.self, forCellReuseIdentifier: "PSRollingViewCell")
        return view
    }()
    var coverBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        return btn
    }()
    
    var bullteinListData: [HomeBullteinItemDto] = []
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bgView.layer.cornerRadius = self.bgView.bounds.height / 2
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        noticeView.stopRoll()
    }

}
extension HomeBullteinTableViewCell{
    func setUpUI(){
        self.backgroundColor = Themes.homeBackGround
        self.contentView.backgroundColor = Themes.homeBackGround
        self.selectionStyle = .none
        self.selectionStyle = .none
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (maker) in
            maker.height.equalTo(pWidth(26))
            maker.centerY.equalToSuperview()
            maker.left.equalToSuperview().offset(pWidth(16))
            maker.right.equalToSuperview().offset(-pWidth(16))
        }
        bgView.addSubview(bullteinIcon)
        bullteinIcon.snp.makeConstraints { (maker) in
            maker.size.equalTo(pWidth(20))
            maker.left.equalToSuperview().offset(pWidth(18))
            maker.centerY.equalToSuperview()
        }
        bgView.addSubview(speakerView)
        speakerView.snp.makeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalTo(bullteinIcon.snp.right).offset(pWidth(8))
            maker.right.equalToSuperview().offset(-pWidth(8))
        }
        for v in self.speakerView.subviews{
            v.removeFromSuperview()
        }
        speakerView.addSubview(noticeView)
        noticeView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
//        contentView.addSubview(coverBtn)
//        coverBtn.snp.makeConstraints { (maker) in
//            maker.edges.equalToSuperview()
//        }
        
    }
    func configure(data: [HomeBullteinItemDto]) {
        self.bullteinListData = data
        noticeView.reloadDataAndStartRoll()
    }
    func rxDidTapView() -> Observable<Int>
    {
        return self.didTapView.asObservable()
    }
}
//MARK: 輪播大聲公文字
extension HomeBullteinTableViewCell: PSRollingNoticeViewDelegate, PSRollingNoticeViewDataSource{
    
    func numberOfRowsFor(roolingView: PSRollingNoticeView) -> Int {
        if self.bullteinListData.count > 0{
            return self.bullteinListData.count
        }else{
            return 0
        }
    }
    func rollingNoticeView(_ roolingView: PSRollingNoticeView, didClickAt index: Int) {
        self.didTapView.accept(index)
    }
    func rollingNoticeView(roolingView: PSRollingNoticeView, cellAtIndex index: Int) -> PSRollingViewCell {
        let speakerCell = roolingView.dequeueReusableCell(withIdentifier: "PSRollingViewCell")
        speakerCell?.textLabel.textColor = Themes.liveRoomPink
        speakerCell?.textLabel.isUserInteractionEnabled = true
        speakerCell?.textLabel.font = Fonts.pingFangSCRegular(12)
        if self.bullteinListData.count > 0{
            if let conten = self.bullteinListData[index].title{
                //要先把奇怪的xml還是html語法弄掉，再把html標籤弄掉
                let contentWithoutHTML = conten.removingHTMLEntities().stripHTML()
                speakerCell?.textLabel.text = contentWithoutHTML
            }else{
                speakerCell?.textLabel.text = ""
            }
        }else{
            speakerCell?.textLabel.text = ""
        }
        speakerCell?.textLabelLeading = CGFloat(10)
        return speakerCell!
    }
}
