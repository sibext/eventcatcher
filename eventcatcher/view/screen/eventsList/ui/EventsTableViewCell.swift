//
//  EventsTableViewCell.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    static let identifier: String = "EventsTableViewCell"
    static func nib() -> UINib {
        return UINib(
            nibName: identifier,
            bundle: nil
        )
    }

    @IBOutlet
    var dataLabel: UILabel!
    @IBOutlet
    var timestampLabel: UILabel!

    func configure(event: EventModel) {
        dataLabel.text = event.data
        timestampLabel.text = event.timestamp
    }
}
