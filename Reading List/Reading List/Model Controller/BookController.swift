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
    var books: [Book] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    // 6
    @discardableResult func createBook(title: String, reasonToRead: String, hasBeenRead: Bool) -> Book {
        // Initialize a book and return it
        let book  = Book(title: title, reasonToRead: reasonToRead)
        
        books.append(book)
        saveToPersistentStore()
        
        return book
    }
    
    // NOT DONE !
    func deleteBook(bookToDelete: Book) {
        // Passes in a Book and removes it from the books array
        saveToPersistentStore()
    }
    
    // NOT DONE !
    func updateHasBeenRead(for book: Book) {
        // Updates Book's hasBeenRead property by switching hasBeenRead from false to true or vice versa
        saveToPersistentStore()
    }
    
    // NOT DONE !
    func updateTitleAndReason() {
        // Edit a Book's title and or reasonToRead
        saveToPersistentStore()
    }
    
    // 7
    // NOT DONE !
    // returns array of read books using .filter
    var readBooks: [Book] {
        return []
    }
    
    // 8
    // same as above except for unread books
    // NOT DONE !
    var unreadBooks: [Book] {
        return []
    }
    
    
    // 3
    var readingListURL: URL? {
        
        let fileManager = FileManager.default
        
        // Go to the documents directory of our app
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let booksURL = documentsDir.appendingPathComponent("ReadingList.plist")
        
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
