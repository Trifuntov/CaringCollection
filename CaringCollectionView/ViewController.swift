//
//  ViewController.swift
//  CaringCollection
//
//  Created by Трифунтов Игорь on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: PagingCollectionViewLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection"
        setupCollection()
        setupUi()
    }

    private func setupCollection() {
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    private func setupUi() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
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
