//
//  BreedFetcherViewModel.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import Foundation

class BreedFetcherViewModel: ObservableObject{
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init(){
       fetchBreeds()
    }
    
    func fetchBreeds() {
        isLoading = true
        errorMessage = nil
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
        
        let task = URLSession.shared.dataTask(with: url) {[unowned self] (data, response, error) in
            
            DispatchQueue.main.async {
            self.isLoading = false
            }
            let decoder = JSONDecoder()
            if let data = data {
                do{
                    let breeds = try decoder.decode([Breed].self, from: data)
                    print(breeds)
                    
                    DispatchQueue.main.async {
                        self.breeds = breeds
                    }
                   
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
