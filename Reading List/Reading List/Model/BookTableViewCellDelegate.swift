//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Jorge Alvarez on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewDelegate {
    
    func toggleHasBeenRead(for cell: BookTableViewCell)
    
}

