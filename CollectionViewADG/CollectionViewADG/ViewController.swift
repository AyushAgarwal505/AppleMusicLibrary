//
//  ViewController.swift
//  CollectionViewADG
//
//  Created by Ayush Agarwal on 04/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    struct ImageData {
        let name : String
        let imageName : String
        let artistName : String
    }
    
    let imageDataArray : [ImageData] = [
        ImageData(name: "Tamasha", imageName: "Tamasha", artistName: "AR Rahman"),
        ImageData(name: "Jawan", imageName: "Jawan",artistName: "Anirudh"),
        ImageData(name: "Pathaan", imageName: "Pathaan", artistName: "Vishal-Shekhar"),
        ImageData(name: "Brahmastra", imageName: "Brahmastra", artistName: "Pritam"),
        ImageData(name: "Talaash", imageName: "Talaash", artistName: "Ram Sampath"),
        ImageData(name: "Jab We Met", imageName: "Jab We Met", artistName: "Pritam"),
        ImageData(name: "Love Aaj Kal", imageName: "Love Aaj Kal", artistName: "Pritam"),
        ImageData(name: "Rockstar", imageName: "Rockstar", artistName: "AR Rahman")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        CollectionView.backgroundColor = .black
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 300)
        
        CollectionView.collectionViewLayout = layout
        
        CollectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let selectedImageData = imageDataArray[indexPath.item]
        let imageName = selectedImageData.name
        print("Selected image name: \(imageName)")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        let imageData = imageDataArray[indexPath.item]
        cell.configure(with: UIImage(named: imageData.imageName)!)
        cell.Artist.text = imageData.artistName
        cell.Name.text = imageData.name
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 220)
    }
}
