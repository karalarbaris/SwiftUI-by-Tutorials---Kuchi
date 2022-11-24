//
//  ScoreView.swift
//  Kuchi
//
//  Created by Baris Karalar on 22.11.22.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var numberOfQuestions: Int
    
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
    
    @State static var numberOfQuestions: Int = 6
    @State static var numberOfAnswered: Int = 0
    
    static var previews: some View {
        ScoreView(numberOfQuestions: $numberOfQuestions, numberOfAnswered: $numberOfAnswered)
    }
}
