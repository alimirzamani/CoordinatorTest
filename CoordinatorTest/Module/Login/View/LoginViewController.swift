//
//  LoginViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/7/22.
//

import UIKit

class LoginViewController: BaseViewController {

    var didSendEventClosure: ((Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func verifyAction(_ sender: Any) {
        didSendEventClosure?(.verify)
    }
}

extension LoginViewController {
    enum Event {
        case verify
    }
}

