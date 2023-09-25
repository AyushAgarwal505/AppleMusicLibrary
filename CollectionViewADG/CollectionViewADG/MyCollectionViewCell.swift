//
//  MyCollectionViewCell.swift
//  CollectionViewADG
//
//  Created by Ayush Agarwal on 04/09/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var Artist: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure (with image: UIImage) {
        imageView.image = image
    }
    
    static func nib()->UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
