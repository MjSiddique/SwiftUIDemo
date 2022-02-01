//
//  SampleView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 10/11/21.
//

import SwiftUI

struct SampleView: View {
    var viewName:String
    var body: some View {
        Text(viewName)
            .font(.largeTitle)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(viewName: "Home")
    }
}
