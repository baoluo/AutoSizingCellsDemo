//
//  AutoSizingTableViewCell.swift
//  POCAutoSizingCells
//
//  Created by Paul Lemaire on 01/07/2016.
//  Copyright © 2016 Paul Lemaire. All rights reserved.
//

import UIKit

class AutoSizingTextTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTextLabel: UILabel!
    @IBOutlet weak var secondTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        firstTextLabel.text = nil
        secondTextLabel.text = nil
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
