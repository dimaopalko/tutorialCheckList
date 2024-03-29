//
//  ItemTableViewController.swift
//  CheckList
//
//  Created by Dima Opalko on 6/5/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController {

    weak var delegate: ItemDetailViewControllerDelegate?
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit, let text = textfield.text {
            item.text = text
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else {
            if let item = todoList?.newTodo() {
            if let textFieldText = textfield.text {
                item.text = textFieldText
            }
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    }
    override func viewDidLoad() {
        if let item = itemToEdit {
            title = "Edit Item"
            textfield.text = item.text
            addBarButton.isEnabled = true
        }
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Add Item"
    }
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ItemDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
