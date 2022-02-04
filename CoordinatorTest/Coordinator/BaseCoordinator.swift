//
//  BaseCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/4/22.
//

import UIKit

class BaseCoordinator: NSObject, Coordinator {
    var rootViewController: BaseViewController!

    var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()

        self.navigationController.delegate = self
        print("[MM][C][+] INIT: \(String(describing: self))")
    }

    func start() {
    }

    deinit {
        print("[MM][C][-] DEINIT: \(String(describing: self))")
    }
}

extension BaseCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if fromViewController == rootViewController {
            self.childDidFinish()
            parentCoordinator?.resetDelegate()
        }
    }
}
