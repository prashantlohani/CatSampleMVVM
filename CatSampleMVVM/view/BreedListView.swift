//
//  BreedListView.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    var body: some View {
        List{
            ForEach(breeds){breed in
                Text(breed.name)
            }
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcherViewModel.successState().breeds)
    }
}
