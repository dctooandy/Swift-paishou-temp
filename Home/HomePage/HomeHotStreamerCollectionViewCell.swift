//
//  HomeHotStreamerCollectionViewCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/28.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit

class HomeHotStreamerCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let randomColors = [UIColor(red: 247, green: 89, blue: 171).cgColor, UIColor(red: 54, green: 207, blue: 201).cgColor, UIColor(red: 146, green: 84, blue: 222).cgColor, UIColor(red: 250, green: 173, blue: 20).cgColor, UIColor(red: 255, green: 77, blue: 79).cgColor]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Themes.homeBackGround
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(pWidth(5))
            maker.centerX.equalToSuperview()
            maker.width.equalTo(pWidth(60))
            maker.height.equalTo(pWidth(60))
        }
        
        addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = Fonts.pingFangSCRegular(12)
        nameLabel.numberOfLines = 1
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(pWidth(-2))
            maker.width.equalToSuperview()
            maker.centerX.equalToSuperview()
        }
    }
    
    func configure(list: HotnanchourListDto?, row: Int) {
        guard let list = list else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = list.user_nicename
            if list.avatar == "" {
                self.imageView.image = UIImage(named: "avatar")
            } else {
                let errorImage = UIColor.gray.setImageColor(CGSize(width: self.frame.width, height: self.frame.height))
                self.imageView.setImage(with: URL(string: list.avatar ?? ""), placeholder: errorImage, errorPlaceholder: errorImage)
            }
            self.makeCircle(row: row)
        }
    }
    
    func makeCircle(row: Int) {
        let aDegree = CGFloat.pi / 180
        let lineWidth: CGFloat = pWidth(2)//線條寬度
        let radius: CGFloat = pWidth(32)
        let startDegree: CGFloat = 270
        let percentage: CGFloat = 100 //百分比
        let percentageLayer = CAShapeLayer()
        percentageLayer.path = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius + pWidth(5), y: lineWidth + radius + pWidth(1)), radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage / 100), clockwise: true).cgPath
        percentageLayer.lineWidth = lineWidth
        percentageLayer.fillColor = UIColor.clear.cgColor
        
        if row % 3 == 0 {
            percentageLayer.strokeColor = randomColors[2]
        } else if row % 4 == 0 {
            percentageLayer.strokeColor = randomColors[3]
        } else if row % 5 == 0 {
            percentageLayer.strokeColor = randomColors[4]
        } else if row % 2 == 0 {
            percentageLayer.strokeColor = randomColors[1]
        } else {
            percentageLayer.strokeColor = randomColors[0]
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2 * (radius + lineWidth), height: 2 * (radius + lineWidth)))
        label.textAlignment = .center
        
        label.text = "" //"\(percentage)%"
        let circleView = UIView(frame: label.frame)
        circleView.layer.addSublayer(percentageLayer)
        circleView.addSubview(label)
        addSubview(circleView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = pWidth(30)
        imageView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
