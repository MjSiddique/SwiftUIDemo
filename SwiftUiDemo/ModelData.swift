//
//  ModelData.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 09/11/21.
//

import Foundation

struct Links{
    static let moviesApi = "https://api.themoviedb.org/3/movie/popular?api_key=f4d7e6aded05cabd0a316d1b3964e5d7&language=en-US&page=1"
    static let imagesPath = "https://image.tmdb.org/t/p/w500"
}

struct MovieData : Codable {
    let page : Int?
    let results : [Results]?
    let total_results : Int?
    let total_pages : Int?
}

struct Results : Codable, Identifiable {
    let poster_path : String?
    let adult : Bool?
    let overview : String?
    let release_date : String?
    let genre_ids : [Int]?
    let id : Int?
    let original_title : String?
    let original_language : String?
    let title : String?
    let backdrop_path : String?
    let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let vote_average : Float?
}


struct ItemList: Identifiable {
    let id = UUID()
    let name:String
    let icon:String
    var child: [ItemList]?
    
    static func getData() -> [ItemList]{
        let emojis = [ItemList(name: "Smile", icon: "😆"), ItemList(name: "Shoke", icon: "🙄"), ItemList(name: "React", icon: "😳"), ItemList(name: "Masti", icon: "😜")]
        let animals = [ItemList(name: "Dog", icon: "🐶"), ItemList(name: "Panda", icon: "🐻‍❄️"), ItemList(name: "Cat", icon: "🦊")]
        let fruits = [ItemList(name: "Apple", icon: "🍎"), ItemList(name: "Strawberry", icon: "🍓"), ItemList(name: "Orange", icon: "🍊"), ItemList(name: "Corn", icon: "🌽")]
        return [ItemList(name: "Emoji", icon: "", child: emojis), ItemList(name: "Animals", icon: "", child: animals), ItemList(name: "Fruits", icon: "", child: fruits)]
    }
}

