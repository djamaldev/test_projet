//
//  PLPCollectionViewCell.swift
//  test_tech
//
//  Created by naltise on 11/10/22.
//

import UIKit

class PLPCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var decTextView: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    //var product: Product?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func Update(Prod: Product){
        self.ImageView.image = UIImage(named: Prod.images_url?.small ?? "")
        self.titleLbl.text = Prod.product_name
        self.priceLbl.text = String(Prod.price ?? 0)
        self.decTextView.text = Prod.description
     }

}
