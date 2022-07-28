//
//  ConfigTableViewCell.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 28/07/22.
//

import UIKit

class ConfigTableViewCell: UITableViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "ConfigTableViewCell"
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(named: "Disabled")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let imageViewArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right.circle")
        imageView.tintColor = UIColor(named: "Disabled")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let labelText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let separationLineFooter = SeparationLine()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func settingCell(_ item: ConfigModel) {
        self.labelText.text = item.text
        self.imageViewIcon.image = UIImage(systemName: item.imageName)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImageContainer)
        viewImageContainer.addSubview(imageViewIcon)
        stackBase.addArrangedSubview(labelText)
        self.addSubview(separationLineFooter)
        self.addSubview(imageViewArrow)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            viewImageContainer.widthAnchor.constraint(equalToConstant: 25),
            
            imageViewIcon.widthAnchor.constraint(equalToConstant: 25),
            imageViewIcon.centerXAnchor.constraint(equalTo: viewImageContainer.centerXAnchor),
            imageViewIcon.centerYAnchor.constraint(equalTo: viewImageContainer.centerYAnchor),
            
            separationLineFooter.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separationLineFooter.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separationLineFooter.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageViewArrow.widthAnchor.constraint(equalToConstant: 25),
            imageViewArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageViewArrow.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

}
