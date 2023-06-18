//
//  ChoiseWheelCell.swift
//  Crazy time
//
//  Created by Вадим on 15.05.2023.
//

import UIKit

class ChoiseWheelCell: UICollectionViewCell {
    
    var value: String?
    var index: Int?
    var soundNumber: Float?
    var musicNumber: Float?
    
    static let identifier = "myCell"
    
    func setImage(image: String) {
        button.setBackgroundImage(UIImage(named: image), for: .normal)
    }
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        addConstraint()
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc func buttonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        self.window?.rootViewController = UINavigationController(rootViewController: GameWheelViewController(
            value: value!,
            wheel: index!,
            soundNumber: soundNumber!,
            musicNumber: musicNumber!,
            tag: 1,
            bidNums: [0,0,0,0,0,0,0,0],
            bidDict: [:],
            income: "0",
            changeValue: 0,
            betSum: 0,
            bet: "10"))
    }
        
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
