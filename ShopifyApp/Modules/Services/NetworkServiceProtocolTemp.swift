//
//  NetworkServiceProtocol.swift
//  ShopifyApp
//
//  Created by Israa Assem on 01/06/2024.
//

import Foundation
protocol NetworkServiceProtocolTemp{
    func fetchData<T:Decodable>(url:URL,completion:@escaping(Result<T,Error>)->Void)
}
