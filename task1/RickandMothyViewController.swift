//
//  RickandMothyViewController.swift
//  task1
//
//  Created by Lekhana on 11/12/22.
//

import UIKit
import SnapKit
import Kingfisher

class RickandMothyViewController: UIViewController {
    
    var data : [RickandMothyResult] = []
    
    var collection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(RickandMothyCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        downloadData()
        setupUI()
    }
    
    func downloadData(){
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let RichandMothyData = data {
                let json = try? JSONDecoder().decode(RickandMothyData.self, from: RichandMothyData)
                if let results = json?.results {
                    self.data = results
                    
                    DispatchQueue.main.async {
                        self.collection.reloadData()
                    }
                }
               
            }
            
        }
        task.resume()
    }
    
    func setupUI(){
       
        collection.dataSource = self
        collection.delegate = self
        self.view.addSubview(collection)
        collection.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
    }

}

extension RickandMothyViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : RickandMothyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RickandMothyCell
        
        cell.richImageView.kf.setImage(with: URL(string: data[indexPath.row].image))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}

class RickandMothyCell : UICollectionViewCell {
    
    let richImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(richImageView)
        
        richImageView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
