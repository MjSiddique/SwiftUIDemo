//
//  OutlineView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 10/11/21.
//

import SwiftUI
import Kingfisher

struct OutlineView: View {
    var movies:[Results]?
    var movieTitle:String?
    
    var body: some View {
        VStack{
            ForEach(ItemList.getData(), id: \.id) { item in
                OutlineGroup(item, children: \.child) { data in
                    Text("\(data.icon)   \(data.name)")
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width-40, height: 30, alignment: .leading)
        
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            
            DisclosureGroup("Popular Movies") {
                ScrollView(.horizontal, showsIndicators: true, content: {
                    LazyHGrid(rows: [GridItem(.flexible())], content: {
                        if let movies = self.movies{
                            ForEach(movies) { item in
                                GridViewCell(poster: item.poster_path ?? "")
                            }
                        }
                    })
                })
                .frame(width: UIScreen.main.bounds.width-20, height: 100, alignment: .center)
                
                DisclosureGroup("Upcoming Movies"){
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        LazyHGrid(rows: [GridItem(.flexible())], content: {
                            if let movies = self.movies{
                                ForEach(movies) { item in
                                    GridViewCell(poster: item.poster_path ?? "")
                                }
                            }
                        })
                    })
                    .frame(width: UIScreen.main.bounds.width-20, height: 100, alignment: .center)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
        }
    }
}

struct OutlineView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineView()
    }
}

