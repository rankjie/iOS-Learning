//
//  TaskCell.swift
//  TaskIt
//
//  Created by Jeremy on 9/13/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

import Foundation
import UIKit



class TaskCell: UITableViewCell {
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
}

class unCompleteTaskCell: TaskCell {
}

class completedTaskCell: TaskCell {
}