//
//  TextFieldCell.swift
//  Test
//
//  Created by Mohamad Hammoud on 20/04/2026.
//

import UIKit

class TextFieldCell: UITableViewCell {

    let textField = UITextField()
    var onTextChanged: ((String) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textField.frame = contentView.bounds.insetBy(dx: 16, dy: 8)
        textField.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)

        contentView.addSubview(textField)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(field: FormField, value: String) {
        textField.placeholder = "\(field)"
        textField.text = value
    }

    @objc private func textChanged() {
        onTextChanged?(textField.text ?? "")
    }
}
