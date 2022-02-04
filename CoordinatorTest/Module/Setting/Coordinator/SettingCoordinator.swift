//
//  SettingCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/4/22.
//

import Foundation

class SettingCoordinator: BaseCoordinator {
    override func start() {
        let viewController = SettingViewController.instantiate()

        self.navigationController.pushViewController(viewController, animated: false)
        rootViewController = viewController
    }
}
