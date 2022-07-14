//
//  CharactersDetailView.swift
//  BreakingBadCharacters
//
//  Created by Eymen Varilci on 14.07.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharactersDetailView: View {
    
    var detail: Characters
    
    var body: some View {

       
        VStack(spacing: 20) {
            Spacer()
            
            Text(detail.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
                .fontWeight(.bold)
                .padding()
            
            AnimatedImage(url: URL(string: detail.img))
                .resizable()
                .scaledToFit()
                .frame( height: 280)
                .padding()
                .cornerRadius(10)
            Spacer()
            HStack {
                Text("nickname: ")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    
                Text(detail.nickname)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                .padding(10)
            }
                
            HStack {
                Text("birthday: ")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)

                Text(detail.birthday)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(10)
            }
            HStack {
                Text("Played by: ")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Text(detail.portrayed)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(10)
            }
            Spacer()
            
        }
    }
}









struct CharactersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersDetailView(detail: .init(char_id: 1, name: "Deneme", birthday: "06/03/1997", occupation: ["String",""], img: "", status: "", appearance: [2], nickname: "HE-MAN", portrayed: "Eymen Varilci"))
    }
}


