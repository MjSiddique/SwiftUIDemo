//
//  HomeView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 09/11/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var movies = NetworkCall()
    
    var body: some View {
        List(movies.moviesData, id:\.id) { item in
            if let title = item.title, let poster = item.poster_path, let date = item.release_date{
                NavigationLink(destination: DetailsView(title: title, poster: poster, date: date, movies:movies.moviesData),
                    label: {
                        ListViewCell(title: title, poster: poster, date: date)
                    })
            }
        }
        .padding()
        .navigationBarHidden(true)
        .onAppear(){
            movies.fetchData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

