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
        let service = APIService()
        isLoading = true
        errorMessage = nil
            
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        service.fetchBreeds(url: url){ [unowned self] result in
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result{
                case.failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case.success(let breeds):
                    self.breeds = breeds
                    print("Success Response is:",breeds)
                }
            }
        }
    }
}
