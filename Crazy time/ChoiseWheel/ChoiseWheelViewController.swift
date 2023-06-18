//
//  ChoiseWheelViewController.swift
//  Crazy time
//
//  Created by Вадим on 15.05.2023.
//

import UIKit

final class ChoiseWheelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    var value: String
    var index: Int
    var soundNumber: Float
    var musicNumber: Float
    
    init(value: String, index: Int, soundNumber: Float, musicNumber: Float) {
        self.value = value
        self.index = index
        self.soundNumber = soundNumber
        self.musicNumber = musicNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    let data = [
        Data(image: "Wheel #1-54"),
        Data(image: "Wheel #2-50"),
        Data(image: "Wheel #3-46"),
        Data(image: "Wheel #4-45")]
    
    private let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let comeBack: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Come back_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(comeBackPressed), for: .touchUpInside)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        return button
    }()
    
    private let fortune: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheel of  fortune")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstarints()
        setCollectionViewConfigure()
        
    }
    
    private func setSubviews() {
        view.addSubview(background)
        view.addSubview(comeBack)
        background.addSubview(fortune)
        view.addSubview(collectionView)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            comeBack.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(55)),
            comeBack.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: Constants.setSizeY(15)),
            comeBack.widthAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            comeBack.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            fortune.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: Constants.setSizeY(160)),
            fortune.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(55)),
            fortune.widthAnchor.constraint(equalToConstant: Constants.setSizeY(160)),
            fortune.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            collectionView.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(160)),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.setSizeY(35)),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.setSizeY(-35)),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setCollectionViewConfigure() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ChoiseWheelCell.self, forCellWithReuseIdentifier: ChoiseWheelCell.identifier)
    }
    
    @objc func comeBackPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
            value: value,
            index: index,
            soundNumber: soundNumber,
            musicNumber: musicNumber))
    }
}

extension ChoiseWheelViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoiseWheelCell.identifier, for: indexPath) as! ChoiseWheelCell
        cell.setImage(image: data[indexPath.row].image)
        cell.value = value
        cell.index = indexPath.row
        cell.soundNumber = soundNumber
        cell.musicNumber = musicNumber
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = Constants.setSizeY(310)
        let cellHeight = Constants.setSizeY(310)
        return CGSize(width: cellWidth, height: cellHeight)
    }

}

