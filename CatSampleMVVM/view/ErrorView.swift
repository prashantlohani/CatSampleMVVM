//
//  ErrorView.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedfetcherVM : BreedFetcherViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedfetcherVM: BreedFetcherViewModel())
    }
}
