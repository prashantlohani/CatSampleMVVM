//
//  BreedListView.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    var filteredBreeds: [Breed]{
        if searchText.count == 0 {
            return breeds
        }else {
            return breeds.filter{ $0.name.contains(searchText)}
        }
    }
    @State private var searchText: String = ""
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredBreeds){ breed in
                    NavigationLink{
                        
                    }label: {
                        BreedRow(breed: breed)
                    }
                    
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Cat Breeds")
            .searchable(text: $searchText)
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcherViewModel.successState().breeds)
    }
}
