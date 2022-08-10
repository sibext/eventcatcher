//
//  ViewController.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import UIKit

class HubListViewController: UIViewController {

    @IBOutlet
    var tableView: UITableView!

    private let viewModel: HubListViewModel
    private let navigateToEventsList: (HubModel) -> Void

    init(viewModel: HubListViewModel, navigation: @escaping (HubModel) -> Void) {
        self.viewModel = viewModel
        self.navigateToEventsList = navigation
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select hub"
        
        tableView.register(HubTableViewCell.nib(), forCellReuseIdentifier: HubTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        viewModel.loadHubs()
    }
}

extension HubListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hub = viewModel.list[indexPath.row]
        print("Select hub: \(hub)")
        navigateToEventsList(hub)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HubListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HubTableViewCell.identifier, for: indexPath) as! HubTableViewCell
        cell.configure(model: viewModel.list[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
