//
//  CatalogItemCollectionViewCell.swift
//  GreyDemoApp
//
//  Created by Lorenzo Brown on 11/16/20.
//

import UIKit

class CatalogItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
