//
//  NetworkCall.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 09/11/21.
//

import Foundation

class NetworkCall : ObservableObject{
    @Published var moviesData = [Results]()
    func fetchData(){
        if let url = URL(string: Links.moviesApi){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                if let data = data{
                    do{
                        let result = try JSONDecoder().decode(MovieData.self, from: data)
                        if let moviesData = result.results{
                            DispatchQueue.main.async {
                                self.moviesData = moviesData
                            }
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}


class DemoClass : ObservableObject{
    @Published var dummyData:String = String()
}


