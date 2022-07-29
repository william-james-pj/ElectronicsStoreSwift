//
//  ProfileViewController.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 19/07/22.
//

import UIKit

struct ConfigModel {
    let text: String
    let imageName: String
}

class ProfileViewController: UIViewController {
    // MARK: - Constrants
    let data: [ConfigModel] = [
        ConfigModel(text: "Edit personal info", imageName: "list.bullet.rectangle.fill"),
        ConfigModel(text: "Orders", imageName: "cart.fill"),
        ConfigModel(text: "Addresses", imageName: "mappin.circle.fill"),
        ConfigModel(text: "Payments", imageName: "creditcard.fill"),
    ]
    
    // MARK: - Variables
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackBaseAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackHeader: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let topBar: ScreenHeader = {
        let screenHeader = ScreenHeader()
        screenHeader.title = "Profile"
        return screenHeader
    }()
    
    fileprivate let viewImageProfileContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewImageShadow: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.image = UIImage(named: "avatar")
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let labelName: UILabel = {
        let label = UILabel()
        label.text = "Joãozinho"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let tableViewConfig: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.bounces = false
        table.allowsSelection = false
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = UIColor(named: "Backgroud")
        buildHierarchy()
        buildConstraints()
        setupTable()
    }
    
    fileprivate func setupTable() {
        tableViewConfig.dataSource = self
        tableViewConfig.delegate = self
        
        tableViewConfig.register(ConfigTableViewCell.self, forCellReuseIdentifier: ConfigTableViewCell.resuseIdentifier)
    }

    // MARK: - Methods
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(stackHeader)
        
        stackHeader.addArrangedSubview(topBar)
        stackHeader.addArrangedSubview(viewImageProfileContainer)
        viewImageProfileContainer.addSubview(viewImageShadow)
        viewImageProfileContainer.addSubview(imageViewProfile)
        stackHeader.addArrangedSubview(labelName)
        
        stackBase.addArrangedSubview(tableViewConfig)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewImageProfileContainer.heightAnchor.constraint(equalToConstant: 100),
            
            viewImageShadow.widthAnchor.constraint(equalToConstant: 100),
            viewImageShadow.heightAnchor.constraint(equalToConstant: 100),
            viewImageShadow.centerXAnchor.constraint(equalTo: viewImageProfileContainer.centerXAnchor),
            viewImageShadow.centerYAnchor.constraint(equalTo: viewImageProfileContainer.centerYAnchor),
            
            imageViewProfile.widthAnchor.constraint(equalToConstant: 80),
            imageViewProfile.heightAnchor.constraint(equalToConstant: 80),
            imageViewProfile.centerXAnchor.constraint(equalTo: viewImageProfileContainer.centerXAnchor),
            imageViewProfile.centerYAnchor.constraint(equalTo: viewImageProfileContainer.centerYAnchor),
        ])
    }
}

// MARK: - extension UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
}

// MARK: - extension UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConfigTableViewCell.resuseIdentifier, for: indexPath) as! ConfigTableViewCell
        cell.settingCell(self.data[indexPath.row])
        return cell
    }
}
