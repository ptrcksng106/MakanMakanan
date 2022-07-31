//
//  ViewController.swift
//  MakanMakanan
//
//  Created by Patrick Sinaga on 29/07/22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var foodTableView: UITableView!
    

    let parser = NetworkHelper()
    var foodItem = [DataFood]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCell")
        
        loadData()
        
    
    
    func loadData(){
        parser.parse { data in
            self.foodItem = data
            self.foodTableView.reloadData()
        }
    }
    }
    
    @IBAction func goToProfile(_ sender: Any) {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            foodItem.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as? FoodTableViewCell {
                cell.foodTitle.text = foodItem[indexPath.row].strCategory
                cell.foodDescription.text = foodItem[indexPath.row].strCategoryDescription
                cell.foodImageView.load(url: foodItem[indexPath.row].strCategoryThumb)
                
                
                return cell
                
            }
            else {
                return UITableViewCell()
            }
        }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
            }
        }
    }
}
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "moveToDetail", sender: foodItem[indexPath.row])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToDetail") {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.foodItem = sender as? DataFood
            }
        }
    }
}
