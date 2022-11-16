//
//  HomePage.swift
//  test_tech
//
//  Created by naltise on 11/11/22.
//

import UIKit
import Foundation



class HomePage: UIViewController{
    
    var titleProduct: [String] = []
    var price: [Int] = []
    var desc: [String] = []
    var imageUrl: [String] = []
    var isSpecial: [Bool] = [false]
    var product: [Product] = []
    private var dataTask: URLSessionDataTask?
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PLPCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "Cell")
        self.getSpecialData(session: session)
        self.getData(session: session)
    }
    
    func getData(session: URLSession) {
        if let url = URL(string: "https://sephoraios.github.io/items.json") {
            let dataTask = session.dataTask(with: url) { [self] data, response, error in
              if let data = data {
                  do {
                    let res = try JSONDecoder().decode([Product].self, from: data)
                    
                    for item in res{
                        self.titleProduct.append(item.product_name ?? "")
                        self.price.append(item.price ?? 0)
                        self.desc.append(item.description ?? "")
                        self.isSpecial.append(item.is_special_brand ?? false)
                        self.imageUrl.append(item.images_url?.small ?? "")
                        print(self.imageUrl)
                    }
                    product = res
                  } catch let error {
                     print(error)
                  }
               }
           }
            dataTask.resume()
            self.dataTask = dataTask
        }
        
    }
    
    func getSpecialData(session: URLSession) {
        if let url = URL(string: "https://sephoraios.github.io/items.json") {
            let dataTask = session.dataTask(with: url) { [self] data, response, error in
              if let data = data {
                  do {
                    let res = try JSONDecoder().decode([Product].self, from: data)
                    
                    for item in res{
                        if (item.is_special_brand == true){
                            self.titleProduct.append(item.product_name ?? "")
                            self.price.append(item.price ?? 0)
                            self.desc.append(item.description ?? "")
                            self.imageUrl.append(item.images_url?.small ?? "")
                        }
                    }
                    product = res
                  } catch let error {
                     print(error)
                  }
               }
           }
            dataTask.resume()
            self.dataTask = dataTask
        }
        
    }
    
    
    
}
extension HomePage: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PLPCollectionViewCell
        cell.priceLbl.text = "\(String(((self.price[indexPath.item]))))$"
        cell.titleLbl.text = self.titleProduct[indexPath.item]
        cell.decTextView.text = self.desc[indexPath.item]
        //cell.ImageView.image = UIImage(named: "im")
        cell.ImageView.image = UIImage.init(named: (self.imageUrl[indexPath.item]) )
        //cell.ImageView.contentMode = .scaleAspectFill
        //cell.clipsToBounds = true
        
        return cell
    }
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 350)
}
}
