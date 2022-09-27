//
//  BreedImages.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct BreedImages: View {
    let breed: Breed
    let breeds: [BreedImage]
   
    @StateObject var viewModel = ImageFetcherVM()
    private let columns = Array(repeating: GridItem(.flexible(),spacing: 1),count: 2)
    
    var body: some View {
        TabView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 1, content: {
                    ForEach(viewModel.images, id: \.self ){ images in
                        Color.gray.overlay(
                               AsyncImage(url: URL(string: images.url!)) { phase in
                                   if let image = phase.image {
                                       image.resizable()
                                           .scaledToFill()
                                           .clipped()
                                   } else if phase.error != nil {
                                       Text(phase.error?.localizedDescription ?? "error")
                                           .foregroundColor(Color.pink)
                                       Color.red // Indicates an error.
                                         
                                   } else {
                                       Image(systemName: "photo")
                                       ProgressView()
                                           .frame(width: 100, height: 100)
                                   }
                               
                               }
                               
                              ).frame(maxWidth: .infinity)
                              .aspectRatio(1, contentMode: .fit) // << for square !!
                              .clipped()
                        
                    }
                }).padding(5)
                    .onAppear(){
                        viewModel.fetchAllBreedImages(for: breed.id)
                 }
            }.tabItem{
                Text("Images")
                Image(systemName: "photo.on.rectangle")
            }
            
            HStack{
                BreedDetailView(breed: breed)
            }.tabItem{
                Text("Details")
                Image(systemName: "info.circle")
            }
            
        }
    }
}

struct BreedImages_Previews: PreviewProvider {
    static var previews: some View {
        BreedImages(breed: Breed.example() , breeds: [Breed.example1()])
    }
}
