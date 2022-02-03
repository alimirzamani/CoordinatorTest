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
    }

    @IBAction func buyAction(_ sender: Any) {
        didSendEventClosure?(.buy)
    }

    @IBAction func createAccountAction(_ sender: Any) {
        didSendEventClosure?(.createAccount)
    }
}

extension ViewController {
    enum Event {
        case buy
        case createAccount
    }
}
