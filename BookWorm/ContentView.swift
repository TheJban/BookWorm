//
//  ContentView.swift
//  BookWorm
//
//  Created by Семен Куницын on 24.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [
       // SortDescriptor(\.title, order: .reverse)  // Sorting by title desc
        SortDescriptor(\.title),
        SortDescriptor(\.author)

        
        
        
    ]) var books : FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        
        
        NavigationView{
            
            List{
                ForEach(books) { book in
                    NavigationLink {
                        
                        DetailView(book: book)
                        
                    }label: {
                        HStack{
                            EmojiRatingView(rating: book.rating).font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "unknown title")
                                    .font(.headline)
                                
                                Text(book.author ?? "unknown author")
                                    .foregroundColor(.secondary)
                                
                            }
                        }
                    }
                }.onDelete(perform: deleteBook(at:))
                if books.count == 0 {
                    Text("No book found")
                }
            }
                
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(){
                            showingAddScreen.toggle()
                        }label: {
                            Label("AddBook",systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddBookView()
                }
            }
        }
    
    func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            let book = books[index]
            moc.delete(book)
        }
        try? moc.save()
    }
    
    
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
