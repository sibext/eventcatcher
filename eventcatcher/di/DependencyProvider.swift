//
//  DependencyProvider.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import Foundation

struct DependencyProvider {
    // MARK: -  View Models
    private static func hubListViewModel() -> HubListViewModel {
        return HubListViewModel()
    }
    private static func eventsListViewModel(hub: HubModel) -> EventsListViewModel {
        return EventsListViewModel(hub: hub)
    }
    
    // MARK: -  View Controllers
    static func hubListViewController(
        navigateToEventScreen: @escaping (HubModel) -> Void
    ) -> HubListViewController {
        return HubListViewController(
            viewModel: self.hubListViewModel(),
            navigation: navigateToEventScreen
        )
    }
    static func eventsListViewController(hub: HubModel) -> EventsListViewController {
        return EventsListViewController(viewModel: self.eventsListViewModel(hub: hub))
    }

    // MARK: -  Storages
    
}
