//
//  ImageFetcherVM.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

class ImageFetcherVM: ObservableObject{
    @Published var images = [BreedImage]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var showProgress: Bool = false

    private let api_key = "live_lJGOV2zWaC82g8Yz44b8AdkgW9TEtvNAD0i9iNeTfSRpe7zibsYnzcsZSTRv09Mu"
    private let limit = 11
    private var page = 0
    private var pagination_count : Int = 0
    private var totalValues: Int = 0
    
    let service: APIServiceProtocol
    
    init (service: APIServiceProtocol = APIService()){
        self.service = service
    }
    
    func loadMore(for breed_id: String){
        if self.totalValues <= self.pagination_count {
            fetchAllBreedImages(for: breed_id)
            showProgress = true
        }
    }
    
    func fetchAllBreedImages(for breed_id: String){
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?breed_ids=\(breed_id)&limit=\(limit)&page=\(page)&api_key=\(api_key)&order=DESC")
        self.page += 1
        
        service.fetchImages(url: url){ [unowned self] result in
            DispatchQueue.main.async {
        
                self.isLoading = false
                switch result{
                case.failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case.success(let breeds2):
                    self.pagination_count = (breeds2.first as! NSString).integerValue
                    let breeds3: [BreedImage] = breeds2.last as! [BreedImage]
                    for breed in breeds3{
                        self.images.append(breed)
                    }
                    self.totalValues = self.images.count
                
                }
            }
        }
        
    }
    
}
