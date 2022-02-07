//
//  LoginCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/7/22.
//

import Foundation

class LoginCoordinator: BaseCoordinator {
    func start(animated: Bool = true) {
        let viewController = LoginViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            switch event {
            case .verify:
                self?.showSecondPage()
            }
        }
        navigationController.pushViewController(viewController, animated: animated)
        rootViewController = viewController
    }

    private func showSecondPage() {
        let viewController = VerifyViewController.instantiate()
        viewController.didSendEventClosure = { [weak self] event in
            switch event {
            case .verify:
                self?.showTabbar()
            }
        }
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showTabbar() {
        guard
            let parentCoordinator = parentCoordinator,
            let coordinator = findMain(coordinator: parentCoordinator) else {
                return
        }

        coordinator.showTabbar()
    }
}
