//
//  ViewController.swift
//  POCAutoSizingCells
//
//  Created by Paul Lemaire on 01/07/2016.
//  Copyright © 2016 Paul Lemaire. All rights reserved.
//

import UIKit
import Kingfisher

class AutoSizingTableViewController: UITableViewController {
    
    let dataSource = ["https://dyxab4fa9t3l3.cloudfront.net/thumbnails/cdns/listing-detail/media/images/u/5508/23f07e4f-6d59-45ea-a733-b34be5f9ac75/louis-vuitton-monogram-canvas-papillon-mini-pochette-bag-1.jpg",
                      "http://luxurylaunches.com/wp-content/uploads/2015/04/louis-vuitton-bags.jpg",
                      "https://img1.wsimg.com/fos/sales/cwh/8/images/cats-with-hats-shop-02.jpg",
                      "https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/30423_pets-products_january-site-flip_3-cathealth_short-tile_592x304._CB286975940_.jpg",
                      "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg",
                      "http://r.ddmcdn.com/s_f/o_1/cx_462/cy_245/cw_1349/ch_1349/w_720/APL/uploads/2015/06/caturday-shutterstock_149320799.jpg",
                      "https://pbs.twimg.com/profile_images/378800000532546226/dbe5f0727b69487016ffd67a6689e75a.jpeg",
                      "https://i.ytimg.com/vi/9C1leq--_wM/maxresdefault.jpg"
    ]
    
    private enum SizingCellIdentifier: String {
        case Text, Image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
    }
    
    /// Used to fix a known glitch on first load
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private typealias TableViewDataSource = AutoSizingTableViewController
extension TableViewDataSource {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}

private typealias TableViewDelegates = AutoSizingTableViewController
extension TableViewDelegates {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var returnedCell = UITableViewCell()
        
        
        // MARK: Uncomment to test self sizing text cell
        
        /*
         if let cell = tableView.dequeueReusableCellWithIdentifier(SizingCellIdentifier.Text.rawValue, forIndexPath: indexPath) as? AutoSizingTextTableViewCell {
         cell.firstTextLabel.text = indexPath.row%2 == 1 ? "qdbfjhqsdgfkqhsgdfkqsgdfkjqhsdgfjq;shdgf" : "qfdbvljqhbdflhjqbsdlfjhbqslhdjfbqlshdbflqhsbdflhqbsdfjhqbsdjhfbqlshjdbfljqhsdbfjhlqsbdfljhqbsdljhfbqlshjdbfqljhsdbfjlhqsbdfjhqbsdfljhqbsdljhfbqjhsdbflhjqsbdfljhqbsdjlhfbqsjhldfbqlhjsdbfjlhqsbdfljhqsbdfjlhbqsldjhfbqjslhdfbqhsdbfjhlqsbdflhjbqsd"
         cell.secondTextLabel.text = indexPath.row%2 == 1 ? "qfdbvljqhbdflhjqbsdlfjhbqslhdjfbqlshdbflqhsbdflhqbsdfjhqbsdjhfbqlshjdbfljqhsdbfjhlqsbdfljhqbsdljhfbqlshjdbfqljhsdbfjlhqsbdfjhqbsdfljhqbsdljhfbqjhsdbflhjqsbdfljhqbsdjlhfbqsjhldfbqlhjsdbfjlhqsbdfljhqsbdfjlhbqsldjhfbqjslhdfbqhsdbfjhlqsbdflhjbqsd" : "qdbfjhqsdgfkqhsgdfkqsgdfkjqhsdgfjq;shdgf"
         returnedCell = cell
         }
         */
        
        
        // MARK: Uncomment to test self sizing image cell
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(SizingCellIdentifier.Image.rawValue, forIndexPath: indexPath) as? AutoSizingImageTableViewCell {
            
            cell.unknownHeightImageView.kf_setImageWithURL(NSURL(string: dataSource[indexPath.row])!, placeholderImage: UIImage(named: "image2"), optionsInfo: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, imageURL) in
                cell.performPostOperationOnImage(image)
            })

            returnedCell = cell
        }
        
        return returnedCell
    }
}