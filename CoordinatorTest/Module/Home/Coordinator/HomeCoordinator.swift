//
//  HomeCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class HomeCoordinator: MainCoordinator {
    override func start() {
        let viewController = ViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            switch event {
            case .buy:
                self?.buyAction()

            case .createAccount:
                self?.createAccount()

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
}
