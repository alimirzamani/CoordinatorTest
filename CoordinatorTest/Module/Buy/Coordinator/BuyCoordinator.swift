//
//  BuyCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class BuyCoordinator: MainCoordinator {
    override func start() {
        let viewController = BuyViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            self?.secondBuyAction()
        }
        navigationController.pushViewController(viewController, animated: true)
        self.rootViewController = viewController
    }

    private func createAccount() {
        let childCoordinator = CreateAccountCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }

    private func secondBuyAction() {
        let viewController = Buy2ViewController.instantiate()
        viewController.didSendEventClosure = { event in
            print("hello")
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
