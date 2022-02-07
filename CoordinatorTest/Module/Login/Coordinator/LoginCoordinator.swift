//
//  LoginCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/7/22.
//

import Foundation

class LoginCoordinator: BaseCoordinator {
    override func start() {
        let viewController = LoginViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            switch event {
            case .verify:
                self?.showSecondPage()
            }
        }
        navigationController.pushViewController(viewController, animated: true)
        rootViewController = viewController
    }

    private func showSecondPage() {
        let viewController = VerifyViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            switch event {
            case .verify:
                print("verified")
            }
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
