//
//  Coordinator.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get }
    
    func startFlow()
}

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    let navigationController: UINavigationController = BaseUINavigationController()

    func startFlow() {
        let controller = DependencyProvider.hubListViewController(navigateToEventScreen: navigateToEvents)
        navigationController.pushViewController(controller, animated: false)
    }

    private func navigateToEvents(hub: HubModel) {
        let controller = DependencyProvider.eventsListViewController(hub: hub)
        navigationController.pushViewController(controller, animated: true)
    }
}
