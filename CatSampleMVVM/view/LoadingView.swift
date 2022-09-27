//
//  LoadingView.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("Loading......").font(.system(size: 48))
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
