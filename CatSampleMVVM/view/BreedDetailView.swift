//
//  BreedDetailView.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct  BreedDetailView: View {
    let breed: Breed
    let imageSize: CGFloat = 300
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    
    var body: some View {
        ScrollView {
            VStack{
                if breed.image?.url != nil{
                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: width*0.9 ,height: width*0.9)
                                .clipped()
                            
                        } else if phase.error != nil {
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                    }
                }else{
                    Color.gray.frame( height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 5){
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                        
                    Text(breed.breedExplaination)
                        .multilineTextAlignment(.leading)
                        .padding(.top,8)
                    if breed.isHairless{
                        Text("hairless")
                    }
                    Divider()
                    HStack{
                        Text("Energy Level")
                        Spacer()
                        ForEach(1..<6){ id in
                            Image(systemName: "star.fill")
                                .foregroundColor(breed.energyLevel > id ?
                                                 Color.accentColor : Color.gray)
                        }
                    }
                }
                Spacer()
            }.padding()
                .navigationBarTitleDisplayMode(.inline)
        }
        .frame(width: width*0.96)
    }


struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example())
    }
}
}
