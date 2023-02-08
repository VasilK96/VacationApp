//
//  TableViewCell.swift
//  TestApp
//
//  Created by Vasil Karashev on 8.02.23.
//

import UIKit

class VacationsTableViewCell: UITableViewCell {

    @IBOutlet weak var vacationName: UILabel!
    @IBOutlet weak var location: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
