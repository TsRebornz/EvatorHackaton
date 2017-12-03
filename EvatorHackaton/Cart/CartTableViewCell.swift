//  GoodsTableViewCell.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.

import UIKit

final class CartTableViewCell: UITableViewCell,DataForCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var priceButton: UILabel!
    
    private var itemId: Int!
    private var itemCount: Int = 0
    private var cartModel: CartModel!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    weak var delegate: GoodTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.addVisuals()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellModel(model:AnyObject) {
        let model = model as! CartModel
        self.cartModel = model
        self.itemId = model.id
        self.itemCountLabel.text = "\(model.itemCount)"
        self.itemCount = model.itemCount
        self.itemImageView.image = UIImage(named: model.imageName)
        self.goodName.text = model.itemName
        self.priceButton.text = "\(model.price)\(Constants.rubleChar)/шт."
    }
    
    //MARK: Visual
    func addVisuals() {
        let plusButtonLayer = plusButton.layer
        self.setButtonLayerVisuals(buttonLayer: plusButtonLayer)
        let minusButtonLayer =
        minusButton.layer
        self.setButtonLayerVisuals(buttonLayer: minusButtonLayer)
    }
    
    func setButtonLayerVisuals(buttonLayer: CALayer) {
        buttonLayer.borderColor = plusButton.tintColor.cgColor
        buttonLayer.borderWidth = 0.5
        buttonLayer.cornerRadius = 10
    }
    
    //MARK:
    
    //MARK: Actions
    @IBAction func minusButtonTapped(_ sender: Any) {
        if self.itemCount > 0 {
            self.itemCount -= 1
            
            if self.itemCount == 0 {
                appDelegate.removeCart(byId: self.itemId)
            } else {
                updateCartModel(by: self.itemCount)
            }
            self.delegate?.priceChanged()
            self.itemCountLabel.text = "\(self.itemCount)"
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        self.itemCount += 1
        if self.itemCount == 1 {
            createAndSaveCartModel()
        } else {
            updateCartModel(by: self.itemCount)
        }
        self.itemCountLabel.text = "\(self.itemCount)"
        self.delegate?.priceChanged()
    }
    
    //MARK: Cart Data
    func createAndSaveCartModel() {
        let model = self.cartModel
        let cartModel = CartModel(id: itemId, imageName: (model?.imageName)! , itemName: (model?.itemName)!, price: (model?.price)!, itemCount: self.itemCount)
        appDelegate.addModelToCartModel(model: cartModel)
    }
    
    func updateCartModel(by itemCount: Int ) {
        appDelegate.updateCartModel(by: self.itemId, and: itemCount)
    }
    
    //MARK:
}
