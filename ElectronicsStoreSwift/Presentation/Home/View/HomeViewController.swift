//
//  HomeViewController.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 19/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Constrants
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
    
    fileprivate let collectionViewHome: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
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
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewHome.dataSource = self
        collectionViewHome.delegate = self
        
        collectionViewHome.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCollectionViewCell.resuseIdentifier)
        collectionViewHome.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: HotSalesCollectionViewCell.resuseIdentifier)
        collectionViewHome.register(RecentlyViewedCollectionViewCell.self, forCellWithReuseIdentifier: RecentlyViewedCollectionViewCell.resuseIdentifier)
        collectionViewHome.register(DiscoverCollectionViewCell.self, forCellWithReuseIdentifier: DiscoverCollectionViewCell.resuseIdentifier)
        collectionViewHome.register(DiscoverCellCollectionViewCell.self, forCellWithReuseIdentifier: DiscoverCellCollectionViewCell.resuseIdentifier)
    }

    // MARK: - Methods
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(collectionViewHome)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

// MARK: - extension UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
}

// MARK: - extension CollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3: //Header & Hot sales & Recently Viewed & Discover Header
            return 1
            
        case 4: //Discover Items
            return 6
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        
        switch indexPath.section {
        case 0: //Header
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.resuseIdentifier, for: indexPath)
            return cell
            
        case 1: //Hot sales
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCollectionViewCell.resuseIdentifier, for: indexPath)
            return cell
            
        case 2: //Recently Viewed
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyViewedCollectionViewCell.resuseIdentifier, for: indexPath)
            return cell
            
        case 3: //Discover Header
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCollectionViewCell.resuseIdentifier, for: indexPath)
            return cell
            
        case 4: //Discover Items
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCellCollectionViewCell.resuseIdentifier, for: indexPath)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.resuseIdentifier, for: indexPath)
            return cell
        }
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
//        let height = collectionView.frame.height
        
        switch indexPath.section {
        case 0: //Header
            return CGSize(width: width, height: 166)
            
        case 1: //Hot sales
            return CGSize(width: width, height: 250)
            
        case 2: //Recently Viewed
            return CGSize(width: width, height: 260)
            
        case 3: //Discover Header
            return CGSize(width: width, height: 15)
            
        case 4: //Discover Items
            return CGSize(width: (width / 2) - 10, height: 200)
            
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
}

