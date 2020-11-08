//
//  AddBookView.swift
//  Bookworm
//
//  Created by denpazakura on 05/11/2020.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    @State private var showNoGenreAlert = false
    @State private var showingAddScreen = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        self.saveBook()
                    }
                }
            }
            .navigationBarTitle("Add Book")
            .alert(isPresented: $showNoGenreAlert) {
                Alert.init(title: Text("No genre selected"), message: Text("Please select any genre"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

private extension AddBookView {
    func saveBook() {
        let newBook = Book(context: self.moc)
        newBook.title = self.title
        newBook.author = self.author
        newBook.rating = Int16(self.rating)
        newBook.genre = self.genre
        newBook.review = self.review
        newBook.date = Date()
        
        if self.genre.isEmpty {
            showNoGenreAlert = true
        } else {
            try? self.moc.save()
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
