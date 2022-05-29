//
//  MyTableViewCell.swift
//  ImageGallery
//
//  Created by Roie Malykin on 29/05/2022.
//

import UIKit
/// This class is a custom table view cell that holds a editable TextField for my ImageGalleryViewController
/// based on this video https://www.youtube.com/watch?v=fbjrGIXB_m8
final class MyTableViewCell: UITableViewCell, UITextFieldDelegate {
    // MARK: - Attributes
    var textField: UITextField {
        didSet { textField.delegate = self
        }
    }
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.textField = TextField()
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.placeholder = "edit me"
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textField)
        self.textField.frame = bounds // Text field is filling the cell
        
    }
    
    required init?(coder: NSCoder) {
        nil
        // fatalError("init(coder:) has not been implemented")
    }
    
 // MARK: - TextField
    
   final class TextField: UITextField {
        override var intrinsicContentSize: CGSize {
            .init(width: 80, height: 44) // Need to make theese constants or compute a proper size
        }
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            bounds.insetBy(dx: 24, dy: 0)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            bounds.insetBy(dx: 24, dy: 0)
        }
    }
  // MARK: - TextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField!) {    // delegate method
    }

    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  // delegate method
        return false
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {   // delegate method
      textField.resignFirstResponder()
        return true
    }
}
