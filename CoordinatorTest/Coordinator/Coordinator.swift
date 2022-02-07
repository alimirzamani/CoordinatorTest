//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: BaseCoordinator? { get set }
    var childCoordinators: [BaseCoordinator] { get set }
    var navigationController: UINavigationController { get set }
    var rootViewController: BaseViewController! { get set }

    func start()
}

extension Coordinator {
    func resetDelegate() {
        if let coordinator = self as? UINavigationControllerDelegate {
            navigationController.delegate = coordinator
        }
    }

    func childDidFinish() {
        if let coords = parentCoordinator?.childCoordinators.enumerated() {
            for (index, coordinator) in coords where coordinator === self {
                parentCoordinator?.childCoordinators.remove(at: index)
                break
            }
        }
    }

    func cleanUP() {
        childCoordinators.forEach { $0.cleanUP() }

        navigationController.viewControllers.removeAll()
        childCoordinators.removeAll()
    }
}
