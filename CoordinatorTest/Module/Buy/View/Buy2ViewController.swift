//
//  Buy2ViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class Buy2ViewController: BaseViewController {

    var didSendEventClosure: ((Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.didSendEventClosure?(.createAccount)
        }
    }
}

extension Buy2ViewController {
    enum Event {
        case createAccount
    }
}
