//
//  TableViewCell.swift
//  test_tech
//
//  Created by naltise on 11/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var dsecTextView: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
