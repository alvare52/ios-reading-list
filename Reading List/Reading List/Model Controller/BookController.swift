//
//  BookController.swift
//  Reading List
//
//  Created by Jorge Alvarez on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    // CRUD - Create Read Update Delete

    // 2
    var books: [Book] = [Book(title: "Jaws", reasonToRead: "its cool"), Book(title: "Jaws 2", reasonToRead: "yes")]
    
    init() {
        loadFromPersistentStore()
    }
    
    // 6
    @discardableResult func createBook(title: String, reasonToRead: String, hasBeenRead: Bool) -> Book {
        // Initialize a book and return it
        var book  = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        
        books.append(book)
        saveToPersistentStore()
        
        return book
    }
    
    // NOT DONE !
    func deleteBook(bookToDelete: Book) {
        // Passes in a Book and removes it from the books array
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(for book: Book) {
        // Updates Book's hasBeenRead property by switching hasBeenRead from false to true or vice versa
        if book.hasBeenRead {
            book.hasBeenRead = false
        }
        else {
            book.hasBeenRead = true
        }
        saveToPersistentStore()
    }
    
    // NOT DONE !
    func updateTitleAndReason() {
        // Edit a Book's title and or reasonToRead
        saveToPersistentStore()
    }
    
    var readBooks: [Book] {
        return books.filter {$0.hasBeenRead}
    }
    
    var unreadBooks: [Book] {
        return books.filter {$0.hasBeenRead == false}
    }
    
    
    // 3
    var readingListURL: URL? {
        
        let fileManager = FileManager.default
        
        // Go to the documents directory of our app
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let booksURL = documentsDir.appendingPathComponent("readinglist.plist")
        
        return booksURL
    }
    
    // 4
    // Saving function
    func saveToPersistentStore() {
        
        // Make sure the fileURL exists, otherwise we can't save the books there
        guard let fileURL = readingListURL else {return}
        
        do {
            
            let encoder = PropertyListEncoder()
            
            let booksData = try encoder.encode(books)
            
            try booksData.write(to: fileURL)
            
        } catch {
            print("Error saving stars: \(error)")
        }
        
    }
    
    // 5
    // Loading function
    func loadFromPersistentStore() {
        
        guard let fileURL = readingListURL else {return}
        
        do {
            let booksData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let booksArray = try decoder.decode([Book].self, from: booksData)
            
            self.books = booksArray
            
        } catch {
            print("Error loading stars from plist: \(error)")
        }
        
    }
    
    
    
}
