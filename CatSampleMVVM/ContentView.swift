//
//  ContentView.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedfetcherVM = BreedFetcherViewModel()
    
    var body: some View {
        if(breedfetcherVM.isLoading)
        {
            LoadingView()
        } else if(breedfetcherVM.errorMessage != nil){
            ErrorView(breedfetcherVM: breedfetcherVM)
        }
        else{
            BreedListView(breeds: breedfetcherVM.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
