//
//  ListViewCell.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 09/11/21.
//

import SwiftUI
import Kingfisher

struct ListViewCell: View {
    var title:String
    var poster:String
    var date:String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15, content: {
            KFImage(URL(string: Links.imagesPath+poster))
                .resizable()
                .frame(width: 120, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .scaledToFill()
                
            VStack(alignment: .leading, spacing: 10, content: {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Text(date)
                    .font(.system(size: 10))
                    .foregroundColor(Color("mj"))
                    .fontWeight(.semibold)
            })
        })
    }
}

//struct ListViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ListViewCell()
//    }
//}
