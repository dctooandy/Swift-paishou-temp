//
//  HomePagingCell.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/24.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import Parchment
import RxCocoa
import RxSwift

struct HomePagingCellViewModel {
    let title: String
    let selected: Bool
    let textColor: UIColor
    let selectedTextColor: UIColor
    
    init(title: String, selected: Bool, options: PagingOptions) {
        self.title = title
        self.selected = selected
        self.textColor = options.textColor
        self.selectedTextColor = options.selectedTextColor
    }
}

class HomePagingCell: PagingCell {
    private let titleLabel = UILabel()
    fileprivate var viewModel: HomePagingCellViewModel?
    override var isSelected: Bool{
        didSet{
            DispatchQueue.main.async {
                if self.isSelected{
                    
                }else{

                }
            }
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = Fonts.pingFangSCRegular(20)
        titleLabel.snp.makeConstraints { (label) in
            label.top.equalTo(self.snp.top)
            label.bottom.equalTo(self.snp.bottom)
            label.width.equalTo(self.snp.width)
            label.centerY.equalTo(self.snp.centerY)
        }
    }
    
    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        if let item = pagingItem as? HomeMenuItem {
            let viewModel = HomePagingCellViewModel(title: item.title, selected: selected, options: options)
            titleLabel.text = viewModel.title
            if viewModel.selected {
                titleLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                titleLabel.textColor = viewModel.selectedTextColor
            } else {
                titleLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                titleLabel.textColor = viewModel.textColor
            }
            titleLabel.font = options.font
            self.viewModel = viewModel
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
