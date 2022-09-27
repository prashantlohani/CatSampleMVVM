//
//  APIServiceProtocol.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import Foundation

protocol APIServiceProtocol{
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
