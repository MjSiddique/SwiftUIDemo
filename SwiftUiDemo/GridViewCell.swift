//
//  GridViewCell.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 10/11/21.
//

import SwiftUI
import Kingfisher

struct GridViewCell: View {
    var poster:String
    
    var body: some View {
        KFImage(URL(string: Links.imagesPath + poster))
            .resizable()
            .frame(width: 120, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            .scaledToFill()
    }
}

struct GridViewCell_Previews: PreviewProvider {
    static var previews: some View {
        GridViewCell(poster: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg")
    }
}
