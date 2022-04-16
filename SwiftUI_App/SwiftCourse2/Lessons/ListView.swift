//
//  ListView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct Music: Identifiable {
    let id = UUID()
    let name: String
}

struct MusicRow: View {
    
    var music: Music
    
    var body: some View {
        Text("\(music.name)")
    }
}

struct ListView: View {
    
    var body: some View {
        let first = Music(name: "rap")
        let second = Music(name: "rock")
        let third = Music(name: "classical")
        let musics = [first, second, third]
        
        List(musics) { music in
            MusicRow(music: music)
        }
    }
}
