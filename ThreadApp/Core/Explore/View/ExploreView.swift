//
//  SearchView.swift
//  ThreadApp
//
//  Created by Obaro Paul on 01/05/2024.
//

import SwiftUI

struct ExploreView: View {

    @StateObject var exploreModel = ExploreViewModel()
    @State var searchText:String = ""
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(exploreModel.users){user in
                        UserCell()
                    }
                }
            }.searchable(text: $searchText)
                .navigationTitle("Search")
        }
    }
}

#Preview {
    ExploreView()
}
