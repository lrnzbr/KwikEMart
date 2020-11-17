//
//  CatalogViewController.swift
//  GreyDemoApp
//
//  Created by Lorenzo Brown on 11/16/20.
//

import UIKit

class CatalogViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var cashierNameLabel: UILabel!
    var cashier:Cashier!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.register(UINib.init(nibName: "\(ItemsTableViewCell.self)", bundle:nil), forCellReuseIdentifier: "itemsCell")
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        menuCollectionView.register(UINib.init(nibName: "\(CatalogItemCollectionViewCell.self)", bundle:nil), forCellWithReuseIdentifier: "catalogCell")
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemsTableView.reloadData()
        menuCollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  menuItems.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = menuItems[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catalogCell", for: indexPath) as! CatalogItemCollectionViewCell
        cell.productImage.image = product.productImage
        cell.productNameLabel.text = product.productName
        cell.priceLabel.text = "$\(product.productPrice!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingCart.sharedInstance.getShoppingBasketItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lineItem = ShoppingCart.sharedInstance.getShoppingBasketItems().keys.sorted()[indexPath.row]
        let product = ShoppingCart.sharedInstance.getItem(lineItem)
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell",
                                                 for: indexPath) as! ItemsTableViewCell
        cell.productNameLabel.text = product?.productName
        cell.quantityLabel.text = String(ShoppingCart.sharedInstance.getShoppingBasketItems()[lineItem]!)
        cell.subtotalLabel.text = String(format: "$%.02f", product?.productPrice! as! CVarArg)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let lineItem = menuItems[indexPath.row]
        let vc = ProductDetailViewController()
        vc.parentView = self
        vc.product = lineItem
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func addToCart(item:CatalogItem, quantity:Int){
        ShoppingCart.sharedInstance.addItemToCart(barcode: item.id, quantity: quantity)
        itemsTableView.reloadData()
    }



}
