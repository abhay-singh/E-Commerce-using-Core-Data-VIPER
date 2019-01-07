//
//  CategoryCell.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 08/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet var lbCategoryName: UILabel!
    @IBOutlet var lbProductCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set(forCategoryInfo category: Categories) {
        self.selectionStyle = .none
        lbCategoryName?.text = category.name
        lbProductCount?.text  = "Related Products available : \(category.relatedProduct?.count ?? 0)"
    }
}
