//
//  ImageCell.swift
//  Test
//
//  Created by Mohamad Hammoud on 20/04/2026.
//

import UIKit

class ImageCell: UITableViewCell {

    let imgView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        imgView.frame = CGRect(x: 16, y: 8, width: 60, height: 60)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true

        contentView.addSubview(imgView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(field: FormField, image: UIImage?) {
        imgView.image = image
        textLabel?.text = "\(field)"
    }
}
