//
//  AppDelegate.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import UIKit


// TASK 1: Select only hubs with english firmware (AU and US) and show them in table view. Look at HubListViewModel.swift
// TASK 2: Show events list from CoreData in EventsListViewController.swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DataMock.setupHubs()
        DataMock.setupEvents()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

private struct DataMock {

    // Possible firmware languages: AU, US, FR, RU
    // You can not change this method!
    static func setupHubs() {
        Task {
            let storage = Storage.getInstance()
            let hub123AU = Hub.init(context: storage.mainContext)
            hub123AU.serial = "AU123"

            let hub234US = Hub.init(context: storage.mainContext)
            hub234US.serial = "US234"

            let hub345RU = Hub.init(context: storage.mainContext)
            hub345RU.serial = "RU345"

            let hub456AU = Hub.init(context: storage.mainContext)
            hub456AU.serial = "AU456"

            let hub567RU = Hub.init(context: storage.mainContext)
            hub567RU.serial = "RU567"

            let hub678FR = Hub.init(context: storage.mainContext)
            hub678FR.serial = "FR678"

            let hub789FR = Hub.init(context: storage.mainContext)
            hub789FR.serial = "FR789"

            storage.saveContext(context: storage.mainContext)
        }
    }

    static func setupEvents() {
        Task {
            let storage = Storage.getInstance()
            let request = Hub.fetchRequest()
            while(true) {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                let hubs = try storage.eventsContext.fetch(request)
                hubs.choose(4).forEach { hub in
                    let event = Event.init(context: storage.eventsContext)
                    event.hub = hub
                    event.rawData = randomString(length: 8)
                    event.timestamp = Date()
                }
                storage.saveContext(context: storage.eventsContext)
            }
        }
    }
}

fileprivate extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}

fileprivate func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

