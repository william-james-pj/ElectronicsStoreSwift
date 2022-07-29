//
//  CarouselDetailsProduct.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 25/07/22.
//

import UIKit

class CarouselDetailsProduct: UIView {
    // MARK: - Variables
    var imagens: [String] = []
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let collectionViewCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    fileprivate let pageControlCarousel: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(named: "Primary")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.pageControlCarousel.numberOfPages = self.imagens.count
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewCarousel.dataSource = self
        collectionViewCarousel.delegate = self
        
        collectionViewCarousel.register(CarouselDetailsProductCollectionViewCell.self, forCellWithReuseIdentifier: CarouselDetailsProductCollectionViewCell.resuseIdentifier)
    }
    
    // MARK: - Methods
    func settingCell(_ items: [String]) {
        self.imagens = items
        self.pageControlCarousel.numberOfPages = imagens.count
        self.collectionViewCarousel.reloadData()
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(collectionViewCarousel)
        self.addSubview(pageControlCarousel)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            collectionViewCarousel.topAnchor.constraint(equalTo: self.topAnchor),
            collectionViewCarousel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionViewCarousel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionViewCarousel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            pageControlCarousel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            pageControlCarousel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

// MARK: - extension UICollectionViewDelegate
extension CarouselDetailsProduct: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x /  self.collectionViewCarousel.frame.size.width
        if !scrollPos.isNaN {
            pageControlCarousel.currentPage = Int(scrollPos)
        }
    }
}

// MARK: - extension CollectionViewDataSource
extension CarouselDetailsProduct: UICollectionViewDataSource {    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselDetailsProductCollectionViewCell.resuseIdentifier, for: indexPath) as! CarouselDetailsProductCollectionViewCell
        cell.settingCell(self.imagens[indexPath.row])
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension CarouselDetailsProduct: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
