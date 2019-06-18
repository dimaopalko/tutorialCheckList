//
//  ChecklistTableViewCell.swift
//  CheckList
//
//  Created by Dima Opalko on 6/15/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTextLabel: UILabel!
    @IBOutlet weak var checkmarkLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
