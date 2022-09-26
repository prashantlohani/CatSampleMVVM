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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed]())
    }
}
