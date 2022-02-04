//
//  CreateAccountCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

class CreateAccountCoordinator: BaseCoordinator {
    override func start() {
        let viewController = CreateAccountViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
        rootViewController = viewController
    }
}
