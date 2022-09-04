//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by Семен Куницын on 24.08.2022.
//

import SwiftUI

struct EmojiRatingView: View {
    
    var rating :Int16
    
    var body: some View {
        
        
        switch rating {
        case 1:
            return Text("🤮")
        case 2:
            return Text("🥵")
        case 3:
            return Text("😳")
        case 4:
            return Text("🤭")
        case 5:
            return Text("🫠")
            
        default:
                return Text("0")
        }
        
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
