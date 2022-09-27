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
       
        
    }
    
}
