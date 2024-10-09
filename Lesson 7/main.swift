//
//  main.swift
//  Lesson 7
//
//  Created by Evgeny Mastepan on 09.10.2024.
//

import Foundation

struct Motorcycles {
    enum TypeOfMoto {
        case sport
        case sporttouring
        case street
        case cruiser
        case chopper
        case enduro
        case touring
    }
    var brand: String
    var engine: Int
    var type: TypeOfMoto
    
    func printThis () {
        print("Мотоцикл марки \(brand), типа \(type), с двигателем объемом \(engine)")
    }
}

let harley = Motorcycles(brand: "Harley Davidson", engine: 1700, type: .cruiser)

harley.printThis()
