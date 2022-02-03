//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var rootViewController: BaseViewController!

    var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()

        self.navigationController.delegate = self
    }

    func start() {
        let childCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }

    deinit {
        print("---- DEINIT: \(String(describing: self))")
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
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
        }
    }
}
