//
//  BaseViewController.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded {

    var childDidFinish: (() -> Void)?

    deinit {
        print("[MM][V][-] DEINIT: \(String(describing: self))")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if self.navigationController?.isBeingDismissed == true {
            childDidFinish?()
        }
    }
}
