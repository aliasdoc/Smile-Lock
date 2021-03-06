//
//  MyPasswordUIValidation.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

class MyPasswordModel {
    class func match(password: String) -> MyPasswordModel? {
        guard password == "123456" else { return nil }
        return MyPasswordModel()
    }
}

class MyPasswordUIValidation: PasswordUIValidation<MyPasswordModel> {
    init(in stackView: UIStackView) {
        super.init(in: stackView, digit: 6)
        self.validation = { password in
            MyPasswordModel.match(password)
        }
    }
    //handle Touch ID
    override func touchAuthenticationComplete(passwordContainerView: PasswordContainerView, success: Bool) {
        if success {
            let dummyModel = MyPasswordModel()
            self.success?(dummyModel)
        } else {
            self.failure?()
        }
    }
}
