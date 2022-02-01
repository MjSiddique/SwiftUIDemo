//
//  ContentView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 08/11/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var demo = DemoClass()
    @State private var userName:String = String()
    @State private var password:String = String()
    @State private var isOn: Bool = false
    @State private var loginTapped = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image("siddiqui")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .clipShape(Circle())
                        .padding()
                    Text("SwiftUI Practice")
                        .foregroundColor(.init("mj"))
                        .font(.system(size: 32))
                        .fontWeight(.semibold)
                }
                Spacer()
                    .frame(width: 0, height: 150, alignment: .center)
                TextField("UserName", text: $demo.dummyData)
                    .textContentType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .disableAutocorrection(true)
                    .font(.system(size: 25))
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .font(.system(size: 25))
                
                Spacer()
                    .frame(width: 0, height: 150, alignment: .center)
                NavigationLink(
                    destination: HomeView(),
                    isActive: $loginTapped,
                    label: {
                        Button(action: {
                            self.isOn.toggle()
                            DispatchQueue.global().async {
                                sleep(UInt32(5.0))
                                self.isOn.toggle()
                                self.loginTapped = true
                            }
                        }, label: {
                            Text("Button")
                                .font(.system(size: 28))
                                .fontWeight(.semibold)
                                .padding(.init(top: 5, leading: 20, bottom: 5, trailing: 20))
                                .background(Color("mj"), alignment: .center)
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        })
                    })
                .navigationBarHidden(true)
                Spacer()
                LoaderView(isOn: $isOn)
            }
        }.environmentObject(demo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
