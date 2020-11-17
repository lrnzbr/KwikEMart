//
//  LoginViewController.swift
//  GreyDemoApp
//
//  Created by Lorenzo Brown on 11/16/20.
//

import UIKit

class LoginViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
  
    @IBOutlet weak var cashierCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cashierCollectionView.delegate = self
        cashierCollectionView.dataSource = self
        cashierCollectionView.register(UINib.init(nibName: "\(CashierCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "cashierCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cashiers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cashier = cashiers[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cashierCell", for: indexPath) as! CashierCollectionViewCell
        cell.cashierName.text = cashier.name
        cell.cashierImage.image = cashier.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cashier = cashiers[indexPath.row]
        let vc = CashierLoginViewController()
        vc.cashier = cashier
        vc.parentView = self
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    func successfulLogin(cashier:Cashier){
        let vc = CatalogViewController()
        vc.cashier = cashier
        navigationController?.pushViewController(vc, animated: true)
    }
}
