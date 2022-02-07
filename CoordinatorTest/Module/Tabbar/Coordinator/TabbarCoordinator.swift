//
//  TabbarCoordinator.swift
//  CoordinatorTest
//
//  Created by Ali Mirzamani on 2/4/22.
//

import UIKit

enum TabbarItem {
    case home
    case setting

    init?(index: Int) {
        switch index {
        case 0:
            self = .home

        case 1:
            self = .setting

        default:
            return nil
        }
    }

    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"

        case .setting:
            return "Setting"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0

        case .setting:
            return 1
        }
    }

    // Add tab icon value
    func pageIcon() -> UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home_select")

        case .setting:
            return UIImage(named: "home_select")
        }
    }
}

class TabbarCoordinator: BaseCoordinator {
    var tabBarController = TabbarController()

    override func start() {
        let pages: [TabbarItem] = [.home, .setting]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })

        let controllers: [BaseNavigationController] = pages.map { item in
            self.createTabbarItems(for: item)
        }

        tabBarController.setViewControllers(controllers, animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [tabBarController]
    }

    func createTabbarItems(for page: TabbarItem) -> BaseNavigationController {
        let navController = BaseNavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageIcon(),
                                                     tag: page.pageOrderNumber())

        switch page {
        case .home:
            let childCoordinator = HomeCoordinator(navigationController: navController)
            childCoordinator.parentCoordinator = self
            childCoordinators.append(childCoordinator)
            childCoordinator.start()

        case .setting:
            let childCoordinator = SettingCoordinator(navigationController: navController)
            childCoordinator.parentCoordinator = self
            childCoordinators.append(childCoordinator)
            childCoordinator.start()

        }

        return navController
    }
}
