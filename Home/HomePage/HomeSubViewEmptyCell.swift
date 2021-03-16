//
//  HomeSubViewEmptyCell.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/4.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import SnapKit
class HomeSubViewEmptyCell: UITableViewCell
{
    private let emptyView = EmptyView(type: .noLiveRoom)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = UIColor(red: 246, green: 249, blue: 255)
        
        setupViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViewUI()
    {
        addSubview(emptyView)
        emptyView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}
