//
//  HomeCategoryTableCollectionViewCell.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/4.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Lottie

class HomeCategoryTableCollectionViewCell: UICollectionViewCell {
    private var sportType:SportImages = .Soccer
    private var cellData:LiveclassDto?
    private let cellButton = UIButton()
    private var cellBtnTap = PublishSubject<Int>()
    let buttonLoadingView: AnimationView = {
        let view = AnimationView(name:"circles-menu-1")
        //let view = AnimationView(name:"testLoding")
        view.loopMode = LottieLoopMode.loop
        view.animationSpeed = 1
        view.isHidden = true
        return view
    }()
    override init(frame: CGRect) {
        
    super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension HomeCategoryTableCollectionViewCell{
    func setUpUI(){
        
        addSubview(cellButton)
        cellButton.backgroundColor = .white
        cellButton.applyCornerRadius(radius: 10)
        let widthS = (UIScreen.main.bounds.width - pWidth(80)) / 3
        let heightS = (pWidth(250) - pWidth(60)) / 2
        cellButton.snp.makeConstraints { (maker) in
            maker.height.equalTo(heightS)
            maker.width.equalTo(widthS)
            maker.top.centerY.equalToSuperview()
        }
        self.isUserInteractionEnabled = true
        cellButton.isUserInteractionEnabled = true
        cellButton.addTarget(self, action: #selector(okButtonPressed(_:)), for: .touchUpInside)
        cellButton.isHidden = true
        
        addSubview(buttonLoadingView)
        buttonLoadingView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
    }
    @objc private func okButtonPressed(_ sender: UIButton) {
        // go app down load web
        if let tapInt = cellData?.id?.intValue
        {
            Log.v("點到了 :\(tapInt)")
            self.cellBtnTap.onNext(tapInt)
        }
    }
    func rxCellBtnTap() -> Observable<Int>
    {
        return self.cellBtnTap.asObserver()
    }
    func categoryConfig(data:LiveclassDto)
    {
        let defaultImage = UIImage(named: self.sportType.grayImageName())
        self.cellData = data
        self.cellButton.setImage(defaultImage, for: .normal)
        if let urlString = data.thumb
        {
            buttonLoadingView.isHidden = false
            buttonLoadingView.play()
            self.cellButton.kf.setImage(with: URL(string: urlString), for: .normal, placeholder: defaultImage, completionHandler:  { (success) in
                if let iamge = self.cellButton.image(for: .normal)
                {
                    let newImage = iamge.reSizeImage(reSize: CGSize(width: pWidth(50), height: pWidth(50)),corner: 0)
                    self.cellButton.setImage(newImage, for: .normal)
                }
                self.buttonLoadingView.stop()
                self.buttonLoadingView.isHidden = true
                self.cellButton.isHidden = false
                self.buttonSetUP()
                self.cellButton.alignVertical(spacing: 6, imageTop: true)
            })
        }
        buttonSetUP()
    }
    private func buttonSetUP()
    {
        cellButton.imageView?.contentMode = .scaleAspectFit
        cellButton.setTitle(cellData?.name ?? "", for: .normal)
        cellButton.setTitleColor(.black, for: .normal)
    }
}
