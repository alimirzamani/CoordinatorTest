//
//  PresentCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/4/22.
//

import Foundation

class PresentCoordinator: BaseCoordinator {
    override func start() {
        let viewController = PresentViewController.instantiate()
        viewController.childDidFinish = { [weak self] in
            self?.childDidFinish()
        }

        viewController.didSendEventClosure = { [weak self] event in
            self?.showSecondPage()
        }
        navigationController.pushViewController(viewController, animated: false)

        parentCoordinator?.navigationController.present(navigationController, animated: true, completion: nil)
        self.rootViewController = viewController
    }

    private func showSecondPage() {
        let viewController = Present2ViewController.instantiate()
        viewController.childDidFinish = { [weak self] in
            self?.childDidFinish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
