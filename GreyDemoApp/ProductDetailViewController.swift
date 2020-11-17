//
//  ProductDetailViewController.swift
//  GreyDemoApp
//
//  Created by Lorenzo Brown on 11/16/20.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var product:CatalogItem!
    var parentView:CatalogViewController!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = product.productImage
        productNameLabel.text = product.productName
        productPriceLabel.text = String(format: "$%.02f",product.productPrice)
        
    }

    @IBAction func decrementAction(_ sender: Any) {
        guard let qty = Int(quantityTextField.text!) else {
            quantityTextField.text = "1"
            return
        }
        if qty > 0 {
            
            quantityTextField.text = "\(qty-1)"
        }
    }
    @IBAction func addToCartAction(_ sender: Any) {
        guard let qty = Int(quantityTextField.text!) else {
          return
        }
        self.dismiss(animated: true, completion: { [self] in self.parentView.addToCart(item: product, quantity: qty)})
        
    }
    @IBAction func incrementAction(_ sender: Any) {
        guard let qty = Int(quantityTextField.text!) else {
            quantityTextField.text = "1"
            return
        }
        if qty > 0 {
            quantityTextField.text = "\(qty+1)"
        }
    }
}
