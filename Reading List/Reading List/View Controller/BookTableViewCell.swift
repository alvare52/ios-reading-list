//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Jorge Alvarez on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readButtonLabel: UIButton!
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    var delegate: BookTableViewDelegate?
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        titleLabel.text = book?.title
        //readButtonLabel.imageView?.image = UIImage(named: "checked") // toggle() ?
    }
    

}


