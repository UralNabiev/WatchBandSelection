//
//  WatchCVC.swift
//  WatchBandSelection
//
//  Created by O'ral Nabiyev on 07/03/24.
//

import UIKit

class WatchCVC: UICollectionViewCell {
    
    static func nib() -> UINib {
        UINib(nibName: "WatchCVC", bundle: nil)
    }
    
    static let identifier: String = "WatchCVC"
    
    @IBOutlet weak var productImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(watch: WatchDM) {
        productImg.image = UIImage(named: watch.name)
    }

}
