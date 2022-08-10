//
//  HubTableViewCell.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 09.08.2022.
//

import UIKit

class HubTableViewCell: UITableViewCell {

    static let identifier: String = "HubTableViewCell"
    static func nib() -> UINib {
        return UINib(
            nibName: identifier,
            bundle: nil
        )
    }

    @IBOutlet
    var serialLabel: UILabel!
    @IBOutlet
    var fwCountryLabel: UILabel!


    func configure(model: HubModel) {
        serialLabel.text = model.serial
        fwCountryLabel.text = model.hasEnglishFirmware ? "English" : "Non English"
    }
}
