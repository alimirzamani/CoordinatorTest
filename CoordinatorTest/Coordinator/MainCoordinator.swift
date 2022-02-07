//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class MainCoordinator: BaseCoordinator {
    // login & not logged in will handle here
    override func start() {

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let isLoggedIn = appDelegate?.isLoggedIn ?? false

        if isLoggedIn {
            showTabbar()
        } else {
            showLogin()
        }
    }

    func showTabbar() {
        cleanUP()

        let childCoordinator = TabbarCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }

    func showLogin() {
        cleanUP()

        let childCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start(animated: false)
    }
}
