//
//  EventsListViewModel.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import Foundation

// TASK 2: Show actual events list from CoreData in EventsListViewController.swift
class EventsListViewModel {

    private let hub: HubModel
    var serial: String {
        return hub.serial
    }
    // TODO remove sample data
    var events: [EventModel] = [
        EventModel(data: "51441098", timestamp: "2022-08-09 13:20:00"),
        EventModel(data: "42342352", timestamp: "2022-08-09 13:23:28"),
        EventModel(data: "72344256", timestamp: "2022-08-09 13:30:32"),
        EventModel(data: "63246333", timestamp: "2022-08-09 13:42:21"),
        EventModel(data: "66443536", timestamp: "2022-08-09 13:51:10"),
    ]

    init(hub: HubModel) {
        self.hub = hub
    }
}
