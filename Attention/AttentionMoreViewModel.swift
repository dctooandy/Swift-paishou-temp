//
//  AttentionMoreViewModel.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
import RxCocoa
import RxSwift

class AttentionMoreViewModel: BaseViewModel {
    private var submitLabelVisial = PublishSubject<Bool>()
    private var editPasswordSuccess = PublishSubject<Void>()
    
    override init() {
        super.init()
        self.bind()
    }
    func bind() {
        
    }
    func editPassword(oldpwd oldpwdString: String,newpwd newpwdString: String)
    {

    }
 
    
    func rxSubmitLabelVisial() -> Observable<Bool> {
        return submitLabelVisial.asObserver()
    }
    func rxEditPasswordSuccess() -> Observable<Void>
    {
        return editPasswordSuccess.asObserver()
    }
}
