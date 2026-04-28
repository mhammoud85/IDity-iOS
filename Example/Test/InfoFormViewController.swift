//
//  InfoFormViewController.swift
//  Test
//
//  Created by Mohamad Hammoud on 20/04/2026.
//

import UIKit
import IDity

class InfoFormViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    var infoObject = InfoObject()

    private let fields: [[FormField]] = [
        [.firstName, .lastName, .fatherName, .motherFirstName, .motherLastName],
        [.pob, .dob, .nationality, .gender],
        [.documentType, .issueDate, .expiryDate, .idNumber, .issueCountry],
        [.faceImage, .documentImage]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info Form"
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
    }
}

extension InfoFormViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return fields.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields[section].count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let field = fields[indexPath.section][indexPath.row]

        switch field {

        case .faceImage, .documentImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
            cell.configure(field: field, image: getImage(for: field))
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.configure(field: field, value: getValue(for: field))
            cell.onTextChanged = { [weak self] text in
                self?.setValue(text, for: field)
            }
            return cell
        }
    }
}

extension InfoFormViewController {

    func getValue(for field: FormField) -> String {
        switch field {
        case .firstName: return infoObject.firstName
        case .lastName: return infoObject.lastName
        case .fatherName: return infoObject.fatherName
        case .motherFirstName: return infoObject.motherFirstName
        case .motherLastName: return infoObject.motherLastName
        case .pob: return infoObject.pob
        case .dob: return infoObject.dob
        case .nationality: return infoObject.nationality
        case .gender: return infoObject.gender

        case .documentType: return infoObject.document.documentType
        case .issueDate: return infoObject.document.issueDate
        case .expiryDate: return infoObject.document.expiryDate
        case .idNumber: return infoObject.document.idNumber
        case .issueCountry: return infoObject.document.issueCountry

        default: return ""
        }
    }

    func setValue(_ value: String, for field: FormField) {
        switch field {
        case .firstName: infoObject.firstName = value
        case .lastName: infoObject.lastName = value
        case .fatherName: infoObject.fatherName = value
        case .motherFirstName: infoObject.motherFirstName = value
        case .motherLastName: infoObject.motherLastName = value
        case .pob: infoObject.pob = value
        case .dob: infoObject.dob = value
        case .nationality: infoObject.nationality = value
        case .gender: infoObject.gender = value

        case .documentType: infoObject.document.documentType = value
        case .issueDate: infoObject.document.issueDate = value
        case .expiryDate: infoObject.document.expiryDate = value
        case .idNumber: infoObject.document.idNumber = value
        case .issueCountry: infoObject.document.issueCountry = value

        default: break
        }
    }

    func getImage(for field: FormField) -> UIImage? {
        switch field {
        case .faceImage:
            return infoObject.faceImage
        case .documentImage:
            return infoObject.document.documentImage
        default:
            return nil
        }
    }
}
