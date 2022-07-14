//
//  ContentView.swift
//  BreakingBadCharacters
//
//  Created by Eymen Varilci on 14.07.2022.
//

import SwiftUI


struct Characters : Codable {
    
    let char_id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let appearance: [Int]
    let nickname: String
    let portrayed: String
    
}


struct ContentView: View {
    
    @State private var characters = [Characters]()
    
    var body: some View {
        
        NavigationView {
            List(characters, id: \.char_id) { char in
                VStack(alignment: .leading) {
                    Text(char.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(char.portrayed)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
            }
            .navigationTitle("All Characters")
            .task{
                await fetchCharacters()
            }
        }
    }
    
    
    func fetchCharacters() async {
        
        // URL
        
        guard let url = URL(string: "https://www.breakingbadapi.com/api/characters") else {
            
            dump("link broken")
            return
        }
        //fetching data from url
        
        do{
            
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Characters].self, from: data) {
                characters = decodedResponse
            }
            
        } catch {
            dump("can't fetch result")
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
