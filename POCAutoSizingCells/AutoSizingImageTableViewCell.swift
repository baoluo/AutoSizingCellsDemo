//
//  AutoSizingImageTableViewCell.swift
//  POCAutoSizingCells
//
//  Created by Paul Lemaire on 01/07/2016.
//  Copyright © 2016 Paul Lemaire. All rights reserved.
//

import UIKit

class AutoSizingImageTableViewCell: UITableViewCell {

    @IBOutlet weak var unknownHeightImageView: UIImageView!
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                unknownHeightImageView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                unknownHeightImageView.addConstraint(aspectConstraint!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        aspectConstraint = nil
        unknownHeightImageView.image = nil
    }
    
    func performPostOperationOnImage(image : UIImage?) {
        
        guard let fetchedImage = image else { return }
        
        let aspect = fetchedImage.size.width / fetchedImage.size.height
        
        aspectConstraint = NSLayoutConstraint(item: unknownHeightImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: unknownHeightImageView, attribute: NSLayoutAttribute.Height, multiplier: aspect, constant: 0.0)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
