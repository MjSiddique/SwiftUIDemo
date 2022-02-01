//
//  SearchView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 10/11/21.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchedItem:String
    
    var body: some View {
        HStack{
            TextField("Search Here...", text: $searchedItem)
                .textContentType(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(15)
                .padding(.horizontal, 15)
                .disableAutocorrection(true)
                .font(.system(size: 20))
                .overlay(HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 5)
                })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchedItem: .constant(""))
    }
}
