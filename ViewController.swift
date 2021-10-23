//
//  ViewController.swift
//  ios_lab
//
//  Created by - on 20.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
     let cellWidth = (3 / 4) * UIScreen.main.bounds.width
     let cellHeight = (4 / 8) * UIScreen.main.bounds.height
     let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
     let cellSpacing = (1 / 8) * UIScreen.main.bounds.width
     
     let images: [UIImage] = [
        UIImage(named:"ironman")!,
        UIImage(named: "cap")!,
        UIImage(named:"spiderman")!
     ]
    
     let labels: [String] = ["Iron Man", "Captain America", "Spider Man"]
     let cellId = "cell id"
     
     lazy var collectionView: UICollectionView = {
         let layout = PagingCollectionViewLayout()
         layout.scrollDirection = .horizontal
         layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
         layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
         layout.minimumLineSpacing = cellSpacing
        
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.showsHorizontalScrollIndicator = false
         collectionView.decelerationRate = .fast
         collectionView.dataSource = self
         collectionView.backgroundColor = nil
         return collectionView
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
               registerCollectionViewCells()
               applyConstraints()
    }

           private func registerCollectionViewCells() {
               collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
           }
           
           private func applyConstraints() {
               view.addSubview(collectionView)
               collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
               collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
               collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
           }
       }

       extension ViewController: UICollectionViewDataSource {
           
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return images.count
           }
           
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
               
               let imageView = UIImageView()
               let image = images[indexPath.item]
               imageView.image = image
               imageView.contentMode = .scaleAspectFill
               cell.backgroundView = imageView
               
               let labl = labels[indexPath.item]
               let name = UILabel(frame: CGRect (x: 0, y: cell.bounds.maxY - 50, width: cell.bounds.size.width, height: 40))
               name.text = labl
               name.textColor = .white
               name.font = name.font.withSize(30)
               name.textAlignment = .center
               cell.contentView.addSubview(name)
               
               return cell
           }
           
    }
