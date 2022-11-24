//
//  ScoreView.swift
//  Kuchi
//
//  Created by Baris Karalar on 22.11.22.
//

import SwiftUI

struct ScoreView: View {
    
    let numberOfQuestions: Int
    
    @Binding var numberOfAnswered: Int

    
    var body: some View {
        
        Button {
            numberOfAnswered += 1
            print("\(numberOfAnswered)")
        } label: {
            HStack {
                Text("\(numberOfAnswered)/\(numberOfQuestions)")
                    .font(.caption)
                    .padding(4)
                Spacer()
            }
        }

        
        
        
        
    }
}


struct ScoreView_Previews: PreviewProvider {
    
    @State static var numberOfAnswered: Int = 0
    
    static var previews: some View {
        ScoreView(numberOfQuestions: 5, numberOfAnswered: $numberOfAnswered)
    }
}
