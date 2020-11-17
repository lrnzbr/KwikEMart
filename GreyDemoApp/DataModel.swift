//
//  DataModel.swift
//  GreyDemoApp
//
//  Created by Lorenzo Brown on 11/16/20.
//

import Foundation
import UIKit

struct Cashier {
    var name:String!
    var image:UIImage?
    var password:String!
    
}

let apu = Cashier(name: "Apu Nahasapeemapetilon", image: UIImage(named: "Apu"), password: "1234")

let bart = Cashier(name: "Bart Simpson", image: UIImage(named: "Bart"), password: "1234")

let marge = Cashier(name: "Marge Simpson", image: UIImage(named: "Marge"), password: "1234")

let homer = Cashier(name: "Homer Simpson", image: UIImage(named: "Homer"), password: "1234")

let maggie = Cashier(name: "Maggie Simpson", image: UIImage(named: "Maggie"), password: "1234")

let krusty = Cashier(name: "Krusty the Clown", image: UIImage(named: "Krusty"), password: "1234")

let  barney = Cashier(name: "Barney Gumble", image: UIImage(named: "Barney"), password: "1234")

var cashiers = [apu, bart, marge, homer, maggie, krusty, barney]

struct CatalogItem {
    var productName:String!
    var productImage:UIImage!
    var productPrice: Float!
    var description:String?
    var id:String!
}
let buzzCola = CatalogItem(productName: "Buzz Cola", productImage: UIImage(named: "BuzzCola"), productPrice: 1.29, id:"1")
let crabjuice = CatalogItem(productName: "Crab Juice", productImage: UIImage(named: "Crabjuice"), productPrice: 2.35, id:"2")
let donut = CatalogItem(productName: "Sprinke Donut", productImage: UIImage(named: "Donut"), productPrice: 0.59, id:"3")
let duff = CatalogItem(productName: "Duff Beer", productImage: UIImage(named: "Duff"), productPrice: 2.50, id:"12")
let flamingmoe = CatalogItem(productName: "Flaming Moe", productImage: UIImage(named: "Flaming Moe"), productPrice: 9.50, id:"4")
let fudd = CatalogItem(productName: "Fudd Beer", productImage: UIImage(named: "FuddBeer"), productPrice: 5.19, id:"5")
let fugu = CatalogItem(productName: "Fugu Puffer Fish", productImage: UIImage(named: "FuguFish"), productPrice: 15.99, id:"6")
let krustyburger = CatalogItem(productName: "Krusty Burger", productImage: UIImage(named: "KrustyBurger"), productPrice: 6.29, id:"7")
let cereal = CatalogItem(productName: "Krusty Ceral", productImage: UIImage(named: "BuzzCola"), productPrice: 1.29, id:"8")
let malk = CatalogItem(productName: "Malk", productImage: UIImage(named: "Malk"), productPrice: 1.05, id:"9")
let slushy = CatalogItem(productName: "Slushy", productImage: UIImage(named: "Slushy"), productPrice: 2.49, id:"10")
let tomacco = CatalogItem(productName: "Tomacco", productImage: UIImage(named: "Tomacco"), productPrice: 3.15, id:"11")

var menuItems = [buzzCola, crabjuice, donut, duff, flamingmoe, fudd, fugu, krustyburger, cereal, malk, slushy,tomacco]



struct ShoppingCartItem {
    var product:CatalogItem
    var quantity: Int
    var subtotal: Float
}

class ShoppingCart {
    static let sharedInstance = ShoppingCart()
    private var basket:[String:Int]!
    private init(){
        basket = [String:Int]()
    }
    func removeItemFromCart(barcode:String){
        basket[barcode] = nil
    }
    
    func getItem(_ barcode:String)->CatalogItem?{
    
        for item in menuItems {
            if item.id == barcode {
                return item
            }
        }
        print("Item not found for code")
        return nil
    }
    
    func addItemToCart(barcode:String, quantity:Int){
        let item = getItem(barcode)
        if item != nil {
            if basket[barcode] != nil {
                basket[barcode] = basket[barcode]! + quantity
            } else {
                basket[barcode] = quantity
            }
        }
    }
        
        func getShoppingBasketItems()->[String:Int] {
            return basket
        }
    
        func calculateSubtotal()->Float{
            var subtotal = Float(0.00)
            for item in basket.keys {
                subtotal = subtotal + Float((getItem(item)?.productPrice)!) * Float(basket[item]!)
            }
            return subtotal
        }
    
    func calculateTaxes(subtotal:Double, taxRate:Double)->Double {
        return subtotal * taxRate
    }
    
}
