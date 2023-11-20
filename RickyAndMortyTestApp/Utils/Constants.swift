//
//  Constants.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 16/11/23.
//

import SwiftUI

struct Constants {
    static let cornerRadius: CGFloat = 8
    static let defaultPadding: CGFloat = 16
    static let imageForCellWidth: CGFloat = UIScreen.main.bounds.width * 0.2
    static let imageForDetailScreenWidth: CGFloat = UIScreen.main.bounds.width * 0.6
    
    static let transitionDuration = 0.5
    
    static let imagePlaceholder = "photo"
    static let searchWithName = "Enter name"
    static let searchWithStatus = "Enter status"
    static let searchButtonTitle = "Search with params"
    static let baseUrl = "https://rickandmortyapi.com/api/"
    static let greetings = [
        "Hello!",
        "Hi there!",
        "Good morning!",
        "Good afternoon!",
        "Good evening!",
        "Hey!",
        "Howdy!",
        "Greetings!",
        "What's up?",
        "How are you doing?"
    ]
    
    static let mainBlackColor = Color("mainBlack")
    static let mainBeigeColor = Color("mainBeige")
    static let mainOrangeColor = Color("mainOrange")
    static let mainRedColor = Color("mainRed")
    
    static let xmarkCircleFill = "xmark.circle.fill"
}
