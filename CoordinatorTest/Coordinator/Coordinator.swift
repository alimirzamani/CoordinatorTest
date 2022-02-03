//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/3/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: MainCoordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var rootViewController: BaseViewController! { get set }

    func start()
}

extension Coordinator {
    func childDidFinish() {
        if let coords = parentCoordinator?.childCoordinators.enumerated() {
            for (index, coordinator) in coords where coordinator === self {
                parentCoordinator?.childCoordinators.remove(at: index)
                break
            }
        }
    }
}
