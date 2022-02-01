//
//  DetailsView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 09/11/21.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    @EnvironmentObject var obj:DemoClass
    @State private var searchedItem:String = ""
    var title:String
    var poster:String
    var date:String
    var movies:[Results]?
    
    var body: some View {
        VStack{
            SearchView(searchedItem: $searchedItem)
            Image(uiImage: String.loadImage(Links.imagesPath+poster)())
                .resizable()
                .frame(width: UIScreen.main.bounds.width-20, height: 300)
                .cornerRadius(10)
                .scaledToFill()
                .fixedSize()

            HStack{
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
                Text(date)
                    .font(.system(size: 10))
                    .foregroundColor(Color("mj"))
                    .fontWeight(.semibold)
                    .padding()
            }
            Text("Upcoming Movies")
                .bold()
                .font(.system(size: 25))
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: 25, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: true, content: {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 90))], content: {
                    if let movies = self.movies{
                        ForEach(movies.filter({"\($0)".contains(searchedItem) || searchedItem.isEmpty})) { item in
                            NavigationLink(
                                destination: OutlineView(movies: movies, movieTitle: item.title),
                                label: {
                                    GridViewCell(poster: item.poster_path ?? "")
                                })
                        }
                    }
                })
            })
            .frame(width: UIScreen.main.bounds.width-20, height: 200, alignment: .center)
            Spacer()
            Text("Login User: \(obj.dummyData)")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding()
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(title: "Venom", poster: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", date: "10-11-21")
    }
}

extension String{
    func loadImage() -> UIImage {
        guard let url = URL(string: self) else {
            return UIImage()
        }
        if let data = try? Data(contentsOf: url){
            return UIImage(data: data) ?? UIImage()
        }
        return UIImage()
    }
}
