//
//  TodoList.swift
//  CheckList
//
//  Created by Dima Opalko on 6/4/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import Foundation

class TodoList {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos: [ChecklistItem] = []
    private var mediumPriorityTodos: [ChecklistItem] = []
    private var lowPriorityTodos: [ChecklistItem] = []
    private var noPriorityTodos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "watch a movie"
        row2Item.text = "code an app"
        row3Item.text = "walk the dog"
        row4Item.text = "study design patterns"
        
        AddTodo(row0Item, for: .medium)
        AddTodo(row1Item, for: .low)
        AddTodo(row2Item, for: .high)
        AddTodo(row3Item, for: .no)
        AddTodo(row4Item, for: .high)
    }
    
    func AddTodo(_ item: ChecklistItem, for priority: Priority, at index: Int = -1){
        switch priority {
        case .high:
            if index < 0 {
                highPriorityTodos.append(item)
            } else {
                highPriorityTodos.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                mediumPriorityTodos.append(item)
            } else {
                mediumPriorityTodos.insert(item, at: index)
            }
        case .low:
            if index < 0 {
                lowPriorityTodos.append(item)
            } else {
                lowPriorityTodos.insert(item, at: index)
            }
        case .no:
            if index < 0 {
                noPriorityTodos.append(item)
            } else {
                noPriorityTodos.insert(item, at: index)
            }
        }
    }
    
    func todoList(for priority: Priority) -> [ChecklistItem] {
        switch priority {
        case .high:
           return highPriorityTodos
        case .medium:
           return mediumPriorityTodos
        case .low:
            return lowPriorityTodos
        case .no:
            return noPriorityTodos
        }
    }
    
    func newTodo() -> ChecklistItem{
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        mediumPriorityTodos.append(item)
        return item
    }
 
    
    func move(item: ChecklistItem, from sourcePriority: Priority, at sourceIndex: Int, to destinationPriority: Priority, at destinationIndex: Int){
        remove(item, from: sourcePriority, at: sourceIndex)
        AddTodo(item, for: destinationPriority, at: destinationIndex)
    }
    
    func remove(_ item: ChecklistItem, from priority: Priority, at index: Int) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    private func randomTitle() -> String {
        var titles = ["new todo", "generic todo", "fill me out", "i need something to do", "much to do about nothing"]
        
        let randomNumber = Int.random(in: 0...titles.count - 1)
        
        return titles[randomNumber]
    }
}
