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
    
    let service: APIServiceProtocol
    
    init (service: APIServiceProtocol = APIService()){
        self.service = service
       fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
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

static func errorState() -> BreedFetcherViewModel{
   let fetcher = BreedFetcherViewModel()
   fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
   return fetcher
}
   static func successState() -> BreedFetcherViewModel{
       let fetcher = BreedFetcherViewModel()
       fetcher.breeds = [Breed.example(), Breed.example()]
       return fetcher
   }
}
