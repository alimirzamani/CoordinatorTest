//
//  BuyViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class BuyViewController: BaseViewController {

    var didSendEventClosure: ((Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Buy"
    }

    @IBAction func createAccountAction(_ sender: Any) {
        didSendEventClosure?(.createAccount)
    }
}

extension BuyViewController {
    enum Event {
        case createAccount
    }
}

