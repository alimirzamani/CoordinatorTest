//
//  HomeCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    override func start() {
        let viewController = ViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            switch event {
            case .buy:
                self?.buyAction()

            case .createAccount:
                self?.createAccount()

            case .present:
                self?.presentAction()
            }
        }

        self.navigationController.pushViewController(viewController, animated: false)
        rootViewController = viewController
    }

    private func buyAction() {
        let childCoordinator = BuyCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }

    private func createAccount() {
        let childCoordinator = CreateAccountCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }

    private func presentAction() {
        let navController = UINavigationController()

        let childCoordinator = PresentCoordinator(navigationController: navController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
}
