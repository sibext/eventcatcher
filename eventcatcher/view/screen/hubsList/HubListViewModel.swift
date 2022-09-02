//
//  HubListViewModel.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import Foundation

// TASK 1: Select only hubs with english firmware (AU and US)
// Show data in table view
class HubListViewModel {
    let list = [
        // SAMPLE. TODO remove it and show real data
        HubModel(serial: "AU123", hasEnglishFirmware: true),
        HubModel(serial: "RU234", hasEnglishFirmware: false),
        HubModel(serial: "FR345", hasEnglishFirmware: false),
        HubModel(serial: "US456", hasEnglishFirmware: true),
    ]

    func loadHubs() {
//        let storage = Storage.getInstance()
//        let request = Hub.fetchRequest()
//        guard let hubs = try? storage.mainContext.fetch(request) else {
//            return
//        }
//        print(hubs)
    }
}
