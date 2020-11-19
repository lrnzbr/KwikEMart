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
        cashierCollectionView.collectionViewLayout = layout()
        cashierCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        cashierCollectionView.delegate = self
        cashierCollectionView.dataSource = self
        cashierCollectionView.register(UINib.init(nibName: "\(CashierCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "cashierCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cashiers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cashier = cashiers[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cashierCell", for: indexPath) as! CashierCollectionViewCell
        cell.cashierName.text = cashier.name
        cell.cashierImage.image = cashier.image
        
        // Configure the cell
                cell.layer.cornerRadius = 15.0
                cell.layer.borderWidth = 0.0
                cell.layer.shadowColor = UIColor.black.cgColor
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 5.0
                cell.layer.shadowOpacity = 1
                cell.layer.masksToBounds = false //<-
                
        
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
    
    func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(350),
            heightDimension: .absolute(350))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize, subitem: item, count: 1) // *
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: nil, top: .flexible(0),
            trailing: nil, bottom: .flexible(0))
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 65
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(
            section: section, configuration:config)
        return layout
    }
}
