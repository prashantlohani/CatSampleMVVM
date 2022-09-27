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
        VStack{
            Text("Loading Fails..")
                .font(.system(size: 48))
            Text(breedfetcherVM.errorMessage ?? "")
            
            Button{
                breedfetcherVM.fetchAllBreeds()
            }label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedfetcherVM: BreedFetcherViewModel())
    }
}
