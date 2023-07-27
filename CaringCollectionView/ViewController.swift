//
//  ViewController.swift
//  CaringCollection
//
//  Created by Трифунтов Игорь on 27.07.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection"
        setupCollection()
        setupUi()
    }

    func setupCollection() {
        let collectionViewLayout = PagingCollectionViewLayout()
        collectionViewLayout.itemSize = CGSize(width: 300, height: 500)
        collectionViewLayout.minimumLineSpacing = 16
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView?.dataSource = self
        collectionView?.decelerationRate = .fast
        collectionView?.showsHorizontalScrollIndicator = false

        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    func setupUi() {
        guard let collectionView else { return }
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = .secondarySystemBackground
        cell.contentView.layer.cornerRadius = 12
        return cell
    }
}
