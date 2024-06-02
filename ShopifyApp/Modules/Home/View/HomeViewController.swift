//
//  HomeViewController.swift
//  ShopifyApp
//
//  Created by Israa Assem on 30/05/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var brandsCollectionView: UICollectionView!
    @IBOutlet weak var adsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        brandsCollectionView.delegate=self
        brandsCollectionView.dataSource=self
        adsImage.clipsToBounds=true
        adsImage.layer.cornerRadius=15
        brandsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    


}
extension HomeViewController:UICollectionViewDelegate{
    
}
extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCell", for: indexPath) as! BrandsCollectionViewCell
        cell.brandName.text="Adidas"
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth=1
        cell.layer.cornerRadius=20
        return cell
    }
    
    
}
extension HomeViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width=self.view.frame.width*0.43
        let height=width

         return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
   

}

class CustomTabBar: UITabBar {
    private var shapeLayer: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.masksToBounds = false

        if shapeLayer == nil {
            let newShapeLayer = CAShapeLayer()
            newShapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 40).cgPath
            newShapeLayer.fillColor = UIColor.white.cgColor

            newShapeLayer.shadowColor = layer.shadowColor
            newShapeLayer.shadowOpacity = layer.shadowOpacity
            newShapeLayer.shadowOffset = layer.shadowOffset
            newShapeLayer.shadowRadius = layer.shadowRadius
            layer.insertSublayer(newShapeLayer, at: 0)
            shapeLayer = newShapeLayer
        } else {
            shapeLayer?.path = UIBezierPath(roundedRect: bounds, cornerRadius: 40).cgPath
            shapeLayer?.frame = bounds
        }
    }
}
