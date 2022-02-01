//
//  LoaderView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 09/11/21.
//

import SwiftUI
import ActivityIndicatorView

struct LoaderView: View {
    @Binding var isOn: Bool
    var body: some View {
        ActivityIndicatorView(isVisible: $isOn, type: .rotatingDots)
            .frame(width: 60.0, height: 60.0)
            .foregroundColor(.init("mj"))
            .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isOn: .constant(false))
    }
}

