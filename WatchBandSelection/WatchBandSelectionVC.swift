//
//  WatchBandSelectionVC.swift
//  WatchBandSelection
//
//  Created by O'ral Nabiyev on 03/03/24.
//

import UIKit

class WatchBandSelectionVC: UIViewController {
    
    @IBOutlet weak var collectionViewBands: UICollectionView! {
        didSet {
            collectionViewBands.delegate = self
            collectionViewBands.dataSource = self
            collectionViewBands.register(WatchCVC.nib(), forCellWithReuseIdentifier: WatchCVC.identifier)
        }
    }
    
    @IBOutlet weak var collectionViewScreen: UICollectionView! {
        didSet {
            collectionViewScreen.delegate = self
            collectionViewScreen.dataSource = self
            collectionViewScreen.register(WatchCVC.nib(), forCellWithReuseIdentifier: WatchCVC.identifier)
        }
    }
    
    @IBOutlet weak var likeImg: UIImageView!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var aboutBtn: UIButton!
    
    @IBOutlet weak var watchDescLbl: UILabel!
    
    var screensArr: [WatchDM] = [
        WatchDM(id: 0, name: "screen"),
        WatchDM(id: 1, name: "screen-1"),
        WatchDM(id: 2, name: "screen-2"),
        WatchDM(id: 3, name: "screen-3"),
        WatchDM(id: 4, name: "screen-4"),
        WatchDM(id: 5, name: "screen-5"),
        WatchDM(id: 6, name: "screen-6"),
    ]
    
    var bandsArr: [WatchDM] = [
        WatchDM(id: 0, name: "watch-6"),
        WatchDM(id: 1, name: "watch-5"),
        WatchDM(id: 2, name: "watch-4"),
        WatchDM(id: 3, name: "watch"),
        WatchDM(id: 4, name: "watch-1"),
        WatchDM(id: 5, name: "watch-2"),
        WatchDM(id: 6, name: "watch-3"),
    ]
    
    var currentIndex = 0
    
    var countFurn: Int = 1
    var priceFurn: Int = 350
    var isLiked: Bool = false
    var aboutDesc: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        let attributedTitle = NSAttributedString(string: "Подробное", attributes: attributes)
        aboutBtn.setAttributedTitle(attributedTitle, for: .normal)
        
    }
    
    @IBAction func screenColorTapped(_ sender: UIButton) {
        
        var nextIndex = 0
        
        nextIndex = (sender.tag) % screensArr.count
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionViewScreen.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        currentIndex = nextIndex
        
    }
    
    
    @IBAction func bandColorTapped(_ sender: UIButton) {
        
        var nextIndex = 0
        
        nextIndex = (sender.tag) % bandsArr.count
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionViewBands.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        currentIndex = nextIndex
        
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        if isLiked {
            likeImg.tintColor = .white
            likeImg.image = UIImage(systemName: "heart")
            self.likeImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
                self.likeImg.transform = .identity
            }
            isLiked = false
        } else {
            likeImg.tintColor = .red
            likeImg.image = UIImage(systemName: "heart.fill")
            self.likeImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
                self.likeImg.transform = .identity
            }
            isLiked = true
        }
    }
    
    @IBAction func aboutTapped(_ sender: Any) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        if aboutDesc {
            watchDescLbl.numberOfLines = 2
            let attributedTitle = NSAttributedString(string: "Подробное", attributes: attributes)
            aboutBtn.setAttributedTitle(attributedTitle, for: .normal)
            aboutDesc = false
        } else {
            watchDescLbl.numberOfLines = 0
            let attributedTitle = NSAttributedString(string: "Закрыть", attributes: attributes)
            aboutBtn.setAttributedTitle(attributedTitle, for: .normal)
            aboutDesc = true
        }
        
    }
    
    @IBAction func plusMinusTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            if countFurn > 0 {
                countFurn -= 1
                countLbl.text = "\(countFurn)".numberFormatter()
                priceLbl.text = "\(priceFurn*countFurn)".numberFormatter() + " $"
            }
        case 1:
            countFurn += 1
            countLbl.text = "\(countFurn)".numberFormatter()
            priceLbl.text = "\(priceFurn*countFurn)".numberFormatter() + " $"
        default:
            countFurn -= 1
            countLbl.text = "\(countFurn)".numberFormatter()
            priceLbl.text = "\(priceFurn*countFurn)".numberFormatter() + " $"
        }
        
    }
    

}

//MARK: - UICollectionViewDelegate
extension WatchBandSelectionVC: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension WatchBandSelectionVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bandsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchCVC.identifier, for: indexPath) as? WatchCVC else { return UICollectionViewCell() }
        
        if collectionView == collectionViewBands {
            cell.updateCell(watch: bandsArr[indexPath.row])
            return cell
        } else {
            cell.updateCell(watch: screensArr[indexPath.row])
            return cell
        }
        
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension WatchBandSelectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
