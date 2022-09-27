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
   
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BreedImages_Previews: PreviewProvider {
    static var previews: some View {
        BreedImages(breed: Breed.example() , breeds: [Breed.example1()])
    }
}
