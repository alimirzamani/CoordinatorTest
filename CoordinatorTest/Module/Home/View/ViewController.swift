//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class ViewController: BaseViewController {

    var didSendEventClosure: ((Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Welcome Home"
    }

    @IBAction func buyAction(_ sender: Any) {
        didSendEventClosure?(.buy)
    }

    @IBAction func createAccountAction(_ sender: Any) {
        didSendEventClosure?(.createAccount)
    }

    @IBAction func presentAction(_ sender: Any) {
        didSendEventClosure?(.present)
    }
}

extension ViewController {
    enum Event {
        case buy
        case createAccount
        case present
    }
}
