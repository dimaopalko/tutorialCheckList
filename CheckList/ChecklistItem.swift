
//
//  ChecklistItem.swift
//  CheckList
//
//  Created by Dima Opalko on 6/4/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
