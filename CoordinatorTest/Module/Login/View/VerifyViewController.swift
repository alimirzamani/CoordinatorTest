//
//  VerifyViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/7/22.
//

import UIKit

class VerifyViewController: BaseViewController {

    var didSendEventClosure: ((Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func verifyAction(_ sender: Any) {
        didSendEventClosure?(.verify)
    }
}

extension VerifyViewController {
    enum Event {
        case verify
    }
}
