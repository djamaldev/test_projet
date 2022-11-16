//
//  Product.swift
//  test_tech
//
//  Created by naltise on 11/11/22.
//

import Foundation

struct Product : Decodable{
    let product_id: Int?
    let product_name: String?
    let description: String?
    let price: Int?
    let is_special_brand: Bool?
    let is_productSet: Bool?
    let c_brand: Brand?
    let images_url: ImageUrl?
}

struct ImageUrl : Decodable {
    let large : String?
    let small: String?
}

struct Brand : Decodable {
    let id : String?
    let name: String?
}
