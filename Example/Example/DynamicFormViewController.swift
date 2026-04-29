//
//  DynamicFormViewController.swift
//  Test
//
//  Created by beIN MOBILES on 23/04/2026.
//

import UIKit
import IDity

class DynamicFormViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    var infoObject = InfoObject()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        buildForm(from: infoObject)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 12
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
    
    private func buildForm(from object: Any) {
        let mirror = Mirror(reflecting: object)

        for child in mirror.children {
            guard let key = child.label else { continue }
            let value = child.value

            if let stringValue = value as? String {
                addStringField(title: key, value: stringValue)

            } else if let imageValue = value as? UIImage {
                addImageField(title: key, image: imageValue)

            } else if let obj = value as? NSObject {
                addSectionTitle(title: key)
                buildForm(from: obj) // recursion
            }
        }
    }

    private func addSectionTitle(title: String) {
        let label = UILabel()
        label.text = title.uppercased()
        label.font = .boldSystemFont(ofSize: 18)
        stackView.addArrangedSubview(label)
    }

    private func addStringField(title: String, value: String) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)

        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = value

        let container = UIStackView(arrangedSubviews: [titleLabel, textField])
        container.axis = .vertical
        container.spacing = 4

        stackView.addArrangedSubview(container)
    }

    private func addImageField(title: String, image: UIImage) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        let container = UIStackView(arrangedSubviews: [titleLabel, imageView])
        container.axis = .vertical
        container.spacing = 4

        stackView.addArrangedSubview(container)
    }
}
