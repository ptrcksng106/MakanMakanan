//
//  DetailViewController.swift
//  MakanMakanan
//
//  Created by Patrick Sinaga on 31/07/22.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet var foodDescription: UILabel!
    @IBOutlet var foodCategory: UILabel!
    @IBOutlet var foodImage: UIImageView!
    
    var foodItem: DataFood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        if let result = foodItem {
            foodDescription.text = result.strCategoryDescription
            foodCategory.text = result.strCategory
            foodImage.load(url: result.strCategoryThumb)
        }
        
    }
    

}
