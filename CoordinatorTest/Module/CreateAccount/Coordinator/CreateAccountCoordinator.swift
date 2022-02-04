//
//  CreateAccountCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class CreateAccountCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator?

    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var rootViewController: BaseViewController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()

        self.navigationController.delegate = self
        print("[MM][C][+] INIT: \(String(describing: self))")
    }

    deinit {
        print("[MM][C][-] DEINIT: \(String(describing: self))")
    }

    func start() {
        let viewController = CreateAccountViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
        rootViewController = viewController
    }
}

extension CreateAccountCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.

        // I think this one will mess things up
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if fromViewController == rootViewController {
            self.childDidFinish()
            parentCoordinator?.resetDelegate()
        }
    }
}
