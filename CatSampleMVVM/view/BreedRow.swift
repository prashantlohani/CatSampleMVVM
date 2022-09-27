//
//  BreedRow.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize:CGFloat = 100
    var body: some View {
        HStack {
            if breed.image?.url != nil{
                CachedAsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                        Color.red // Indicates an error.
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                
                }
            }else{
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
       
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
