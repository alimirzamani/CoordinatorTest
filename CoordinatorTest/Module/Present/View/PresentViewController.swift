//
//  PresentViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/4/22.
//

import UIKit

class PresentViewController: BaseViewController {

    var didSendEventClosure: ((Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        didSendEventClosure?(.present2)
    }
}

extension PresentViewController {
    enum Event {
        case present2
    }
}
