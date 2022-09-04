//
//  DetailView.swift
//  BookWorm
//
//  Created by Семен Куницын on 24.08.2022.
//

import SwiftUI





struct DetailView: View {
    
    let book : Book
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @State private var showingDeleteAlert = false
    
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -20, y: -20)
                    
                
            }
            Text(book.author ?? "Unknown book")
                .font(.title)
                .foregroundColor(.secondary)
            Text(book.review ?? "No review")
                .padding()
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            Spacer()
            Button("Delete book", role: .destructive) {
                deleteBook()
            }.padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
    
    func deleteBook(){
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}


